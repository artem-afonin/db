<html>
<head>
    <title>Task 3</title>
    <meta charset="UTF-8">
</head>
<body>

<?php
$pi = 3.1415926;
echo "Pi is ${pi}", '<br>';

$type = gettype($pi);
echo "Pi type is ${type}", '<br>';

$casted_pi = (int) $pi;
echo "Pi casted to int is ${casted_pi}", '<br>';

$casted_pi = (boolean) $pi;
echo "Pi casted to boolean is ${casted_pi}", '<br>';
echo '<br>';

$casted_pi = (string) $pi;
echo "Pi casted to string is ${casted_pi}";
$casted_pi = (int) $casted_pi;
echo " then casted to int and got ${casted_pi}";
$casted_pi = (boolean) $casted_pi;
echo " and finally casted to boolean and got ${casted_pi}", '<br>';
?>

</body>
</html>
