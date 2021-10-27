<html>
<head>
    <title>Task 4</title>
    <style>
        table {
            margin: 2rem auto;
        }

        table, td {
            border: 1px solid black;
            border-spacing: 0;
        }

        td {
            width: 14px;
            height: 15px;
            font-size: 1pt;
        }
    </style>
</head>
<body>
<?php
$high_bound = 30;
$colors = ["white", "aqua", "blue", "gold", "mediumpurple", "lightcoral", "lime"];
for ($k = 4; $k <= 7; $k++) {
    echo "<table>";
    for ($i = 1; $i <= $high_bound; $i++) {
        echo "<tr>";
        for ($j = 1; $j <= $high_bound; $j++) {
            $val = $i * $j;
            echo "<td style='background-color: ${colors[$val % $k]}'>&nbsp;</td>";
        }
        echo "</tr>";
    }
    echo "</table>";
}
?>
</body>
</html>