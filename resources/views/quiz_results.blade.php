@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Add Question</div>

                <div class="card-body">
                    <table class="table table-bordered">
                      <tr>
                        <thead>
                          <th>Sr. No</th>
                          <th>User Name</th>
                          <th>Quiz Name</th>
                          <th>View</th>
                        </thead>
                        <tbody>
                          <?php $sr=1; ?>
                          @foreach($quiz_results as $k=>$val)
                          <tr>
                            <td>{{$sr}}</td>
                            <td>{{$val->name}}</td>
                            <td>{{$val->quiz_name}}</td>
                            <td><a href="{{URL('/quiz-result/'.$val->id)}}">View Result</a></td>
                          </tr>
                          <?php $sr++; ?>
                          @endforeach
                        </tbody>
                      </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection