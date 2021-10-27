<html lang="en">
<head>
    <title>Task 2</title>
    <meta charset="UTF-8">
</head>
<body>

<?php
// why forced using switch? loop is better solution

function parse_param() {
    if (!isset($_GET['num'])) {
        return 'Please, pass "num" query parameter';
    }
    $num_str = $_GET['num'];

    if (!is_numeric($num_str)) {
        return 'Can not parse "num" as int number';
    }

    $bound = strlen($num_str);
    if ($bound > 5) return 'Too long number';
    $num = 1;
    for ($i = 0; $i < $bound; $i++) {
        if ($num_str[$i] == '.') {
            return 'Can not parse "num" as int number';
        }
        $num *= intval($num_str[$i]);
    }
    return $num_str . ' -> ' . $num;
}

$msg = parse_param();
?>

<h2><?= $msg ?></h2>

</body>
</html>
