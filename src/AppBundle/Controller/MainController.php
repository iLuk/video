<?php
/**
 * Created by PhpStorm.
 * User: Luk
 * Date: 13/11/2016
 * Time: 15:03
 */

namespace AppBundle\Controller;


use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use AppBundle\Entity\Film;

class MainController extends Controller
{

    /**
     * @Route("/", name="homepage")
     */

    public function showAction(){

        $genres = $this->getDoctrine()->getRepository('AppBundle:Genre')->findAll();


        $em = $this->getDoctrine()->getManager();
        $query = $em->createQuery(
        'SELECT p
         FROM AppBundle:Film p
         ORDER BY p.date DESC')
         ->setMaxResults(8);

        $film = $query->getResult();

        return $this->render('homepage.html.twig', array(

            'film' => $film,
            'genres' => $genres

        ));
    }


}