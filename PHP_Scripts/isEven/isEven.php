<?php

/*
 * Description:
*		This small function returns true if passed number is divisible by two, false if not.
*
* @author: Anatoly Spektor
*/
function isEven($number) {
	$isEven = false;
	if (is_numeric ($number)) {
		if ( $number % 2 == 0) $isEven = true;
	}
	return $isEven;
}

?>
