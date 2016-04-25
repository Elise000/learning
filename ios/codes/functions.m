/*
 * Basic function / method coding
 * ==============================
 */

	/* Objective-C Method */
- (void)method_name: (int) argument_1 andSecondArgumentName: (int) argument_2
{
	return 0;
}

	/* Example */
@implementation MathClass

- (void)max:(int) first_number andSecondNumber:(int) second_number
{
	if (num1 > num2)
		return num1;
	else
		return num2;
}

@end

int main()
{
	int a = 100;
	int b = 200;
	int ret;

	ret = [MathClass max:a andSecondNumber:b];
	NSLog(@"The value is: %d", ret);
	return 0;
}