@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Answer Quiz</div>

                <div class="card-body">
                    <form id="quizForm" method="post" action="{{ URL::to('/answer-quiz') }}">
                      {{csrf_field()}}
                      <div id="details-block">
                        <div class="form-group">
                          <label for="name">Your Name</label>
                          <input type="text" name="name" id="name" class="form-control" placeholder="Your Name">
                        </div>
                        <div class="form-group">
                          <label for="number">Your Number</label>
                          <input type="text" name="number" id="number" class="form-control" placeholder="Your Number">
                        </div>
                        <div class="form-group">
                          <label for="email">Your Email</label>
                          <input type="text" name="email" id="email" class="form-control" placeholder="Your Email">
                        </div>
                        <div class="form-group">
                          <label for="quiz">Quiz Name</label>
                          
                          <select id="quiz" class="form-control" name="quiz">
                            <option value="">Select Question</option>
                            @foreach($quiz as $k=>$val)
                            <option value="{{$val->id}}">{{$val->name}}</option>
                            @endforeach
                          </select>
                          
                        </div>
                        <div class="error" style="display: none;"></div><button type="button" class="btn col-md-2" onClick="startQuiz();">Start Quiz</button>
                      </div>
                      <div id="questions-block"></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="timer" style="display: none;">60</div>
<div class="suspend-quize" style="display: none;">
  <div>
    <h1>Time Up!</h1>
    <p>Your Quize will be auto submitted.</p>
  </div>
</div>
@endsection
@section("script")
<script type="text/javascript" src="{{asset('js/quiz_home.js')}}"></script>
@endsection