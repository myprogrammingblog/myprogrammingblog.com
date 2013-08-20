# Python Script that checks if number is power 2


# Bitwise version
def powTwoBit(number):
  return (number & (number-1) == 0) and (number != 0)
 
#Iterative version
def powTwoIter(number):
	isPowOfTwo=True;
	while (number != 1 and number > 0):
		if(number%2):
			# can do return here as well
			isPowOfTwo = False
		number=number/2
	return isPowOfTwo and (number > 0)
	 
  
  