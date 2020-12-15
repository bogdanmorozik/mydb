<?php

$mysqli = new mysqli('localhost', 'root', '', 'mydb'); // Створюємо нове підключення з назвою $mysqli за допомогою створення об'єта класу mysqli. Параметри підключення по порядку: сервер, логін, пароль, БД
$mysqli->set_charset("utf8"); // Встановлюємо кодування utf8

if (mysqli_connect_errno()) {
    printf("Підключення до сервера не вдалось. Код помилки: %s\n", mysqli_connect_error());
    exit;
}


$id = $_POST['id'];
$ld = $_POST['ld'];
$pib = $_POST['pib'];
$adr = $_POST['adr'];
$im = $_POST['im'];

$sql = "UPDATE працівник SET `Рівень допуску`='$ld', ПІБ='$pib', `Адреса роботи`='$adr', `idМагазину`='$im' WHERE id='$id'";


if($mysqli->query($sql)){
    echo "Рядок змінено успішно";
    }
else
    {
        echo "Error" . $sql . "<br/>" . $mysqli->error;
    }



/*Закриваємо з'єднання*/
$mysqli->close();

include("showWorkers.php")
?>
