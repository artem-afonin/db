<html>
<head>
    <title>Task 1</title>
</head>
<body>
<h1>
    <?php
    $high_bound = 10;
    $array = [];
    for ($i = 1; $i <= $high_bound; $i++) {
        array_push($array, $i * $i);
    }
    $joined_array = implode("&nbsp;", $array);
    echo "[ $joined_array ]";
    ?>
</h1>
</body>
</html>