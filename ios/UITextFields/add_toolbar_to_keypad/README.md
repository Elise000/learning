# Adding Toolbar to Keypad for UITextFields
In case you need to add additional items on your keypad, you can use UIToolbar.

<br>
UIToolbar allows you to add additional item on top of your keypad. Example of
usage would be like for numberpad, there is no return/enter button. Hence,
you'll need to add in by your own.

<br><hr><br><br>

## Code
The code is much simple and can be used in any methods when necessary.

### Objective-C
```
- (void)viewDidLoad
{
    [super viewDidLoad];


    UIToolbar *phoneNumberPad = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    phoneNumberPad.barStyle = UIBarStyleDefault;
    phoneNumberPad.items = @[
                                   [ [UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                  target:nil
                                                                                  action:nil],
                                   [ [UIBarButtonItem alloc] initWithTitle:@"Apply"
                                                                     style:UIBarButtonItemStyleDone
                                                                    target:self
                                                                    action:@selector(doneWithPhoneNumberPad)]
                                   ];
    [phoneNumberPad sizeToFit];
    self.phoneNumberField.inputAccessoryView = phoneNumberPad;
}

-(void)doneWithPhoneNumberPad
{
    [self.phoneNumberField resignFirstResponder];
}
```


<br><hr><br><br>
## References
1. http://stackoverflow.com/questions/584538/how-to-show-done-button-on-iphone-number-pad