# Rearranging Row through Drag and Drop
It's pretty common for drag and drop table rearrangement via gesture. This
is a general guide based on Ray Wenderlich's guidances.

<br>
The output looks something like this:

![Drag and Drop](https://lh3.googleusercontent.com/QQVoDx-KeBxwvhv6yy8tM6dI9OEpubIs3LfuCAdXUsvXVyN2RZC8e-2XZx_NOpLtEIJ-Spy7l2wKDx2UyM59SKY66kiZi7Jjsb31QlosXqS3ehemeO_WQL1v3PjC_QJ9pNC_InkuxHInNW3Vh4ozAxRnUaudZgBSIXf-uL0d_GmTFHs6qJh2frXOG2odvl_ZKo39XWdGmFW5_DmF6szqpEDPT1FQNd2yymDXaioDViiWmZ6ISqBNAt4gs_nQYGiOEtAofb57uN0kmrJACYvwSBC6fWH40pWmp-pBCKSzEVGzEsMPUZeg54u8ZwLNGBD4dtnypPZ4p6wENpytQWZ6jE2h3qbPme5gUERLzsNm7mxknAi_Ew1OOvuFxi4c9Asq3L5Zzjp0yJIj-qxrxamQQi2sJazoGaLoW_ukuBc_0OoQ_cbtlE7vZCgnl16koX2OefhGl2RXR4w1Ua7IdCqpzU5t8-7_wVhByWzczAs2h9htJe7aJyU0FpOcwiBspd9ZX9-AVZ-veI3HeOCslRaRGEfa7TTYbb9TAgXe2DAFjMAJdMeylotWlvQaNy2ZnZ6IcnrRbw=w222-h346-no)

<br><br>

## Steps
### 1) Create a LongPressGestureRecognizer inside the ViewController

![Create Gesture](https://lh3.googleusercontent.com/gycyKcBJM7BFkLkhkWHhmr11GMV0pySMM2wFSX1qJjDuBDBfQOuxJrnNvEjA8nEXJdemAzrYhWQNK-S1sPCoPx0fb-iXaLFA5qNeo0ZhZ56txjaB9m305BaIWtt13lQMspHPS3GcpCyhUxiJDn9coPZsSXLDwW_qaxD1RetYuAtF067oKpIoVAQLdlfwr72-L8HN4U3b_IacSI9E-s9Edq1gHZqPSipXDvOQl-hYDGJRVnzwkJknn6NpD8I7Rc7fKN5KzhajNrW00FxQ6d7-v6WByeBenyllvi9yze86BBEuiWbEcv73P1MF64F9a0nqmDLxqO1mBRCgUIypcWGlofhhnygwcBeGHUhdfD057rF1-ZahoRZOet7UUG1koD9lC0tAiXWPnpDBfDE93TjhQ6m270YJFCzZ9ZJt8ZV-DB9bRW39h8UDE_8vaCHugDowyEAhwSvPXqM-EfWBQZjzq2j-w1FRG2RJn252hYH0ESIzhnrEloIz2-8vk2BeDAuYe9fY-58c0EmrOQY9ItAlsNgi2Q_z6lEclO-y1ujjSpCGB6wNoYgoRjko7QSBexjQLUbCNg=w474-h394-no)

<br>
<hr>
<br><br>


### 2) Create an IBAction for the LongPressGestureRecognizer in your controller.m

```
- (IBAction)didPressedLong:(id)sender
{
  return;
}
```

<br>
<hr>
<br><br>

### 3) Assign the LongPressedGestureRecognizer Send Actions and References Outlet Collections

![LongPressedGestureRecognizer](https://lh3.googleusercontent.com/kqeU1-5YFB1rhcHQgZGAvbOeIbMCk34EO5YbwvACJlVH8Jd2TFvP9qllEuU2-ZOydoVUlhgv53F4tHqxcY4RIm98HABbaistz2DNKv_j_2bWdr7i9XJQtn55nDE_V86ZuYkSbDKKdOR4L0-f-x2WsQBg5Y04bAVGZY1SYBoSnmV81AUhviMdIGXRe6eXo1ku9QeJpGuuaAptJ0o6ppbuQJ2NoardyCvKqboQARodkrbKkL_8RRbzxDKMELiBtvwP1c8X-hz8yFnu1J42rzWmkZtnbifFn9Ivi1wYi7ihd6CSHqF_BWxuyw9cNg6V58H731xVicUR_M8TcAUNofJGFIje2dA5WrTvvnSMvg2H57nwdW_wXL4XQVjb0Bpjp85FaywRBYNyju_B2kCxYZETOAw8HQeNY04Iqbsm5KppfnCbFsPgOFxqZtLuNAjCBl0kpTiIUKj-0e_JePp8zdfv731vPgn5NPJiYKCJeh9N0WwJ3u0jZyruJbmYyb8tgF--OvkN3O5-mzEWw6n07IrGcABgKkBqrj21MwF8yWKdhwP3uAQqLZ4I5Hl5FjWLs43BUytqeg=w2838-h470-no)


<br>
<hr>
<br><br>

### 4) Expand the IBAction Logics

```
- (IBAction)didPressedLong:(id)sender
{
    static UIView *snapshot = nil;
    static NSIndexPath *sourceIndexPath = nil;
    CGPoint center;
    ContactCell *cell;
    UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)sender;
    UIGestureRecognizerState state = longPress.state;
    CGPoint location = [longPress locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    
    switch (state) {
        case UIGestureRecognizerStateBegan:
            if (indexPath) {
                sourceIndexPath = indexPath;
                cell = [self.tableView cellForRowAtIndexPath:indexPath];
                snapshot = [self customSnapshotFromView:cell];
                
                // Create snapshot to illustrate the floating Drag
                __block CGPoint center = cell.center;
                snapshot.center = center;
                snapshot.alpha = 0.0;
                [self.tableView addSubview:snapshot];
                [UIView animateWithDuration:0.25 animations:^{
                    center.y = location.y;
                    snapshot.center = center;
                    snapshot.transform = CGAffineTransformMakeScale(1.05, 1.05);
                    snapshot.alpha = 0.98;
                    
                    cell.alpha = 0.0;
                } completion:^(BOOL finished) {

                    // Set the cell hidden at the beginning of the drag
                    cell.hidden = YES;
                }];
                
            }
            break;

        case UIGestureRecognizerStateChanged:
            center = snapshot.center;
            center.y = location.y;
            snapshot.center = center;
            
            // arrange the data structure and the table row
            if (indexPath && ![indexPath isEqual:sourceIndexPath]) {
                [contacts exchangeObjectAtIndex:indexPath.row withObjectAtIndex:sourceIndexPath.row];
                [self.tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:indexPath];
                sourceIndexPath = indexPath;
            }
            break;

        default:
            cell = [self.tableView cellForRowAtIndexPath:sourceIndexPath];
            cell.hidden = NO;
            cell.alpha = 0.0;
            
            // Animate the drag and drop during hover

            [UIView animateWithDuration:0.25 animations:^{
                
                snapshot.center = cell.center;
                snapshot.transform = CGAffineTransformIdentity;
                snapshot.alpha = 0.0;
                
                cell.alpha = 1.0;
                
            }completion:^(BOOL finished) {
                sourceIndexPath = nil;
                [snapshot removeFromSuperview];
                snapshot = nil;
            }];
            break;
    }
}

```


<br>
<hr>
<br><br>

### 5) Test it

![Drag and Drop](https://lh3.googleusercontent.com/QQVoDx-KeBxwvhv6yy8tM6dI9OEpubIs3LfuCAdXUsvXVyN2RZC8e-2XZx_NOpLtEIJ-Spy7l2wKDx2UyM59SKY66kiZi7Jjsb31QlosXqS3ehemeO_WQL1v3PjC_QJ9pNC_InkuxHInNW3Vh4ozAxRnUaudZgBSIXf-uL0d_GmTFHs6qJh2frXOG2odvl_ZKo39XWdGmFW5_DmF6szqpEDPT1FQNd2yymDXaioDViiWmZ6ISqBNAt4gs_nQYGiOEtAofb57uN0kmrJACYvwSBC6fWH40pWmp-pBCKSzEVGzEsMPUZeg54u8ZwLNGBD4dtnypPZ4p6wENpytQWZ6jE2h3qbPme5gUERLzsNm7mxknAi_Ew1OOvuFxi4c9Asq3L5Zzjp0yJIj-qxrxamQQi2sJazoGaLoW_ukuBc_0OoQ_cbtlE7vZCgnl16koX2OefhGl2RXR4w1Ua7IdCqpzU5t8-7_wVhByWzczAs2h9htJe7aJyU0FpOcwiBspd9ZX9-AVZ-veI3HeOCslRaRGEfa7TTYbb9TAgXe2DAFjMAJdMeylotWlvQaNy2ZnZ6IcnrRbw=w222-h346-no)

<br>
<hr>
<br><br>

## Resources
1. https://developer.apple.com/library/ios/documentation/EventHandling/Conceptual/EventHandlingiPhoneOS/GestureRecognizer_basics/GestureRecognizer_basics.html
2. https://www.raywenderlich.com/63089/cookbook-moving-table-view-cells-with-a-long-press-gesture