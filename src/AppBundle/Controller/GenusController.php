<?php
/**
 * Created by PhpStorm.
 * User: Luk
 * Date: 06/11/2016
 * Time: 18:18
 */

namespace AppBundle\Controller;


use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;

class GenusController extends Controller
{
    /**
     * @Route("/genus/{what}")
     */

    public function showAction($what) {

        $notes = [
            'Octopus asked me a riddle, outsmarted me',
            'I counted 8 legs... as they wrapped around me',
            'Inked!'
        ];


        return $this->render('genus/show.html.twig', array(
            'name' => $what,
            'notes' => $notes
        ));

    }

}
