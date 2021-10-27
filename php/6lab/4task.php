<html lang="en">
<head>
    <title>Task 4</title>
    <meta charset="UTF-8">
</head>
<body>

<?php

$size = 50;
$weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
$colors = ["black", "lightgray", "darkblue", "blue", "purple", "pink", "red"];

for ($i = 0; $i < count($weekdays); $i++) {
    $color_index = rand(0, count($colors) - 1);
    $format_str = weekday($weekdays[$i], $colors[$color_index]);
    echo "$format_str\n";
    $size -= 5;
}

function weekday($day, $color) {
    global $size;
    return "<p style='color: $color; font-size: ${size}pt'>$day</p>";
}

?>

</body>
</html>
