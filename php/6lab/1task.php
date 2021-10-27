<html lang="en">
<head>
    <title>Task 1</title>
    <meta charset="UTF-8">
</head>
<body>

<?php
$lang = 'unknown';
if (isset($_GET['lang'])) {
    switch ($_GET['lang']) {
        case 'ru': $lang = 'russian'; break;
        case 'en': $lang = 'english'; break;
        case 'fr': $lang = 'french'; break;
        case 'de': $lang = 'deutsch'; break;
    }
}
?>

<h2><?= $lang ?></h2>

</body>
</html>
