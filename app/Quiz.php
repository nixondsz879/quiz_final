<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Quiz extends Model
{
    function questions() {
    	return $this->hasMany('App\QuizeQuestions', 'question_id');
    }
}
