@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Quiz List</div>

                <div class="card-body">
                    <table class="table table-bordered">
                      <tr>
                        <thead>
                          <th style="width: 100px;">Sr. No</th>
                          <th>Quiz Name</th>
                          <th style="width: 135px;">No. of Question</th>
                          <th style="width: 100px;">View</th>
                        </thead>
                        <tbody>
                          <?php $sr=1; ?>
                          @foreach($quiz as $k=>$val)
                          <tr>
                            <td class="text-center">{{$sr}}</td>
                            <td>{{$val->name}}</td>
                            <td class="text-center">{{$val->number_of_questions}}</td>
                            <td class="text-center"><a href="{{URL('view-question/'.$val->id)}}">View</a></td>
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