<?php
require_once("../isEven.php");

/*
 * Tests use: PHPUnit framework
 * Description: All tests below are designed to check isEvent method
 * @author: Anatoly Spektor
 */
class isEventTest extends PHPUnit_Framework_TestCase
{
	public function setUp(){ }
	public function tearDown(){ }
	
	// passing even number
    public function testIsEvenPassEVEN()
    {  
        $this->assertTrue(isEven(400));
    }
    
    // passing odd number
    public function testIsEvenPassODD()
    {
    	$this->assertFalse(isEven(5));
    }
    
    // passing negative even number
    public function testIsEvenPassNegativeEVEN()
    {
    	$this->assertTrue(isEven(-4));
    }
    
    //passing negative odd number
    public function testIsEvenPassNegativeODD()
    {
    	$this->assertFalse(isEven(-5));
    }
    
    //passing 2 ( 2 % 2)
    public function testIsEvenPassTwo()
    {
    	$this->assertTrue(isEven(2));
    }
    
    // passing zero, assuming that 0 is even number
    public function testIsEvenPassZERO()
    {
    	$this->assertTrue(isEven(0));
    }
    
    // passing not a number
    public function testIsEvenPassString()
    {
    	$this->assertFalse(isEven("fail"));
    }
}
?>