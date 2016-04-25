# Objective-C Debugger
Objective-C relies on XCode internal debugger to step through code, pretty similar to GDB or kGDB.

<br><br>
# Set Breakpoint To Pause
To initiate a stepping debugger, use the breakpoint.

<br><br>

## 1) Set Breakpoint
To set breakpoint, click the line number until a blue bar pointer appears.

<br>

---------
<br><br>

## 2) Run the app and hits the breakpoint
Run the app and ensures you hit the breakpoint. The debugger will automatically appears for stepping sequence.

<br>

---------
<br><br>

## 3) Select Your Action
You can either select STEP OVER, STEP INTO and STEP OUT on the debugging toolbar.

<br>

---------
<br><br>

## 4) Type "c" in debugger console to continue running
Inside your debugger console, type "c" or "continue" to let the process run as normal.

```
(lldb) c
Process 10408 resuming
```


<br><br>

# Resources
1. https://developer.apple.com/library/ios/documentation/ToolsLanguages/Conceptual/Xcode_Overview/UsingtheDebugger.html