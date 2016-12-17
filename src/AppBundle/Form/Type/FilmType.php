<?php
/**
 * Created by PhpStorm.
 * User: Luk
 * Date: 16/12/2016
 * Time: 18:11
 */

namespace AppBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;

class FilmType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('description');

        $builder->add('links', CollectionType::class, array(
            'entry_type' => LinkType::class,
            'allow_add'    => true,
            'by_reference' => false,
            'allow_delete' => true,
        ));
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Film',
        ));
    }
}