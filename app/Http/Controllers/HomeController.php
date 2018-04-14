<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Questions;
use App\Options;
use App\Quiz;
use App\QuizeQuestions;
use App\QuizResult;
use App\QuizResultAnswers;
use DB;
class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
       // $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('home');
    }
    public function add_question()
    {
        return view('add_question');
    }
    public function quiz_home()
    {
        $quiz = Quiz::where("trash", 0)->get();
        return view('quiz_home', compact("quiz"));
    }
    public function getQuizQuestions(Request $request)
    {
        $questions = DB::table("questions as A")
                    ->join("quize_questions as B", "A.id", "=", "B.question_id")
                    ->join("options as C", "B.question_id", "=", "C.question_id")
                    ->where(["A.trash"=>0, "B.quiz_id"=>$request->quiz_id])
                    ->select("A.*", "B.*", "C.id as option_id", "C.option", "C.option_order")
                    ->get();
        $data=array();
        $quiz = Quiz::find($request->quiz_id);
        foreach ($questions as $key => $val) {
            $data["options"][$val->question_id]["question"] = $val->question;
            $data["options"][$val->question_id]["options"][$val->option_id]["option"] = $val->option;
            $data["options"][$val->question_id]["options"][$val->option_id]["option_order"] = $val->option_order;
        }
        $data["quiz"]=$quiz;
        return response()->json($data);
    }
    public function answer_quiz(Request $request)
    {
        //return $request->all();
        $quizResult = new QuizResult;
        $quizResult->name = $request->name;
        $quizResult->number = $request->number;
        $quizResult->email = $request->email;
        $quizResult->quiz_id = $request->quiz;
        $quizResult->save();
        $data=array();
        foreach ($request->answer as $question_id => $option) {
           $temp = explode("|", $option);
           $option_id = $temp[0];
           $option_answer = $temp[1];
           $data[$question_id]["test_id"] = $quizResult->id;
           $data[$question_id]["quiz_id"] = $request->quiz;
           $data[$question_id]["question_id"] = $question_id;
           $data[$question_id]["option_id"] = $option_id;
           $data[$question_id]["option_answer"] = $option_answer;
        }

        QuizResultAnswers::insert($data);

        return redirect('/quiz-result/'.$quizResult->id);
    }

    public function quiz_results() {
         $quiz_results = DB::table("quiz_results as A")
                                ->join("quizzes as B", "A.quiz_id", "=", "B.id")
                                ->select("A.*", "B.name as quiz_name")
                                ->where("A.trash",0)->get();


        return view("quiz_results", compact("quiz_results"));
    }

    public function quiz_result($test_id) {
        $test = QuizResultAnswers::where("test_id", $test_id)->get();
        if(count($test) == 0) {
             return redirect('/quiz-home');
        }
        $testAns=array();
        foreach ($test as $key => $val) {
            $testAns[$val->question_id][$val->option_id] = trim($val->option_answer);
        }

        $userDetails = QuizResult::find($test_id);
        $quiz = Quiz::find($userDetails->quiz_id);

        $questions = DB::table("questions as A")
                    ->join("quize_questions as B", "A.id", "=", "B.question_id")
                    ->join("options as C", "B.question_id", "=", "C.question_id")
                    ->where(["A.trash"=>0, "B.quiz_id"=>$userDetails->quiz_id])
                    ->select("A.*", "B.*", "C.id as option_id", "C.option", "C.option_order")
                    ->get();
        $data=array();
        foreach ($questions as $key => $val) {
            $data[$val->question_id]["question"] = $val->question;
            $data[$val->question_id]["answer"] = $val->answer;
            $data[$val->question_id]["options"][$val->option_id]["option"] = $val->option;
            $data[$val->question_id]["options"][$val->option_id]["option_order"] = $val->option_order;
            $data[$val->question_id]["options"][$val->option_id]["option_answer"] = $val->answer;

            if(isset($testAns[$val->question_id][$val->option_id])) {
                if($testAns[$val->question_id][$val->option_id] == $val->answer) {
                    $answer = $val->option." - Correct";
                } else {
                    $answer = $val->option." - Wrong";
                }
                $data[$val->question_id]["result"] = $answer;
            } 
        }

        // return $data;
        return view('quiz_result', compact("userDetails", "quiz", "data"));
    }
}
