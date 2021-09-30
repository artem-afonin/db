<html>
<head>
    <title>Task 1</title>
    <meta charset="UTF-8">
</head>
<body>

<?php
$default_color = 'black';
$default_size = 18;
$color = $default_color;
$size = $default_size;

if (isset($_GET['color'])) {
    $color = $_GET['color'];
}

if (isset($_GET['size'])) {
    $size = $_GET['size'];
}
?>

<h1>Default color: <?=$default_color?></h1>
<h1>Default size: <?=$default_size?></h1>

<p><?php
    echo "<span style='color: ${color}; font-size: ${size}'>
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
</span>";
?></p>

</body>
</html>
