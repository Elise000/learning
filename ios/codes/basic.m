/* Basic Syntax for Objectives-C
 * =============================
 * Covers data types
 */


/*
 * Preprocessor
 */
#define I_AM_A_GLOBAL_VARIABLE = @"Something is this";




/*
 * Logging
 */
NSLog(@"This is a log entry.");




/*
 * Boolean
 */
BOOL isBool = YES;
BOOL isBool = NO;
NSLog(@"%d", isBool);
NSLog(@"%@", isBool ? @"YES" : @"NO");




/*
 * Characters
 */
char alphabet = 'a';
NSLog(@"The letter %c ASCII number is %hhd", alphabet, alphabet);
unsigned char alphabet = 0xFF;
NSLog(@"The letter %c ASCII number is %hhd", alphabet, alphabet);




/*
 * String
 */
NSString *string = @"This is how you assign string";
NSLog(string);
		// Use when dealing micro conversion of string.
		// E.g.: Algorithm modification.
NSMutableString *mutableString = @"Set strings up";
NSLog(string);

	// Operations
if ([string isEqualToString:@"String"]) {
	NSLog(string);
}

if ([string hasPrefix:@"string"]) {
	NSLog(string);
}

if ([string hasSuffix:@"some"]) {
	NSLog(@"This won't work since keyword is not there");
}

		// Joining String
NSLog([string stringByAppendingString:mutableString]);

		// Search String
NSRange searchResult = [string rangeOfString:"string"];
if (searchResult.location == NSNotFound) {
	;
} else {
	NSLog(@"index: %lu and length: %lu", searchResult.location,
																			 searchResult.length);
}

		// Replacing String
NSString *new_string = [string stringByAppendingString:@"string"
																withString:@"whatever"];

		// Changing Cases
NSLog(@"%@", [string lowercaseString]);	//all small string
NSLog(@"%@", [string uppercaseString]); //ALL CAP STRING
NSLog(@"%@", [string capitalizedString]); //All Capitalized String

		// Conversion
NSString *string = @"2012";
BOOL asBool = [string boolValue];
int asInt = [string intValue];
NSInteger asInteger = [string integerValue];
long long asLongLong = [string longLongValue];
float asFloat = [string floatValue];
double asDouble = [string doubleValue];




/*
 * Numbers
 */
int number = -1211;
unsigned int number = 234234;

short number = -32423423;
unsigned short number = 234234234l;

long number = -2342342;
unsigned long number = 234234234234;

long long number = -32423423423423;
unsigned long long number = 23423423423423423423;

float number = -21.09f;




/*
 * Arrays
 */
double numbers[5] = {11500, 20002, 112, 1234, 222};

		//determine size of array
int arraySize = sizeof(numbers) / sizeof(numbers[0]);




/*
 * Pointers
 */
int var = 20;
int *ip = &var; // Delcare and references




/*
 * Constants
 */
const int PI = 3.142;
#define LIGHT_SPEED = 3.18e8;




/*
 * Structure
 */
struct Book
{
	NSString *title;
	NSString *author;
	NSString *subject;
	int book_id;
}
struct Book book;
book.title=@"Book Name";
book.author=@"Name here";
book.subject=@"This is a very long subject";
NSLog(@"%@", book.title);
NSLog(@"%@", book.author);
NSLog(@"%@", book.subject);


struct Book *ref_book;
ref_book = &book;
NSLog(@"%@", ref_book->title);
NSLog(@"%@", ref_book->author);
NSLog(@"%@", ref_book->subject);


struct trigger_bit {
	unsigned int console:1;
	unsigned int trigger_bit:1;
	unsigned int action_bit:1;
	unsigned int settings:1;
	unsigned int levels:4;
	unsigned int keyword:9;
};
struct trigger_bit registerB;




/*
 * Typecasting
 */
NSString = @"Data";

