<?php
/**
 * Created by PhpStorm.
 * User: Luk
 * Date: 04/12/2016
 * Time: 22:03
 */

namespace AppBundle\Controller;


use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

use AppBundle\Form\AddFilm;
use AppBundle\Entity\Film;
use Doctrine\Common\Collections\ArrayCollection;

class AddVideoController extends Controller
{

    /**
     * @Route("/video/add", name="add_video")
     */

    public function newAction(Request $request)
    {
        // just setup a fresh $film object (remove the dummy data)
        $film = new Film();

        $form = $this->createForm(AddFilm::class, $film);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // $form->getData() holds the submitted values
            // but, the original `$film` variable has also been updated
            $film = $form->getData();

            // ... perform some action, such as saving the film to the database
            // for example, if Film is a Doctrine entity, save it!
            $em = $this->getDoctrine()->getManager();

            foreach ($film->getLinks() as $link)
                $em->persist($link);

            $em->persist($film);
            $em->flush();

            return $this->redirectToRoute('success');
        }

        return $this->render(
            'video/add.html.twig',
            array(
                'form' => $form->createView(),
            )
        );
    }
}