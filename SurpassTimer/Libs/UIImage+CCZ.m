//
//  UIImage+CCZ.m
//  HandForLOLForMe
//
//  Created by 陈曹振 on 15/11/11.
//  Copyright © 2015年 ccz. All rights reserved.
//

#import "UIImage+CCZ.h"

@implementation UIImage (CCZ)


+ (UIImage *)resizedImageWithName:(NSString *)name
{
    UIImage * image = [self imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

@end
