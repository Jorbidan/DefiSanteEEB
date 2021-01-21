<?php
    header('Content-type: text/html; charset=UTF-8');
?>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <?php
        echo '<link rel="stylesheet" href="/'.PATH_PUBLIC.'/css/main.css" >'
    ?>
    <?php
        require("includeJS.php")
    ?>
    <title>Défis santé EEB</title>
</head>

<body class="bg-secondary text-white">
    <?php
        include("navBar.php");
    ?>
    <div class="container">
        <div class="page-header">
            <h1><?= $title?></h1>
        </div>
        <?= $content ?>

    </div>
  
</body>

</html>