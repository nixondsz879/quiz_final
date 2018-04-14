<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Questions;
use App\Options;
use App\Quiz;
use DB;
use App\QuizeQuestions;
class QuizController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $quiz = Quiz::with("questions")->where("trash", 0)->get();
        return view('quiz', compact("quiz"));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $questions = Questions::with("options")->where("trash", 0)->get();
        return view('create_quiz', compact("questions"));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $quiz = new Quiz;
        $quiz->name = $request->quiz;
        $quiz->number_of_questions = $request->no_question;
        $quiz->time_limit = $request->time_limit;
        $quiz->save();

        $data=array();
        foreach ($request->questionId as $key => $question_id) {
            $data[$key]["quiz_id"] = $quiz->id;
            $data[$key]["question_id"] = $question_id;
        }
        QuizeQuestions::insert($data);

        return redirect('/quiz');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $quiz = Quiz::find($id);
        $questions = DB::table("questions as A")
                    ->join("quize_questions as B", "A.id", "=", "B.question_id")
                    ->join("options as C", "B.question_id", "=", "C.question_id")
                    ->where(["A.trash"=>0, "B.quiz_id"=>$id])
                    ->select("A.*", "B.*", "C.id as option_id", "C.option", "C.option_order")
                    ->get();
        $data=array();
        foreach ($questions as $key => $val) {
            $data[$val->question_id]["question"] = $val->question;
            $data[$val->question_id]["answer"] = $val->answer;
            $data[$val->question_id]["options"][$val->option_id]["option"] = $val->option;
            $data[$val->question_id]["options"][$val->option_id]["option_order"] = $val->option_order;
        }
        return view('quiz_show', compact("data", "quiz"));
    }

    public function validateQuizName(Request $request) {
        $quiz = Quiz::where(["name" => $request->quiz,"trash" => 0])->get();
        return count($quiz);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
