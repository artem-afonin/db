<?php

$var1 = "Alice";
$var2 = "My friend is $var1";
$var3 = 'My friend is $var1';
$var4 =& $var1;

echo $var1, '<br>';
echo $var2, '<br>';
echo $var3, '<br>';
echo $var4, '<br>';
echo '<br>';

$var1 = "Bob";

echo $var1, '<br>';
echo $var2, '<br>';
echo $var3, '<br>';
echo $var4, '<br>';
echo '<br>';

$user = 'Michael';
$$user = 'Jackson';

echo $var1, '<br>';
echo $var2, '<br>';
echo $var3, '<br>';
echo $var4, '<br>';
echo $user, '<br>';
echo $$user, '<br>';
echo $Michael, '<br>';
echo '<br>';
