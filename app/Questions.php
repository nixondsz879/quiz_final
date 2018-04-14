<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Questions extends Model
{
    function options() {
    	return $this->hasMany('App\Options', 'question_id');
    }
}
