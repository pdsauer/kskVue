<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|\textbf{Tabelle} 
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    if(!\Auth::check()){
        return view('welcome');
    } else {
        return redirect('/home');
    }

});

Auth::routes(['register' => false]);


Route::get('/home', 'HomeController@index')->name('home');

// Routen für die Stunden-Eingabe


Route::get('/stunden/vue', 'StundenController@Vue');

// DELETE SOON
Route::get('/stunden', 'StundenController@index')->name('stunden');
Route::Post('/stunden', 'StundenController@store');
Route::get('/stunden/list', 'StundenController@showList')->name('list');
Route::get('/stunden/{day}', 'StundenController@show');
Route::delete('/stunden/{day}', 'StundenController@destroy');
Route::patch('/stunden/{day}/edit', 'StundenController@update');



// Routes for API - DAY
Route::get('/api/v1/days', 'DayController@index');
Route::get('api/v1/days/{day}', 'DayController@show');
Route::delete('api/v1/days/{day}', 'DayController@destroy');
Route::post('/api/v1/days/', 'DayController@store');
Route::patch('/api/v1/days/{day}', 'DayController@update');

// Routes for API - DAY_UF
Route::get('/api/v1/days_UF/list/{day}', 'Day_UFController@index');
Route::get('api/v1/days_UF/{day_UF}', 'Day_UFController@show');
Route::delete('api/v1/days_UF/{day_UF}', 'Day_UFController@destroy');
Route::post('/api/v1/days_UF', 'Day_UFController@store');
Route::patch('/api/v1/days_UF/{day}', 'Day_UFController@update');

// Routes for API - Activity
Route::get('/api/v1/activities', 'ActivityController@index');
Route::get('/api/v1/activities/{id}', 'ActivityController@show');

// Routes for API - Order
Route::get('/api/v1/orders', 'OrderController@index');
Route::get('/api/v1/orders/{id}', 'OrderController@show');

// Routen für das Schwarzebrett
Route::get('/post/create', 'postController@create');
Route::get('/post/{post}', 'postController@show');
Route::get('/post/{post}/edit', 'postController@edit');
Route::get('/post', 'postController@index');
Route::post('/post', 'postController@store');
