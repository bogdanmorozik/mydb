<html>
<head>
    <meta charset="utf-8">
    <meta name="keywords" content="Лабораторна робота, MySQL, з'єднання з базою даних">
    <meta name="description" content="Лабораторна робота. З'єднання з базою даних">
    <title>Вставка посади</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <?php
        include("showPosada.php")    
    ?>

    <form action="insertIntoWorkersPosada.php" method="post">
		<label>id</label><input name="id" type="number"><br>  
        <label>Рівень допуску</label><input name="ld" type="number"><br>
		<label>Назва посади</label><input name="np" type="text"><br>
		<label>Зарплата</label><input name="zar" type="text"><br>
        <input type="submit" value="Вставити рядок">
    </form>

</body>
</html>
