# Using Location Authorization Requirement
## Changes for iOS8 and Above
For iOS8 and above, location authorization is requested proactively. This
implementation is a compulsory requirement.

## Key Addition to info.plist
You'll need to add in 2 more keys into your info.plist for storing user
authorization status. These keys are:

```
NSLocationWhenInUseUsageDescription - String
NSLocationAlwaysUsageDescription - String
```

Once you've added thee fields, you can proceed with next section

<br>

<hr>
<br><br>


## Check for status
To check for authorization status, on objective-C, it is:

```
CLAuthorizationStatus authorization_status = [CLLocationManager authorizationStatus];
```


<br>
There are a number of keys:

<br><br>

### Not Determined
User haven't been asked for permission.

```
authorization_status == kCLAuthorizationStatusNotDetermined
```


<br>

### Denied
User had denied location permission to your app.

```
authorization_status == kCLAuthorizationStatusDenied
```

<br>

### Restriction
User was set to have location turned off in settings (parental control).

```
authorization_status == kCLAuthorizationStatusRestricted
```

<br>

### Authorized (Deprecated)
User allows the app to use location for background use.

```
authorization_status == kCLAuthorizationStatusAuthorized
```

<br>

### Authorized Always
Same as above. This is commonly used.

```
authorization_status == kCLAuthorizationStatusAuthorizedAlways == kCLAuthorizationStatusAuthorized
```

<br>
### When In Use
User only approves app to use location in foreground (active on screen).

```
authorization_status == kCLAuthorizationStatusAuthorizedWhenInUse
```

<br>

<hr>
<br><br>

## Request Authorization
Once you determine the authorization permission, you can use the
**CLLoationManager** request authorization method for user permission. Example:

```
    if (authorization_status == kCLAuthorizationStatusNotDetermined ||
        authorization_status == kCLAuthorizationStatusDenied) {
        [CLLocationManager requestWhenInUseAuthorization];
    }

```

or:

```
    if (authorization_status == kCLAuthorizationStatusNotDetermined ||
        authorization_status == kCLAuthorizationStatusDenied) {
        [CLLocationManager requestAlwaysAuthorization];
    }

```

<br><br>

## References
1. http://nevan.net/2014/09/core-location-manager-changes-in-ios-8/