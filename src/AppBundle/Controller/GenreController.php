<?php
/**
 * Created by PhpStorm.
 * User: Luk
 * Date: 07/01/2017
 * Time: 17:05
 */

namespace AppBundle\Controller;


use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use AppBundle\Entity\Genre;
use AppBundle\Entity\Film;

class GenreController extends Controller{

    /**
     * @Route("/genre/", name="show_genre")
     */

    public function showAction(Request $request) {

        //$genre = $this->getDoctrine()->getRepository('AppBundle:Genre')->findByName($request->query->get('name', 'Akcja'));


        $em = $this->getDoctrine()->getManager();
        $query = $em->createQuery(
            'SELECT f
              FROM AppBundle:Film f
              JOIN f.genres g
              WHERE g.name = :genre
              ORDER BY f.date DESC '
        )->setParameter('genre', $request->query->get('name', 'Akcja'));


        //$genres = $this->getDoctrine()->getRepository('AppBundle:Film')->findByIdJoinedToGenre($request->query->get('name', 'Akcja'));
        //$request->query->get('name', 'Akcja');

        $paginator  = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
            $query , /* query NOT result */
            $request->query->getInt('page', 1)/*page number*/,
            $request->query->getInt('limit', 5)/*limit per page*/
        );

        return $this->render('genre/show.html.twig',array(

            'films' => $pagination,
            'title' => $request->query->get('name', 'Akcja')

        ));

    }


}