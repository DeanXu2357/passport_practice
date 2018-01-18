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

Route::get('/test', function () {
    return 'test success';
});

Route::get('/test-login-faild', function (){
    return 'login failed';
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/x-23-success', function () {
    return 'yeah u access success';
});

Route::get('/iwantlogin', function () {
    $query = http_build_query([
        'client_id' => '4',
        'redirect_uri' => 'http://127.0.0.1:666/test-login-faild',
        'response_type' => '',
        'scope' => '',
    ]);

    return redirect('/oauth/authorize?' . $query);
});
