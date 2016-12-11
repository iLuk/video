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
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use AppBundle\Entity\Film;

class AddFilm extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title', TextType::class, array(
                'label' => 'Tytuł',
                'attr' => [
                    'placeholder' => 'Wprowadź tytuł'
                ]))
            ->add('subtitle', TextType::class, array(
                'label' => 'Podtytuł',
                'required' => false,
                'attr' => [
                    'placeholder' => 'Wprowadź podtytuł lub alternatywny tytuł',
                    'data-help'  => 'To pole <b>nie</b> jest wymagane.'
                ]))
            ->add('description', TextareaType::class, array(
                'label' => 'Opis',
                'attr' => [
                    'placeholder' => 'Wprowadź krótki opis filmu',
                    'data-help'  => 'Maksymalnie 1024 znaki.',
                    'maxlength' => "1024"
                ]
                ))
            ->add('imageFile', FileType::class, array('label' => 'Obrazek'))
            ->add('genres', EntityType::class, array(
                'label' => 'Gatunek',
                // query choices from this entity
                'class' => 'AppBundle:Genre',

                // use the User.username property as the visible option string
                'choice_label' => 'name',

                // used to render a select box, check boxes or radios
                'multiple' => true,
                //'expanded' => true
                'attr' => [
                    'data-help' => 'Przytrzymaj CTRL, aby wybrać więcej gatunków.'
                ]))
            ->add('director', TextType::class, array(
                'label' => 'Reżyseria',
                'attr' => [
                    'placeholder' => 'Wprowadź reżysera(ów)'
                ]))
            ->add('writer', TextType::class, array(
                'label' => 'Scenariusz',
                'attr' => [
                    'placeholder' => 'Wprowadź scenarzystę(ów)'
                ]))
            ->add('producer', TextType::class, array(
                'label' => 'Produkcja',
                'attr' => [
                    'placeholder' => 'Wprowadź miejsce(a) produkcji'
                ]))
            ->add('premiere', TextType::class, array(
                'label' => 'Premiera',
                'attr' => [
                    'placeholder' => 'Wprowadź datę premiery w Polsce i na świecie'
                ]))
            ->add('length', IntegerType::class, array(
                'label' => 'Długość trwania',
                'attr' => [
                    'placeholder' => 'Wprowadź długość trwania w minutach'
                ]))
            ->add('date', null, array(
                'label' => 'Data dodania',
                'data' => new \DateTime('now'),
                'attr' => [
                    'data-help'  => 'Domyślnie ustawiony jest aktualny czas.'
            ]))
            ->add('save', SubmitType::class, array(
                'label' => 'Dodaj nowy film',
                'attr' => [
                    'class'  => 'btn-block btn btn-primary'
                ]

            ))
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => Film::class,
        ));
    }

}
