<?php

$mysqli = new mysqli('localhost', 'root', '', 'mydb'); // Створюємо нове підключення з назвою $mysqli за допомогою створення об'єта класу mysqli. Параметри підключення по порядку: сервер, логін, пароль, БД
$mysqli->set_charset("utf8"); // Встановлюємо кодування utf8

if (mysqli_connect_errno()) {
    printf("Підключення до сервера не вдалось. Код помилки: %s\n", mysqli_connect_error());
    exit;
}

$pib = $_POST['pib']; $ld = $_POST['ld']; $im = $_POST['im']; $id = $_POST['id']; $adr = $_POST['adr'];

$sql = "INSERT INTO працівник (`id`, `Рівень допуску`, `ПІБ`, `Адреса роботи`, `idМагазину`) VALUES ('$id','$ld', '$pib','$adr',  '$im' )";


if($mysqli->query($sql)){
    echo "Рядок вставлено успішно";
    }
else
    {
        echo "Error" . $sql . "<br/>" . $mysqli->error;
    }



/*Закриваємо з'єднання*/
$mysqli->close();

include("showWorkers.php")
?>
