# Gravity Fall Animation
To create collision animation effect, you'll need to create a single collision
animator.

<br><br>
## Code
### Objective-C
#### 1) Create an animator for the view controller
```
@interface ViewController ()

@property UIDynamicAnimator *animator;
@property UICollisionBehavior *collision;

@end
```

<br><hr><br><br>

#### 2) Initialize both animator and behaviors in viewDidLoad, once.
```
- (void)viewDidLoad {
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    self.collision = [[UICollisionBehavior alloc] init];
    self.collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:self.collision];

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
    [self.collision addItem:block];
```

<br><hr><br><br>

#### 4) Test it
![Collision After Fall](https://lh3.googleusercontent.com/uAkjHPUNEmBcHBTaEqwU1Nb4mw8TbpS_Z_pUK9vNHg77TMCY6btAim8m6Ezu_cHA1dEGhjIQ1xEBMPE2-8v3Mvw2K6snj8GN-nLgWQ3UfCFKEQliAjzRZiAMTE6r2I9QOQlJoZgCwwhU-nPN8JKV8ZecjD7NawXdtNd4-rUawe2Rzpn66JI0gRws_aFIWFH8rQ6M8VWi3O0aAZCfMvn6-AFILiaB2LQqYYmW4ncf8I56z1NBD8z_YV0c1CnABVZAWKWraHP3hKS9j9apa0IUYaWQHjzuk4-JhG30Mh7gGkzYMZl3HQGmPxL3vBU2dol6D86n_eCFVuE64zu_p1WCf3LRkX5IU8CIgUO_O2X55aGQRi3L5zKVDM91dd9wMRY7vnwN_atuVx551mal0mXMe4-sq2pHZugKmR0kOYrDdMSGego2wryF3YXvG5txFxjNr6t3JJrdKUS55tHgzS_d7y5TTo6ekYvzXtdhTZZhoBkUSYDwfZK50ft7-F3sgrk7s739NK5E8pJjL1AE-RL6FqJenDPz6J5Jq1Xltzrpz4kv6SUYfdo0i77x8Wtnpeh8VFOxdA=w480-h885-no)

<br><hr><br><br>

## References
1. https://www.raywenderlich.com/50197/uikit-dynamics-tutorial
2. http://www.ios-blog.co.uk/tutorials/objective-c/ios-7-how-to-use-uigravitybehavior/
3. http://www.teehanlax.com/blog/introduction-to-uikit-dynamics/
4. https://www.objc.io/issues/5-ios7/collection-views-and-uidynamics/