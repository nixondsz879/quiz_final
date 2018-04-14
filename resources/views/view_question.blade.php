@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Question Details</div>

                <div class="card-body">
                    <form method="post" action="{{ URL::to('/questions') }}">
                    	{{ csrf_field() }}
					  <input type="hidden" name="action" value="addQuestion">
					  <div class="form-group">
					    <h3>Question</h3>
					   
					    <p>{{$question[0]->question}}</p>

					    <h3>Options</h3>
					    <ol class="option-list"> 
					    @foreach($question[0]->options as $k=>$val)
					    	<?php 
					    		$answer="";
					    		if($question[0]->answer == $val->option_order) {
					    		$answer=" (Answer)";
					    		}
					    	?>
					    	
					    	<li>{{$val->option}}{{$answer}}</li>
					    @endforeach
						</ol>
					  </div>
					</form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection