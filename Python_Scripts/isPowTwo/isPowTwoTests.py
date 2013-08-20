import unittest
import isPowTwo

# Here's our "unit tests".
class IsPowTwoTests(unittest.TestCase):

	#testing Iterative PowTwo by passing Valid values
    def testIsPowTwoIterPassValid(self):
        self.assertTrue(isPowTwo.powTwoIter(2))
        self.assertTrue(isPowTwo.powTwoIter(256))
        self.assertTrue(isPowTwo.powTwoIter(64))
        self.assertTrue(isPowTwo.powTwoIter(32))
        
    #testing Iterative PowTwo by passing InValid values
    def testIsPowTwoIterPassInValid(self):
        self.assertFalse(isPowTwo.powTwoIter(3))
        self.assertFalse(isPowTwo.powTwoIter(15))
        self.assertFalse(isPowTwo.powTwoIter(77))
        self.assertFalse(isPowTwo.powTwoIter(-45))
        
     #testing Iterative PowTwo by passing Zero
    def testIsPowTwoIterPassZero(self):
        self.assertFalse(isPowTwo.powTwoIter(0))  
   
		
	#testing Bitwise PowTwo by passing Valid values
    def testIsPowTwoBitPassValid(self):
        self.assertTrue(isPowTwo.powTwoBit(2))
        self.assertTrue(isPowTwo.powTwoBit(256))
        self.assertTrue(isPowTwo.powTwoBit(64))
        self.assertTrue(isPowTwo.powTwoBit(32))
        
    #testing Bitwise PowTwo by passing InValid values
    def testIsPowTwoBitPassInValid(self):
        self.assertFalse(isPowTwo.powTwoBit(3))
        self.assertFalse(isPowTwo.powTwoBit(15))
        self.assertFalse(isPowTwo.powTwoBit(77))
        self.assertFalse(isPowTwo.powTwoBit(-45))
        
     #testing Bitwise PowTwo by passing Zero
    def testIsPowTwoBitPassZero(self):
        self.assertFalse(isPowTwo.powTwoBit(0))  


def main():
    unittest.main()

if __name__ == '__main__':
    main()