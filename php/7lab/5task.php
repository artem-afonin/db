<html>
<head>
    <title>Task 5</title>
    <style>
    </style>
</head>
<body>
<?php
function print_dict($dict)
{
    foreach ($dict as $key => $value) {
        echo "<h3>${key} => ${value}</h3>";
    }
}

function bubble_sort($dict, $by_key = true)
{
    $keys_array = [];
    $values_array = [];
    $size = 0;
    foreach ($dict as $key => $value) {
        $keys_array[$size] = $key;
        $values_array[$size] = $value;
        $size += 1;
    }

    for ($i = 0; $i < $size; $i++) {
        for ($j = $size - 1; $j > $i; $j--) {
            if ($by_key) {
                if ($keys_array[$j] < $keys_array[$j - 1]) {
                    $temp = $keys_array[$j];
                    $keys_array[$j] = $keys_array[$j - 1];
                    $keys_array[$j - 1] = $temp;
                    $temp = $values_array[$j];
                    $values_array[$j] = $values_array[$j - 1];
                    $values_array[$j - 1] = $temp;
                }
            } else {
                if ($values_array[$j] < $values_array[$j - 1]) {
                    $temp = $keys_array[$j];
                    $keys_array[$j] = $keys_array[$j - 1];
                    $keys_array[$j - 1] = $temp;
                    $temp = $values_array[$j];
                    $values_array[$j] = $values_array[$j - 1];
                    $values_array[$j - 1] = $temp;
                }
            }
        }
    }

    $result_dict = [];
    for ($i = 0; $i < $size; $i++) {
        $result_dict[$keys_array[$i]] = $values_array[$i];
    }

    return $result_dict;
}

$cust = [
    "cnum" => 2001,
    "cname" => "Hoffman",
    "city" => "London",
    "snum" => 1001,
    "rating" => 100
];

echo "<h2>Default print</h2>";
print_dict($cust);
echo "<hr/>";

echo "<h2>Sorted by key</h2>";
$sorted_cust = bubble_sort($cust, true);
print_dict($sorted_cust);
echo "<hr/>";

echo "<h2>Sorted by value</h2>";
$sorted_cust = bubble_sort($cust, false);
print_dict($sorted_cust);
echo "<hr/>";

echo "<h2>sort()</h2>";
sort($cust);
print_dict($cust);
echo "<hr/>";
?>
</body>
</html>