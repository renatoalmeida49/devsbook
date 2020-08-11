<?php
namespace src\controllers;

use \core\Controller;
use \src\handlers\UserHandler;

class SettingsController extends Controller {

    private $loggedUser;

    public function __construct() {
        $this->loggedUser = UserHandler::checkLogin();

        if ($this->loggedUser === false) {
            $this->redirect('/login');
        }
    }

    public function index() {
        $user = UserHandler::getUser($this->loggedUser->id);

        $flash = '';

        if(!empty($_SESSION['flash'])) {
            $flash = $_SESSION['flash'];
            $_SESSION['flash'] = '';
        }

        $this->render('settings', [
            'loggedUser' => $this->loggedUser,
            'user' => $user,
            'flash' => $flash
        ]);
    }

    public function update() {
        $name = filter_input(INPUT_POST, 'name');
        $birthdate = filter_input(INPUT_POST, 'birthdate');
        $email = filter_input(INPUT_POST, 'email', FILTER_VALIDATE_EMAIL);
        $city = filter_input(INPUT_POST, 'city') ?? null;
        $work = filter_input(INPUT_POST, 'work') ?? null;

        $password = filter_input(INPUT_POST, 'newPassword');
        $confirmPassword = filter_input(INPUT_POST, 'confirmPassword');
        
        // BIRTHDATE
        $birthdate = explode('/', $birthdate);
        if (count($birthdate) != 3) {
            $_SESSION['flash'] = 'Data de nascimento inválida.';
            $this->redirect('/config');
        }

        $birthdate = $birthdate[2].'-'.$birthdate[1].'-'.$birthdate[0];

        if (strtotime($birthdate) == false) {
            $_SESSION['flash'] = 'Data de nascimento inválida.';
            $this->redirect('/config');
        }

        $update['birthdate'] = $birthdate;

        // PASSWORD
        if($password != $confirmPassword) {
            $_SESSION['flash'] = 'Senhas digitadas não conferem.';
            $this->redirect('/config');
        }

        $update['password'] = $password;

        // EMAIL
        if (!UserHandler::checkEmail($email, $this->loggedUser->id)) {
            $_SESSION['flash'] = 'E-mail já cadastrado';
            $this->redirect('/config');
        }

        $update['email'] = $email;

        // AVATAR
        if(isset($_FILES['avatar']) && !empty($_FILES['avatar']['tmp_name'])) {
            $newAvatar = $_FILES['avatar'];

            if(in_array($newAvatar['type'], ['image/jpeg', 'image/jpg', 'image/png'])) {
                $avatarName = $this->cutImage($newAvatar, 200, 200, 'media/avatars');
                $update['avatar'] = $avatarName;
            }
        } else {
            $update['avatar'] = $this->loggedUser->avatar;
        }

        //COVER
        if(isset($_FILES['cover']) && !empty($_FILES['cover']['tmp_name'])) {
            $newCover = $_FILES['cover'];

            if(in_array($newCover['type'], ['image/jpeg', 'image/jpg', 'image/png'])) {
                $coverName = $this->cutImage($newCover, 850, 310, 'media/covers');
                $update['cover'] = $coverName;
            }
        } else {
            $update['cover'] = $this->loggedUser->cover;
        }

        $update['name'] = $name;
        $update['city'] = $city;
        $update['work'] = $work;
        $update['id'] = $this->loggedUser->id;

        $update = UserHandler::updateUser($update);

        $this->redirect('/config');
    }

    private function cutImage($file, $w, $h, $folder) {
        list($widthOrig, $heightOrig) = getimagesize($file['tmp_name']);
        $ratio = $widthOrig / $heightOrig;

        $newWidth = $w;
        $newHeight = $newWidth / $ratio;

        if($newHeight < $h) {
            $newHeight = $h;
            $newHeight = $newHeight * $ratio;
        }

        $x = $w - $newWidth;
        $y = $h - $newHeight;
        $x = $x < 0 ? $x / 2 : $x;
        $y = $y < 0 ? $y / 2 : $y;

        $finalImage = imagecreatetruecolor($w, $h);
        switch($file['type']) {
            case 'image/jpg':
            case 'image/jpeg':
                $image = imagecreatefromjpeg($file['tmp_name']);
            break;
            case 'image/png':
                $image = imagecreatefrompng($file['tmp_name']);
            break;
        }

        imagecopyresampled(
            $finalImage, $image,
            $x, $y, 0, 0,
            $newWidth, $newHeight, $widthOrig, $heightOrig
        );

        $fileName = md5(time().rand(0,9999)).'.jpg';

        imagejpeg($finalImage, $folder.'/'.$fileName);

        return $fileName;
    }

}