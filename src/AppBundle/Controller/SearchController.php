<?php
/**
 * Created by PhpStorm.
 * User: Luk
 * Date: 07/01/2017
 * Time: 21:05
 */

namespace AppBundle\Controller;


use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use AppBundle\Entity\Film;

class SearchController extends Controller{

    /**
     * @Route("/video/search/", name="search")
     */

    public function showAction(Request $request) {

        $em = $this->getDoctrine()->getManager();
        $repository = $em->getRepository('AppBundle:Film');

        $what = $request->get('name');

        $results = $repository->createQueryBuilder('a')
            ->where("SOUNDEX(a.title) LIKE SOUNDEX(:search)")
            ->orWhere("SOUNDEX(a.subtitle) LIKE SOUNDEX(:search)")
            // To use SOUNDEX with another methods like MATCH_AGAINST
            // You can use the orWhere('SOUN....') clause instead of where
            // In case that you don't want to use parameter, you can set directly the string into the query
            //->where("SOUNDEX(a.table_field) LIKE SOUNDEX('%Title to search mispillid%')")
            ->setParameter('search',$what)
            ->getQuery()
            ->getResult();

        $paginator  = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
            $results , /* query NOT result */
            $request->query->getInt('page', 1)/*page number*/,
            $request->query->getInt('limit', 5)/*limit per page*/
        );

        return $this->render('video/search.html.twig',array(

            'films' => $pagination,
            'what' => $what

        ));

    }

}