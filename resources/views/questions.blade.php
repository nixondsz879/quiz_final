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
                          <th style="width: 100px;">Sr. No</th>
                          <th>Question</th>
                          <th style="width: 107px;">No. Options</th>
                          <th style="width: 100px;">View</th>
                        </thead>
                        <tbody>
                          <?php $sr=1; ?>
                          @foreach($questions as $k=>$val)
                          <tr>
                            <td class="text-center">{{$sr}}</td>
                            <td>{{$val->question}}</td>
                            <td class="text-center">{{count($val->options)}}</td>
                            <td class="text-center"><a href="{{URL('/question/'.$val->id)}}">View</a></td>
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