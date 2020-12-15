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

<form action="updateWorkers.php" method="post">
        <label>ІД рядка який змінюємо</label><input name="id" type="number"><br>
        <label>Нове значення Рівня допуску</label><input name="ld" type="text"><br> 
		<label>Нове значення ПІБ</label><input name="pib" type="text"><br>
        <label>Нове значення Адреси</label><input name="adr" type="text"><br>
	    <label>Нове значення ІД Магазину</label><input name="im" type="number"><br>
        <input type="submit" value="Змінюємо рядок">
</form>

</body>
</html>