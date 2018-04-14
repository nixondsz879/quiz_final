@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Quiz Details</div>

                <div class="card-body">
                    <h1>{{$quiz->name}}</h1>
                    <div id="questions-block">
                      <ol class="question-list">
                      @foreach($data as $key => $val)
                          <li>
                            <div class="question-name">{{$val["question"]}}</div>
                            <div>
                              <ul class="options-block">
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