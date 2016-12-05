<?php
/**
 * Created by PhpStorm.
 * User: Luk
 * Date: 27/11/2016
 * Time: 14:25
 */

namespace AppBundle\Controller;

use AppBundle\Entity\Product;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use AppBundle\Form\AddFilm;
use AppBundle\Entity\Film;

class test extends Controller {

    /**
     * @Route("/test")
     */

    public function newAction(Request $request)
    {
        // just setup a fresh $task object (remove the dummy data)
        $film = new Film();

        $form = $this->createForm(AddFilm::class, $film);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // $form->getData() holds the submitted values
            // but, the original `$task` variable has also been updated
            $film = $form->getData();

            // ... perform some action, such as saving the task to the database
            // for example, if Task is a Doctrine entity, save it!
             $em = $this->getDoctrine()->getManager();
             $em->persist($film);
             $em->flush();

            return $this->redirectToRoute('success');
        }

        return $this->render(
            'formtest.html.twig',
            array(
                'form' => $form->createView(),
            )
        );
    }




//    public function createAction()
//    {
//
//
//        $product = new Product();
//        $product->setName('Keyboard');
//        $product->setPrice(19.99);
//        $product->setDescription('Ergonomic and stylish!');
//
//        $em = $this->getDoctrine()->getManager();
//
//        // tells Doctrine you want to (eventually) save the Product (no queries yet)
//        $em->persist($product);
//
//        // actually executes the queries (i.e. the INSERT query)
//        $em->flush();
//
//        return new Response('Saved new product with id '.$product->getId());
//    }

}