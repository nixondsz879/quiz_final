@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Add Question</div>

                <div class="card-body">
                    <form method="post" action="{{ URL::to('/quiz') }}">
                    	{{ csrf_field() }}
          					  <div class="form-group">
                        <label for="quiz">Quiz Name</label>
                        <input type="text" class="form-control" id="quiz" name="quiz" placeholder="Quiz Name">
                      </div>
                      <div class="form-group">
                        <label for="no_question">Number of Questions</label>
                        <input type="text" class="form-control" id="no_question" name="no_question" placeholder="Number of Questions">
                        <small><i>(Minimum 5)</i></small>
                      </div>
                      <div class="form-group">
                        <label for="time_limit">Time Limit</label>
                        <input type="text" class="form-control" id="time_limit" name="time_limit" placeholder="Time Limit">
                        <small><i>(In Minutes)</i></small>
                      </div>
                      <div class="form-group">
                        <label for="questions">Select Questions</label>
                        <div class="row">
                          <div class="col-md-10">
                            <select id="questions" class="form-control " name="questions">
                              <option>Select Question</option>
                              <?php $options="";$answers=""; ?>
                              @foreach($questions as $k=>$val)
                                <option value="{{$val->id}}">{{$val->question}}</option>
                                <?php  
                                  $answers.= "<input type='hidden' id='answer_".$val->id."' value='".$val->answer."'/>";
                                ?>
                                @if(count($val->options) > 0)
                                  @foreach($val->options as $i=>$option)
                                  <?php  
                                    $options .= "<input type='hidden' id='option_".$option->option_order."_".$val->id."' class='option_".$val->id."' value='".$option->option."'/>";
                                  ?>
                                  @endforeach
                                @endif
                              @endforeach
                            </select>
                          </div>
                          <div class="col-md-2">
                            <button type="button" class="btn btn-info " onclick="addQuestion();">Add</button>
                          </div>
                        </div>
                      </div>
                      <div id="option_preview" class="form-group" style="display: none;">
                        <label>Option Preview</label>
                        <div id="options"></div>
                      </div>
                      <div class="form-group">
                        <h3>Question List</h3>
                        <table id="questionTable" class="table">
                          <thead>
                            <th style="width:100px;">Sr. No</th>
                            <th>Question</th>
                            <th style="width:100px;">Remove</th>
                          </thead>
                          <tbody>
                            <tr id="noData"><td colspan="3">No questions added</td></tr>
                          </tbody>
                        </table>
                      </div>
          					  <div class="error" style="display: none;"></div>
          					  <button type="submit" class="btn btn-primary" onclick="return validate();">Submit</button>
          					</form>

                    {!! $options !!}
                    {!! $answers !!}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section("script")
<script type="text/javascript" src="{{asset('js/create_quiz.js')}}"></script>
@endsection