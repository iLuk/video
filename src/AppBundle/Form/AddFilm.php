<?php
/**
 * Created by PhpStorm.
 * User: Luk
 * Date: 04/12/2016
 * Time: 16:26
 */

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use AppBundle\Entity\Film;

class AddFilm extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title', TextType::class, array('label' => 'Tytuł'))
            ->add('subtitle', TextType::class, array('label' => 'Podtytuł',
                'required' => false))
            ->add('description', TextareaType::class, array('label' => 'Opis'))
            ->add('imageFile', FileType::class, array('label' => 'Obrazek'))
            ->add('director', TextType::class, array('label' => 'Reżyseria'))
            ->add('writer', TextType::class, array('label' => 'Scenariusz'))
            ->add('producer', TextType::class, array('label' => 'Produkcja'))
            ->add('premiere', TextType::class, array('label' => 'Premiera'))
            ->add('length', IntegerType::class, array('label' => 'Długość trwania'))
            ->add('date', null, array('label' => 'Data dodania',
            'data' => new \DateTime('now')))
            ->add('save', SubmitType::class)
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => Film::class,
        ));
    }

}
