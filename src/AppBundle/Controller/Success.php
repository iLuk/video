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

class Success extends Controller
{

    /**
     * @Route("/success", name="success")
     */

    public function showAction(){


        return $this->render('success.html..twig');
    }


}