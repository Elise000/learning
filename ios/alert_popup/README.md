# Alert Popup
This guide is setting up ***UIAlertViewController*** as a step to move on from ***UIAlertView***.



## Conventional Controller
### Objective C
```
        _actionSheet = [UIAlertController
                          alertControllerWithTitle:nil
                                           message:nil
                                    preferredStyle:UIAlertControllerStyleActionSheet];

        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel"
                                                         style:UIAlertActionStyleCancel
                                                       handler:^(UIAlertAction * action){
                                                           _actionSheet = nil;
                                                       }];

        UIAlertAction *take_photo = [UIAlertAction actionWithTitle:@"Take Photo"
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * _Nonnull action) {
                                                               [self takePhoto];
                                                           }];

        UIAlertAction *choose_from_library = [UIAlertAction actionWithTitle:@"Choose From Library"
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * _Nonnull action) {
                                                               [self choosePhotoFromLibrary];
                                                           }];

        [_actionSheet addAction:take_photo];
        [_actionSheet addAction:choose_from_library];
        [_actionSheet addAction:cancel];
        
        [self presentViewController:_actionSheet animated:YES completion:nil];
```

<br>
### Swift
```
        let alert  = UIAlertController(title: "Hello World",
                                       message: "This is my first app!",
                                       preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "Awesome",
                                   style: .Default,
                                   handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil);
```

<br><hr><br><br>

## App Delegate Controller (Objective C)
```
    UIAlertController *alert = [UIAlertController
                                  alertControllerWithTitle:NSLocalizedString(@"Internal Error", nil)
                                                   message:NSLocalizedString(@"There was a fatal error in the app \
                                                                    and it cannot continue.\n\nPress OK to \
                                                                    terminate the app. Sorry for the \
                                                                    inconvenience.", nil)
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK"
                                                 style:UIAlertActionStyleCancel
                                               handler:^(UIAlertAction * action) {
                                                   abort();
                                               }];
    [alert addAction:ok];

    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.rootViewController = [[UIViewController alloc] init];
    window.windowLevel = UIWindowLevelAlert + 1;
    [window makeKeyAndVisible];
    [window.rootViewController presentViewController:alert animated:YES completion:nil];
```

<br>

-------------
<br><br>