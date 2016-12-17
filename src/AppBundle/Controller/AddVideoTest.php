<?php
/**
 * Created by PhpStorm.
 * User: Luk
 * Date: 16/12/2016
 * Time: 18:13
 */

namespace AppBundle\Controller;

use AppBundle\Entity\Film;
use AppBundle\Entity\Link;
use AppBundle\Form\Type\FilmType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

class AddVideoTest extends Controller
{

    /**
     * @Route("/video/addtest", name="add_videotest")
     */

    public function newAction(Request $request)
    {
        $film = new Film();

        // dummy code - this is here just so that the Task has some tags
        // otherwise, this isn't an interesting example

        // end dummy code

        $form = $this->createForm(FilmType::class, $film);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // ... maybe do some form processing, like saving the Task and Tag objects
        }

        return $this->render(':video:addtest.html.twig', array(
            'form' => $form->createView(),
        ));
    }
}