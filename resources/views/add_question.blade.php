@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Add Question</div>

                <div class="card-body">
                    <form method="post" action="{{ URL::to('/questions') }}">
                    	{{ csrf_field() }}
					  <input type="hidden" name="action" value="addQuestion">
					  <div class="form-group">
					    <label for="question">Question</label>
					   
					    <textarea class="form-control" id="question" name="question" placeholder="Question"></textarea>
					  </div>
					  <div class="form-group">
					    <label for="answer1">Option 1</label>
					    <div class="row">
						    <input type="radio" name="answer" id="answer1" checked="" value="1" class="col-md-1">
						    <input type="text" class="form-control col-md-11" id="option1" name="option1" placeholder="Option 1">
						  </div>
					  </div>
					  <div class="form-group">
					    <label for="answer2">Option 2</label>
					    <div class="row">
						    <input type="radio" name="answer" id="answer2" value="2" class="col-md-1">
						    <input type="text" class="form-control col-md-11" id="option2" name="option2" placeholder="Option 2">
						  </div>
					  </div>
					  <div class="form-group">
					    <label for="answer3">Option 3</label>
					    <div class="row">
						    <input type="radio" name="answer" id="answer3" value="3" class="col-md-1">
						    <input type="text" class="form-control col-md-11" id="option3" name="option3" placeholder="Option 3">
						  </div>
					  </div>
					  <div class="form-group">
					    <label for="answer3">Option 4</label>
					    <div class="row">
						    <input type="radio" name="answer" id="answer4" value="4" class="col-md-1">
						    <input type="text" class="form-control col-md-11" id="option4" name="option4" placeholder="Option 4">
						  </div>
					  </div>
					  <div class="error" style="display: none;"></div>
					  <button type="submit" class="btn btn-primary" onclick="return validate();">Submit</button>
					</form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section("script")
<script type="text/javascript" src="{{asset('js/add_question.js')}}"></script>
@endsection