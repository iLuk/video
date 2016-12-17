<?php
/**
 * Created by PhpStorm.
 * User: Luk
 * Date: 13/11/2016
 * Time: 16:27
 */

namespace AppBundle\Controller;


use AppBundle\Entity\Film;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class VideoController extends Controller
{
    /**
     * @Route("/video/{id}", name="show_video")
     */

    public function showAction($id){

        $film = $this->getDoctrine()
            ->getRepository('AppBundle:Film')
            ->find($id);

        if (!$film) {
            throw $this->createNotFoundException(
                'No film found for id '.$$id
            );
        }

        return $this->render('video/show.html.twig',array(

            'id'=>$film->getId(),
            'title'=>$film->getTitle(),
            'subtitle'=>$film->getSubtitle(),
            'description'=>$film->getDescription(),
            'image'=>$film->getImage(),
            'director'=>$film->getDirector(),
            'writer'=>$film->getWriter(),
            'image'=>$film->getImage(),
            'producer'=>$film->getProducer(),
            'premiere'=>$film->getPremiere(),
            'length'=>$film->getLength(),
            'date'=>$film->getDate()->format("d.m.Y (H:i)"),
            'genres' => $film->getGenres(),
            'links' => $film->getLinks()

        ));


    }
}
