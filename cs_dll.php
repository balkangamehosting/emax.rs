<?php
$hit_count = @file_get_contents('preuzimanja.txt');
$hit_count++;
@file_put_contents('preuzimanja.txt', $hit_count);

header('Location: /cs/cs.exe'); 
?>