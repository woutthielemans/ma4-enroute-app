<?php
if(!empty($_SESSION['errors'])) 
{
	echo "<ul class=\"errors\">";
	foreach ($_SESSION['errors'] as $error) 
	{
		echo "<li>{$error}</li>";
	}
	echo "</ul>";
}