# WyhCornerRadius

![](http://upload-images.jianshu.io/upload_images/4097230-7c9d5d7c2cbee37e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

Quick and easy to set UIView's corner radius and border（include UIImageView、UIButton、UILabel..）without off-screen Rendering problem in GPU.

快速设置UIView的圆角和边框，并且在GPU方面不触发离屏渲染

## The rounded corners direction of support :

UIRectCorner  ( UIRectCornerTopLeft、UIRectCornerTopRight、UIRectCornerBottomLeft、UIRectCornerBottomRight、UIRectCornerAllCorners )

## Example code :

UIImageView :

```objc
//First eg:
    [img wyh_autoSetImageCornerRedius:viewWidth/2 ConrnerType:rectCorner Image:[UIImage imageNamed:@"test.jpg"]];
    
//Second eg:
    UIImageView *imageView = [UIImageView wyh_circleImageView];
    
```
UIButton :

```objc
//eg:
    [btn wyh_CornerRadius:viewWidth/2 Image:imageNormal  RectCornerType:UIRectCornerAllCorners BorderColor:[UIColor blueColor] BorderWidth:3 BackgroundColor:nil UIControlState:(UIControlStateNormal)];
```
UILabel :

```objc
//eg:
    [label wyh_CornerRadius:viewWidth/2 Image:nil RectCornerType:rectCorner BorderColor:[UIColor magentaColor] BorderWidth:2 BackgroundColor:nil];
```
## Contact me

- JianShu: [被帅醒的小吴同志](http://www.jianshu.com/u/b76e3853ae0b)
- Email:  609223770@qq.com
- QQ：609223770
