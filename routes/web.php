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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();


Route::get('/home', 'HomeController@index')->name('home');


// Routen für die Stunden-Eingabe
Route::get('/stunden', 'StundenController@index')->name('stunden');

Route::Post('/stunden', 'StundenController@store');

Route::get('/stunden/list', 'StundenController@showList')->name('list');

Route::get('/stunden/{day}', 'StundenController@show');

Route::delete('/stunden/{day}', 'StundenController@destroy');

Route::patch('/stunden/{day}/edit', 'StundenController@update');

// Routen für das Schwarzebrett
Route::get('post/create', 'postController@create');

Route::get('post/{post}', 'postController@show');
