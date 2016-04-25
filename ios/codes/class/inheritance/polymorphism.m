
/*
 * Class Polymorphism through inheritance
 */


// This is the base class. It's called the Living Thing class.
@interface LivingThing : NSObject
@property (atomic, strong)NSString *sound;

- (void)cry;

@end

@implementation LivingThing

- (void)cry
{
	if (*sound != NULL)
		NSLog(@"%@", sound);
	return;
}

@end





// This is the child class known as Human.
// It is a living thing. Hence, Human inherits Living Thing class.
// However, human greets "Hello World" as a cry.
@interface Human : LivingThing
	// Modified from parent
@property (atomic, strong)NSString *sound = @"Hello World";
@end

@implementation Human
	// Do nothing since we don't want to alter any original methods.
@end






// This is the child class known as Duck.
// It is a living thing. Hence, Duck inherits Living Thing class.
// However, duck greets "Quack" as a cry.
// Hence, we change the sound to "Quack".
// Also, duck overrides the cry sound by doing extra NSLog.
// Duck use "super" to execute the original cry operation, then adding its own
// code.
@interface Duck : LivingThing
	// Modified from parent
@property (atomic, strong)NSString *sound = @"Quack";
@end

@implementation Duck

- (void) cry			// Modify the original cry method. Polymorphism occured.
{
	[super cry];
	if (*sound != NULL)
		NSLog(@"Quack Quack: %@", sound);
	return;
}

@end