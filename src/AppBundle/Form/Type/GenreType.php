<?php
/**
 * Created by PhpStorm.
 * User: Luk
 * Date: 09/12/2016
 * Time: 18:10
 */

namespace AppBundle\Form\Type;

use Symfony\Component\OptionsResolver\OptionsResolver;

class GenreType extends AbstractType
{
    private $genreChoices;

    public function __construct(array $genreChoices)
    {
        $this->genreChoices = $genreChoices;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'choices' => $this->genreChoicess,
        ));
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('genre_code', GenreType::class, array(
            'placeholder' => 'Choose a genre',
        ));
    }
}