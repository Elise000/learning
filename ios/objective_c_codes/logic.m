/* Logics for Objectives-C
 * =============================
 * Covering logics syntax for operations controls
 */




/*
 * while loop
 */
int a = 10;
while (a < 20) {
	NSLog(@"loop index: %d", a);
	a++;
	if (a == 12)
		continue;		// Skip a particular entries
	if (a == 18)
		break; 			// break the loop
}




/*
 * for loop
 */
int a;
for (a=0; a<20; a++) {
	NSLog(@"loop index: %d", a);
	if (a == 12) { continue; } // Skip a particular entries
	if (a == 18) { break; } // break the loop
}




/*
 * if else if else
 */
int a = 15;
if (a < 5) {
	NSLog(@"Less than 5");
} else if (a < 10) {
	NSLog(@"Less than 10");
} else {
	NSLog(@"More than 10");
}




/*
 * switch
 */
int a = 15;
switch (a) {
case 0:
case 1:
case 2:
	NSLog(@"Stacked conditions");
	break;
case 15:
	NSLog(@"Print out");
default:
	NSLog(@"Default loop");
}




/*
 * Conditional Operator
 */
int a = 16;
NSLog(a >= 16 ? @"true" : @"false");