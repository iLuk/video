<?php
/**
 * Created by PhpStorm.
 * User: Luk
 * Date: 08/01/2017
 * Time: 13:55
 */

namespace AppBundle\Controller;


use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;

class FilmListController extends Controller{

    /**
     * @Route("/films", name="show_films")
     */

    public function showAction(Request $request) {

        $em = $this->getDoctrine()->getManager();
        $query = $em->createQuery(
            'SELECT f
              FROM AppBundle:Film f
              ORDER BY f.title ASC '
        );

        $paginator  = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
            $query , /* query NOT result */
            $request->query->getInt('page', 1)/*page number*/,
            $request->query->getInt('limit', 5)/*limit per page*/
        );

        return $this->render('showfilms.html.twig',array(

            'films' => $pagination

        ));

    }


}