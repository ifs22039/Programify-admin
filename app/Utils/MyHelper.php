<?php

namespace App\Utils;

class MyHelper
{
    public static function questionType(string $text): string
    {
        if ($text === "essay") {
            return "Essay";
        } else if ($text === "multiple_choice") {
            return "Multiple Choice";
        } else if ($text === "true_false") {
            return "True or False";
        }
    }
}
