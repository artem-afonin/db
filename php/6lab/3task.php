<html lang="en">
<head>
    <title>Task 3</title>
    <meta charset="UTF-8">
    <style>
        table, td {
            font-size: 24pt;
            border: 1px solid black;
        }
        td {
            padding: 5px;
        }
    </style>
</head>
<body>

<?php
$default_color = 'lightgreen';
$special_color = $default_color;
if (isset($_GET['color'])) {
    $special_color = $_GET['color'];
}
$table_size = 15;

echo "<table>\n";
for ($i = 0; $i < $table_size; $i++) {
    echo "\t<tr>\n";
    for ($j = 0; $j < $table_size; $j++) {
        $num = ($i + 1) * ($j + 1);
        if ($i == $j) {
            echo "\t\t<td style='background-color: ${special_color}'>" . $num . "</td>\n";
        } else {
            echo "\t\t<td>" . $num . "</td>\n";
        }
    }
    echo "\t</tr>\n";
}
echo "</table>\n";

?>

</body>
</html>
