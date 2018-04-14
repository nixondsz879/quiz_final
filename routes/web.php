<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



Auth::routes();

Route::get('/quiz-home', 'HomeController@quiz_home');
Route::get('/quiz-results', 'HomeController@quiz_results');
Route::get('/quiz-result/{test_id}', 'HomeController@quiz_result')->name('quiz_result');
Route::post('/getQuizQuestions', 'HomeController@getQuizQuestions');
Route::post('/answer-quiz', 'HomeController@answer_quiz');

Route::group(['middleware' => ['auth']], function () {

	Route::get('/', 'QuizController@index');
	
	Route::get('/questions', 'QuestionsController@index');
	Route::get('/question/{id}', 'QuestionsController@show');
	Route::get('/add-question', 'QuestionsController@create');
	Route::post('/questions', 'QuestionsController@store')->name('store');

	//Quiz
	
	Route::get('/quiz', 'QuizController@index');
	Route::get('/view-question/{quiz_id}', 'QuizController@show');
	Route::get('/create-quiz', 'QuizController@create');
	Route::post('/quiz', 'QuizController@store');
	Route::post('/validateQuizName', 'QuizController@validateQuizName');
});

