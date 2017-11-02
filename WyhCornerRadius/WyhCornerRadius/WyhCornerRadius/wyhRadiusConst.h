//
//  wyhRadiusConst.h
//  WyhCornerRadius
//
//  Created by wyh on 2017/10/31.
//  Copyright © 2017年 wyh. All rights reserved.
//

#ifndef wyhRadiusConst_h
#define wyhRadiusConst_h

#define wyh_swizzleMethod(oneSel,anotherSel) \
Method oneMethod = class_getInstanceMethod(self, oneSel); \
Method anotherMethod = class_getInstanceMethod(self, anotherSel); \
method_exchangeImplementations(oneMethod, anotherMethod); \

#define wyh_async_dispatch(block) dispatch_async(dispatch_get_global_queue(0, 0),block);

#define wyh_safe_dispatch(block) \
if ([NSThread isMainThread]) { \
block(); \
} else { \
dispatch_async(dispatch_get_main_queue(), block); \
}

#endif /* wyhRadiusConst_h */
