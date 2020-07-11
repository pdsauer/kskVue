<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


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