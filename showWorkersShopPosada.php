<html>
<head>
    <meta charset="utf-8">
    <meta name="keywords" content="Лабораторна робота, MySQL, з'єднання з базою даних">
    <meta name="description" content="Лабораторна робота. З'єднання з базою даних">
    <title>Таблиця Workers</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Таблиця Workers</h1>


    <?php

    $mysqli = new mysqli('localhost', 'root', '', 'mydb'); // Створюємо нове підключення з назвою $mysqli за допомогою створення об'єта класу mysqli. Параметри підключення по порядку: сервер, логін, пароль, БД
    $mysqli->set_charset("utf8"); // Встановлюємо кодування utf8
    
    if (mysqli_connect_errno()) {
    printf("Підключення до сервера не вдалось. Код помилки: %s\n", mysqli_connect_error());
    exit;
    }

    /* Надсилаємо запит серверу */
    if($result = $mysqli->query('SELECT w.id, w.ПІБ, p.`Назва посади`,s.Назва FROM працівник AS w LEFT JOIN посада AS p ON w.id = p.`Id працівника` INNER JOIN магазин AS s ON w.idмагазину = s.idМагазин ORDER BY w.ПІБ')) {   // $mysqli - наш об'єкт, через який здійснюємо підключення, query - метод, який дозволяє виконати довільний запит

        printf("<h3>Звіт - Список Працівників-Посади-Магазини: </h3><br>");   // <br> в html - розрив рядка
        printf("<table><tr><th>id</th><th>ПІБ</th><th>Назва посади</th><th>Назва магазину</th></tr>");   // <br> в html - розрив рядка
        /* Вибірка результатів запиту  */
        while( $row = $result->fetch_assoc() ){ // fetch_assoc() повертає рядок із запиту у вигляді асоціативного масиву, наприклад $row = ['id'=>'1', 'pib'=>'Олександр', 'grupa'=>'ІПЗ-31']
            printf("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>", $row['id'], $row['ПІБ'], $row['Назва посади'], $row['Назва']); //виводимо результат на сторінку
        };
        printf("</table>");
        /*Звільняємо пам'ять*/
        $result->close();
    }

    /*Закриваємо з'єднання*/
    $mysqli->close();
    ?>

    <br><br><br>

    <ul>
        <li><a href="showWorkers.php">Таблиця Workers</a><br></li>
        <li><a href="showShops.php">Таблиця Shops</a><br></li>
        <li><a href="showPosada.php">Таблиця Posada</a><br></li>
		<li><a href="showProduct.php">Таблиця Product</a><br></li>
		<li><a href="showPClient.php">Таблиця PClient</a><br></li>
        <li><a href="index.html">На головну</a><br></li>
    </ul>
    
</body>
</html>
