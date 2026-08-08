<?php declare(strict_types=1);
use App\Core\{App,Config,Database,Router};
require __DIR__.'/../vendor/autoload.php';
$dotenv=Dotenv\Dotenv::createImmutable(dirname(__DIR__)); if(file_exists(dirname(__DIR__).'/.env')){$dotenv->safeLoad();}
$config=new Config(require dirname(__DIR__).'/config/app.php');
$db=new Database($config);
$router=new Router($config,$db);
require dirname(__DIR__).'/routes/web.php';
(new App($config,$db,$router))->run();
