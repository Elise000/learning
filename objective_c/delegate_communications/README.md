# Delegate Communications
For classes to communicate with each other, iOS uses delegate methods to
communicate. Delegate is used for event triggered execution, such as monitoring
sensors or pressing a button.

<br>
In this example, we'll do a simple TableViewController delegation with
TableViewCell.

<br>
The communication looks something like the following UML:

<br>
!(Delegate_Example)[https://lh3.googleusercontent.com/gkax__wvft4VXQy9Pg-VzAqhCvIsf4-B9Ro9dHv4qfyCgFD-marxHklETCh6VA74ewbMmy1EyTAw_Yx_PvnbLmWGH5vfgQgYzMyLS96D6hdNrxBKs-647vgDIqxcZURPYjZpZaLte5zE8QiHLuIQTdcOooBv8qu7BVyEwQmT9KHfixMy59SA-eZkBULWcPAr4WGxSIMdDMGmYivC13HIcmH9jShKpXK0IucbZ4EOBVoEkhJCMB403JXMzzOTu5MB12nGpznxdnZ2fkk1JHElXToOE5hVCYxQnpWH0cLITnSqfLmBeYessAeB_n75FLoeumrMmM8cUQyd6o1oDIgD9li8xrDzPeO01L3ajo2LAKke_M9imWBvh-R6bxiJrvPqzq-6HUKVQmE8y_tm3TYo0HyjCCsAqZI7HprBKGfLaCpzYdWVqhGTRNmMJBb-n7OWS9TVvEVJXOebJjYQV3He_8M_LXyBHSlJCdOv869JHDxJv6nqCJHkY244F7yrJWqFpgJwLvwfgVK2zPnTzcMBSLBeojaiJLQ7EMD-honjpr8RNYnEF-THcT1JZ5lb1Jalbuym1g=w1890-h574-no]

<br><br>

## Steps for Creating Custom Delegate
### 1) Create a protocol for TableViewCell.h
The protocol is to declare delegate is available for this class.

```
@protocol aTableViewCellDelegate <NSObject>

@optional

@required

@end
```


<br><br>

### 2) Assign a property inside the TableViewCell interface, in the TableViewCell.h
This is to facilitate the class to offer delegate.

```
@interface aTableViewCell : UITableViewCell

@property (nonatomic, assign) id <aTableViewCellDelegate> delegate;

@end
```


<br><br>

### 3) Add a delegate action inside the protocol, in the TableViewCell.h
Now you can add your delegate functions inside the protocols.

```
@protocol aTableViewCellDelegate <NSObject>

@optional
- (void)onFoodButtonPressed:(UIButton *)sender;

@required

@end
```

<br><br>

### 4) Implement the delegate functions, in the TableViewCell.m
After delcaring the protocols, it's time to implement the delegate. The very
basic implementation is to call the object instance delegate function and
execute its own method, which will be implemented on external class delegate
function. (The steps will be shown later).

<br>
That said, hence, in this example, the button pressed wiill trigger the
```aTableViewCell``` action, which hence, execute the external class.

```
- (IBAction)onAButtonPressed:(id)sender
{
    [self.delegate onFoodButtonPressed:sender];
}
```

<br>
By this step, you have faciliate your TableViewCell.m a custom delegate
function.

<br>
<hr>
<br><br>

## Step for using the Delegate
### 1) Import the custom aTableViewCell.h.
```
#import "aButtonCell.h"
```

<br><br>

### 2) Include the delegate in the bTableViewController, in bTableViewController.m

```
@interface bTableViewController () <aTableViewCellDelegate>

  ...

@end
```


<br><br>

### 3) In the bTableViewController initialization part, remember to include delegate as self
In this example, since it's an UITableViewController, the initialization part
will be in ```tableView``` function.

```
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    aTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.delegate = self;
    
    return cell;
}
```

<br><br>

### 4) You can now safely implements the delegate in bTableViewController.m.

```
- (IBAction)onFoodButtonPressed:(UIButton *)sender
{
    NSLog(@"ButtonPressed!");
}
```
