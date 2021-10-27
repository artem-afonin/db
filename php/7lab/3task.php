<html>
<head>
    <title>Task 3</title>
    <style>
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
<table>
    <?php
    $high_bound = 30;
    for ($i = 1; $i <= $high_bound; $i++) {
        echo "<tr>";
        for ($j = 1; $j <= $high_bound; $j++) {
            $val = $i * $j;
            switch ($val % 7) {
                case 0:
                    echo "<td style='background-color: white'>&nbsp;</td>";
                    break;
                case 1:
                    echo "<td style='background-color: aqua'>&nbsp;</td>";
                    break;
                case 2:
                    echo "<td style='background-color: blue'>&nbsp;</td>";
                    break;
                case 3:
                    echo "<td style='background-color: gold'>&nbsp;</td>";
                    break;
                case 4:
                    echo "<td style='background-color: mediumpurple'>&nbsp;</td>";
                    break;
                case 5:
                    echo "<td style='background-color: lightcoral'>&nbsp;</td>";
                    break;
                case 6:
                    echo "<td style='background-color: lime'>&nbsp;</td>";
                    break;
            }
        }
        echo "</tr>";
    }
    ?>
</table>
</body>
</html>