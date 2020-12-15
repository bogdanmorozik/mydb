<html>
<head>
    <meta charset="utf-8">
    <meta name="keywords" content="Лабораторна робота, MySQL, з'єднання з базою даних">
    <meta name="description" content="Лабораторна робота. З'єднання з базою даних">
    <title>Вставка даних</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <?php
        include("showWorkers.php")    
    ?>

    <form action="insertIntoWorkers.php" method="post">
		<label>id</label><input name="id" type="number"><br>  
        <label>Рівень допуску</label><input name="ld" type="number"><br>
		<label>ПІБ</label><input name="pib" type="text"><br>
		<label>Адреса роботи</label><input name="adr" type="text"><br>
		<label>idмагазину</label><input name="im" type="number"><br>
        <input type="submit" value="Вставити рядок">
    </form>

</body>
</html>
