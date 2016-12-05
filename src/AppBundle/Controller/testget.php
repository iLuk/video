<?php
/**
 * Created by PhpStorm.
 * User: Luk
 * Date: 27/11/2016
 * Time: 14:59
 */

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use AppBundle\Entity\Product;
use Symfony\Component\HttpFoundation\Response;


class testget extends Controller
{

    /**
     * @Route("/test/{productId}")
     */

    public function showAction($productId){

        $product = $this->getDoctrine()
            ->getRepository('AppBundle:Product')
            ->find($productId);

        if (!$product) {
            throw $this->createNotFoundException(
                'No product found for id '.$productId
            );
        }


        return new Response('Id to '.$product->getName());

    }


}