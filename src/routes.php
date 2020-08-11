<?php
use core\Router;

$router = new Router();

$router->get('/', 'HomeController@index');

$router->get('/login', 'LoginController@singin');
$router->post('/login', 'LoginController@singinAction');

$router->get('/cadastro', 'LoginController@singup');
$router->post('/cadastro', 'LoginController@singupAction');

$router->post('/post/newPost', 'PostController@newPost');

$router->get('/perfil/{id}/fotos', 'ProfileController@photos');
$router->get('/perfil/{id}/amigos', 'ProfileController@friends');
$router->get('/perfil/{id}/follow', 'ProfileController@follow');
$router->get('/perfil/{id}', 'ProfileController@index');
$router->get('/perfil', 'ProfileController@index');

$router->get('/amigos', 'ProfileController@friends');
$router->get('/fotos', 'ProfileController@photos');

$router->get('/pesquisa', 'SearchController@index');

$router->get('/config', 'SettingsController@index');
$router->post('/config', 'SettingsController@update');

$router->get('/sair', 'LoginController@logout');


$router->get('/ajax/like/{id}', 'AjaxController@like');
$router->post('/ajax/comment', 'AjaxController@comment');




//$router->get('/pesquisar');
//$router->get('/perfil');
//$router->get('/sair');
//$router->get('/amigos');
//$router->get('/fotos');
//$router->get('/config');