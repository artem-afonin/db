<html>
<head>
    <title>Task 2</title>
    <style>
        table, td {
            border: 1px solid black;
            border-spacing: 0;
        }

        td {
            font-size: 8pt;
            padding: 5px;
        }

        .td-blue {
            background-color: lightblue;
        }

        .td-green {
            background-color: lightgreen;
        }

        .td-red {
            background-color: lightcoral;
        }
    </style>
</head>
<body>
<table>
    <?php
    $high_bound = 30;
    for ($i = 1; $i <= $high_bound; $i++) {
        echo "<tr>";
        for ($j = 1; $j <= $high_bound; $j++) {
            $val = $i * $j;
            if (sqrt($val) == (int)sqrt($val) && sqrt(8 * $val + 1) == (int)sqrt(8 * $val + 1)) {
                echo "<td class='td-red'>${val}</td>";
            } elseif (sqrt($val) == (int)sqrt($val)) {
                echo "<td class='td-blue'>${val}</td>";
            } elseif (sqrt(8 * $val + 1) == (int)sqrt(8 * $val + 1)) {
                echo "<td class='td-green'>${val}</td>";
            } else {
                echo "<td>${val}</td>";
            }
        }
        echo "</tr>";
    }
    ?>
</table>
</body>
</html>