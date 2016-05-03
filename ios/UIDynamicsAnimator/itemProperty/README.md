# Configure Dynamics Property
To create a dynamics configuration, you'll need a UIDynamicAnimator with
UIDynamicItemBehavior. You can configure the following dynamics for the items:

1. elasticity - bouncy or rubbery for the item
2. friction - amount of resistance when moving on the surface
3. density - combined with size, provide overall masses of an item
4. resistance - amount of resistance for any linear movement
5. angularResistance - amount of resistance for any rotational movement
6. allowsRotation - Item can rotate or otherwise, can't rotate

<br><br>
## Code
### Objective-C
#### 1) Create an animator for the view controller
```
@interface ViewController ()

@property UIDynamicAnimator *animator;
@property UIGravityBehavior *gravity;

@end
```

<br><hr><br><br>

#### 2) Initialize both animator and behaviors in viewDidLoad, once.
```
- (void)viewDidLoad {
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    self.itemBehavior = [[UIDynamicItemBehavior alloc] init];
    self.itemBehavior.allowsRotation = NO; // YES
    self.itemBehavior.elasticity = 0.6;
    self.itemBehavior.friction = 0.00f;
    self.itemBehavior.angularResistance = 2.000f;
    [self.animator addBehavior:self.itemBehavior];
    
    [super viewDidLoad];
}
```

<br><hr><br><br>

#### 3) To add the animation to object, you can use ```addItem``` method
```
    // i) Create view to be animated
    UIView *block = [[UIView alloc] initWithFrame:CGRectMake(self.xPosition,
                                                             self.yPosition,
                                                             self.blockSize,
                                                             self.blockSize)];
    block.backgroundColor = [self generateRandomColor];
    [self.view addSubview:block]; //view must be added before behavior addition


    // ii) Add the view into gravity animator
    [self.itemBehavior addItem:block];
```

<br><hr><br><br>

#### 4) Test it
A free fall with no rotation will never rotate or spin after collision.
![No Rotation Fall](https://lh3.googleusercontent.com/sM6IDNeGD_6w6EZ9OQy9WiRzsUSaQj1gZ8Ai0V80Q12B4PoI4OBdIKBZmsp7MZn0L0AF1FCXd95Fe6a-kCauFusfLps-hPxFEBIdK0I7LxJlJ9Gi2lgtQ0EiQDfd-aqkM2JTzcQ98pND28knglhqhFscoDUFV_voyH1oTdMUVK_Ex6su8MJrdUj_fFgsrgaxlPxUFHNEIPu9OFcY1F5bLZ4YzbkNr8kTeUMMH_VgUdI8tihCeUCSrvFRBhjmB3B2aiPn04UK35v3hr97xGVUfVEbp1KVKIuSmfIeasormI1l7I2XmYfjqTz8eV31F4PlPjaP28fBbjedWonxspzsNMKjZzGjIYI3h2tBRQrRCoUn7BQ5lXpLZpJc8UK2GxZFYG85kkZ5AKtlIKIkInLfdbQ9IaR_raK7_MIFs2KJuc28VauoQGRPwkv-ydQLihSc-4x_z7jEo0fU7goSAKb7I7Ta6NU6yMOGi51dKTj3AVKESnofGYINZHtSXPRUKILxJrTHJhBdj4bZk6fiP65ZuLWuIoFJzs4zwtge2J0k8iwqqwqfNQAyi2DEJPB44v3MJk9nikOREuC282Gs-M8kbSzKF4MKNcUZ=w480-h882-no)

<br><hr><br><br>

## References
1. https://www.raywenderlich.com/50197/uikit-dynamics-tutorial
2. http://www.ios-blog.co.uk/tutorials/objective-c/ios-7-how-to-use-uigravitybehavior/
3. http://www.teehanlax.com/blog/introduction-to-uikit-dynamics/
4. https://www.objc.io/issues/5-ios7/collection-views-and-uidynamics/