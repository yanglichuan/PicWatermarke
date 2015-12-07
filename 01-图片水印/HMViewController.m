//
//  HMViewController.m
//  01-图片水印
//
//  Created by apple on 14-9-4.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMViewController.h"

@interface HMViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImage *oldImage = [UIImage imageNamed:@"img"];
    
    // 开启上下文
    // size 新的图片大小
    // opaque YES 不透明 NO 透明
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 0.0);
    [oldImage drawAtPoint:CGPointZero];
    
    NSString *text =  @"我要高薪 ！";
    NSDictionary *dict = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:15],
                           NSForegroundColorAttributeName : [UIColor redColor]
                           
                           };
    [text drawAtPoint:CGPointMake(120, 170) withAttributes:dict];
    
    // 获取新的图片
    UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    _imageView.image = newImage;
    
    // 把图片转换成png格式的二进制数据
    NSData *data = UIImagePNGRepresentation(newImage);
    
    // 写入桌面
    [data writeToFile:@"/Users/apple/Desktop/newImage.png" atomically:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
