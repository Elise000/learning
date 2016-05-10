# Dismiss Keyboard
Upon typing completion, resign keyboard from screen needs a certain code
implementation. Keyboard dismissed by tapping spaces outside the keyboards and
return key can be done using the following implementation.

## Codes
### For normal UIView
#### Objective-C
On normal UIView, you can use the built-in function as follows:
```
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


```

<br>
On your ViewController ```.m``` file's interface, you need to add in a textField's
delegate.
```
@interface ViewController () <UITextFieldDelegate>

@end
```

<br>
If you're using GUI, assign the self delegate for execution.
```
self.emailTextField.delegate = self;
self.passwordTextField.delegate = self;
```

<br>
Next is to add the delegate methods. In this example, it's email field to
password field, and then dismiss keyboard.
```
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField.tag == 1) {
        [self.passwordTextField becomeFirstResponder];
    }
    else {
        [textField resignFirstResponder];
    }
    return YES;
}
```

<br><br>
Hence, the final code will looks something like this:
```

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.emailTextField.delegate = self;
    self.passwordTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Email Login Fields
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField.tag == 1) {
        [self.passwordTextField becomeFirstResponder];
    }
    else {
        [textField resignFirstResponder];
    }
    return YES;
}

@end

```

<br><hr><br><br>

### Case for UITableView
For UITableViewController, you'll need to use UITapGestureRecognizer to execute
the dismiss due to UIScrollView intervention inside UITableViewController.

<br>
Then, attach the UITapGestureRecognizer to an IBAction to execute.

<br>
Example:

<br>
#### Objective-C

```
- (IBAction)TablePressed:(id)sender
{
    if(![self.view endEditing:NO]) {
        [self.view endEditing:YES];
    }
}
```

<br><hr><br><br>
## References
1. http://stackoverflow.com/questions/3573955/how-to-hide-the-keyboard-when-i-press-return-key-in-a-uitextfield