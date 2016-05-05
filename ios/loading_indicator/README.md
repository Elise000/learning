# Loading Indicator
Loading indicator on screen is the simpliest view used in almost everywhere.
It can be insides a ViewController or between segue views. This guide is planned
to show both types of implementation.

<br><hr><br><br>

## Between segue views
If you want to apply loading indicator between 2 segues, you'll need to use
[no action segue](https://github.com/hollowaykeanho/learning/tree/master/ios/create_segue_with_no_action) instead.

<br>
This guide uses [MBProgressHUD](https://github.com/jdg/MBProgressHUD) due to
its simplicity.

<br><br>
### 1) Create a no-action segue
You can view the [no action segue](https://github.com/hollowaykeanho/learning/tree/master/ios/create_segue_with_no_action).

<br>
![Create non-action segue](https://lh3.googleusercontent.com/LFm1xMf9XoOZbYO3kUhSwArhh0ilFRHQTxM6INSPcllEjJ5K2f-2GpLUo-Rvqi4_OmzLdzxPu8fllDDhdY4wQ_jxf2v0Z_M-Ll1I-z8EN9nuMSqvSdAMDZiwdPFCPKVmztdluip1emPDNpJ-6SY5ktBZd8vHKwGeBekhIVIbJUJkJMNzjEq59Ef3QDMaQGqi8gzqoPv3dGYu5_MbRX5nv_frya8SJnnv5BXnA57d3aGl_nnYi_OoKH3SrbhBqU6vcwMsCujC3dt9JurS8tai3jk0tbre3oG25pDzpapY0qOLiWPfHhiMT43emX1bxpETNRBAY7yD_Iv75Q-dwEILM3GJ99ZYVNmbLagVM7-3ARWWWg1yGUKnpQdncTxUl0lYDyQnZPSog3VH1-WGigZHHTooeywRg40xUsGMHCCE4tYl4ce0s4942a8o6ErCEByr9LaoK5yFCL017ECYpyC9bn65_5F5U927mcyK6jwwtBJowxFSlFdaFrnZTmXOmsQOX0Fq0jIMQgbTj8nouhc-FUMX5KrTF6ixrsQq3disY1otUTZAuAeq4djnIbTlqqk6XHt-Zw=w480-h312-no)


<br><br>
### 2) give the segue an identifier
You can give it via the attribute inspector.

<br><br>
### 3) Install the MBProgressHUD
Follow the [MBProgressHUD](https://github.com/jdg/MBProgressHUD) on installing
the 2 source codes.

<br><br>
### 4) attach the IBAction and deploy the loading bar with segue indicator

<br>
#### Objective-C
```
- (IBAction)didPressedLogin:(id)sender {
    
    // Start the loading indicator
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.label.text = @"Loading";
    hud.progress = YES;
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        
        // Perform the operations here
        ...
        
        // Stop and dismiss the loading indicator
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
        
        // This is programmatically triggering a segue
        // Ensures the identifier is the same inside the storyboard.
        [self performSegueWithIdentifier:@"login" sender:self];
    });
    
}
```
