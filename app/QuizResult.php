<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class QuizResult extends Model
{
    function quiz() {
    	return $this->hasMany('App\Quiz', 'question_id');
    }
}
