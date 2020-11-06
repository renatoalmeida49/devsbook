<?=$render('header', ['loggedUser' => $loggedUser]); ?>
<link rel="stylesheet" href="<?=$base;?>/assets/css/settings.css" />
<section class="container main">
    <?= $render('sidebar', ['activeMenu' => 'config']); ?>
    <section class="feed mt-10">

        <div class="row">
            <div class="column pr-5">
                <?php if(!empty($flash)): ?>
                    <div class="flash"><?php echo $flash; ?></div>
                <?php endif; ?>
                <form class="form-settings" method="POST" enctype="multipart/form-data" action="<?=$base;?>/config">
                    <label for="avatar">Avatar:</label><input class="input" type="file" name="avatar" id="avatar"/><br/>
                    <img src="<?=$base;?>/media/avatars/<?=$user->avatar;?>" width="50" height="50"/>
                    <label for="cover">Cover:</label><input class="input" type="file" name="cover" id="cover"/><br/>
                    <img src="<?=$base;?>/media/covers/<?=$user->cover;?>" width="150" height="50" />
                    <label for="name">Nome completo:</label><input required class="input" value="<?=$user->name;?>" type="text" name="name" id="name"/>
                    <label for="birthdate">Data de nascimento:</label><input required class="input" value="<?=date('d/m/Y', strtotime($user->birthdate));?>" type="text" name="birthdate" id="birthdate"/>
                    <label for="email">E-mail:</label><input required class="input" value="<?=$user->email;?>" type="email" name="email" id="email"/>
                    <label for="city">Cidade:</label><input class="input" value="<?=$user->city;?>" value="<?=$user->name;?>" type="text" name="city" id="city"/>
                    <label for="work">Trabalho:</label><input class="input" value="<?=$user->work;?>" type="text" name="work" id="work"/>

                    <label for="newPassword">Nova senha:</label><input class="input" type="password" name="newPassword" id="newPassword"/>
                    <label for="confirmPassword">Confimar senha:</label><input class="input" type="password" name="confirmPassword" id="confirmPassword"/>

                    <input class="button" type="submit" value="Atualizar informações"/>
                </form>
            </div>
            <div class="column side pl-5">
                <?=$render('right-side');?>
            </div>
        </div>

    </section>
</section>

<script src="https://unpkg.com/imask"></script>
<script>
    IMask(
        document.getElementById('birthdate'),
        {
            mask:'00/00/0000'
        }
    );
</script>

<?= $render('footer'); ?>