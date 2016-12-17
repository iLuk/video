<?php
/**
 * Created by PhpStorm.
 * User: Luk
 * Date: 16/12/2016
 * Time: 18:06
 */

namespace AppBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;



class LinkType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name',null, array(
                'label' => 'Hosting',
                'attr' => [
                    'placeholder' => 'Wprowadź nazwę witryny hostingowej'
                ]))
            ->add('url',null, array(
                'label' => 'Adres',
                'attr' => [
                    'placeholder' => 'Wprowadź adres URL'
                ]))
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Link',
        ));
    }
}