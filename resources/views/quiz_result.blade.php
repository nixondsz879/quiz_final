@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Quiz Result</div>

                <div class="card-body">
                    <h1>User Details</h1>
                    <div class="form-group">
                      <label>Name: </label>
                      {{$userDetails->name}}
                    </div>
                    <div class="form-group">
                      <label>Number: </label>
                      {{$userDetails->number}}
                    </div>
                    <div class="form-group">
                      <label>Email: </label>
                      {{$userDetails->email}}
                    </div>
                    <div class="form-group">
                      <label>Quiz Name: </label>
                      {{$quiz->name}}
                    </div>
                    <h1>Quiz Details</h1>
                    <div id="questions-block">
                      <ol class="question-list">
                      @foreach($data as $question_id => $val)
                        <li style="padding-bottom: 15px;">
                          <div>{{$val["question"]}}</div>
                          <div>
                            <ul class="option-list">
                            @foreach($val["options"] as $option_id => $rows)
                            <?php
                            $answers = "";
                            if($rows["option_order"] == $val["answer"]) {
                              $answers = "(Answer)";
                            }
                            ?>
                            <li>{{$rows["option"]}} {{$answers}}</li>
                            @endforeach  
                            </ul>
                            <div><b>Result: {{$val["result"]}}</b></div>
                          </div>

                        </li>
                      @endforeach
                      </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection