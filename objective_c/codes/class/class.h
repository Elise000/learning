/*
 * Class
 * ==============================
 */


	// @interface is for early delcaration purposes.
	// This is open for other files to import as library. Hence, it's inside
	// the header file (.h)
@interface AClassName:NSObject

	// @property is like class attributes that holds values for the class.
	// It's similar to class attributes in Ruby / Python.

// Atomic - values can be accessed by one class at a time. Thread-safe.
@property (atomic)NSString *lastName;

// non-Atomic - value can be accessed by many classes at a time.
// Not Thread-safe
@property (nonatomic)NSString *firstName;


// retain - pointer that keeps the value in the memory. Replaced by strong.
@property (retain)NSString *address;


// readonly - unchangable values by setter. Only read.
@property (readonly)NSString *socialSecurityNumber;


// readwrite - changable values by setter. Can read and write.
@property (readwrite)NSString *remarks;


// strong - replacement for retain
@property (strong)NSString *phoneNumber;


// copy - retain old values should a new value assigned to this property.
@property (copy)NSString *bankTransaction;


// assign - allows change of value
@property (assign)NSString *latestTweet;


// weak - pointer that doesn't keep the value in memory.
@property (weak)NSString *recentSentences;

// Declare your class methods here, after declaring the @property
// Notice the "+" sign
+ (void) aClassMethod;

// Declare your instance methods here, after declaring the class methods
// Notice the "-" sign
- (void) aMethod;

@end

/*
 *
 * To use a class method: it looks something like this:
 * NOTE: you don't need to create an instance object to use the method
 *
 * AClassName.aClassMethod
 *
 *
 * An instance method: it looks something like this:
 *
 * AClassName class = [[AClassName alloc] init];
 * class.aMethod;
 *
 */