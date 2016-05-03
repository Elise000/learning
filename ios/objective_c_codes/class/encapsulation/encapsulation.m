/* Class Data Encapsulation
 * ========================
 * socialSecurityNumber and total are not accessible outside class Bank.
 * Class private instance variables are used to store those sensitive data.
 */

@interface Bank : NSObject
	{
		NSString *socialSecurityNumber; // 123-456-789
		NSString *total;
	}

	- (NSString)getTotal;
	- (NSString)displayPrivateDataOnScreen;
@end

@implementation Bank
- (NSString)getTotal
{
	return total;
}

- (NSString)displayPrivateDataOnScreen
{
	return (@"%XXX-XXX-@%@%@", socialSecurityNumber[8],
														 socialSecurityNumber[9],
														 socialSecurityNumber[10])
}
@end