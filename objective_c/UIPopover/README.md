# PopOver View
This is for custom Pop Over view creation. Firstly, you can create a UIView
controller. In this case, I'm using my custom menuViewController, inherit from
UIView controller.

<br><hr><br><br>

## Steps
### 1) Create a menuPopOver Object.

```
- (MenuViewController *)menuPopoverController
{
    if (_menuPopoverController == nil) {
        MenuViewController *menuViewController = [[MenuViewController alloc] initWithStyle:UITableViewStyleGrouped];
        menuViewController.detailViewController = self;
        menuViewController.modalPresentationStyle = UIModalPresentationPopover;

        
        _menuPopoverController = menuViewController;
    }
    return _menuPopoverController;
}
```

<br><br>

### 2) Attach the menuPopOver to an event

```
- (void)menuButtonPressed:(UIBarButtonItem *)sender
{
    if (self.menuPopoverController.isViewLoaded) {
        // Dismiss the view controller
        [[self.menuPopoverController presentingViewController] dismissViewControllerAnimated:YES completion:nil];

    } else {

        //Create a View Controller
        UIPopoverPresentationController *popController = self.menuPopoverController.popoverPresentationController;
        
        popController.barButtonItem = sender;
        popController.permittedArrowDirections = UIPopoverArrowDirectionAny;
        popController.delegate = (id) self;
        
        // Presenting the View Controller
        [self presentViewController:self.menuPopoverController animated:YES completion:nil];
    }
}
```


<br><hr><br><br>

## References
1. http://stackoverflow.com/questions/25189246/how-to-dismiss-uipopover-from-a-button-in-the-popover-with-ios-8-xcode-6-beta
2. http://stackoverflow.com/questions/2777438/how-to-tell-if-uiviewcontrollers-view-is-visible
3. http://stackoverflow.com/questions/32818297/how-to-correct-uipopovercontroller-is-deprecated-warning-message
