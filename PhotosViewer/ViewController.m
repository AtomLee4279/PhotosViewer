//
//  ViewController.m
//  PhotosViewer
//
//  Created by 李一贤 on 2018/3/9.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *preViewBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property(nonatomic,assign)int index;//图片索引值，用来判断当前是否第一张/最后一张
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.index = 0;
    self.preViewBtn.enabled = NO;
    [self setPhotosData];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//点击前一张/后一张触发事件
-(IBAction)viewPhotos:(UIButton*)btn
{
    (btn.tag == 1)?(self.index--):(self.index++);
    NSLog(@"viewPhotos:index:%@",[NSString stringWithFormat:@"%d",self.index]);
    [self setPhotosData];
    //设置按钮状态，及索引值
    switch (_index) {
        case 0:
            self.preViewBtn.enabled = NO;
            break;
        case 1:
            (btn.tag == 1)?(self.nextBtn.enabled = YES):(self.preViewBtn.enabled = YES);
            break;
        case 2:
            self.nextBtn.enabled =NO;
        default:
            (btn.tag == 1)?(self.index = 0):(self.index = 2);
            (btn.tag == 1)?(self.preViewBtn.enabled = NO):(self.nextBtn.enabled = NO);
            break;
    }
    
}
//根据索引值设置图片数据
-(void)setPhotosData
{
    switch (_index)
    {
        case 0:
            self.numLabel.text =@"1/3";
            self.headImage.image = [UIImage imageNamed:@"1"];
            self.descLabel.text = @"1";
            break;
        case 1:
            self.numLabel.text =@"2/3";
            self.headImage.image = [UIImage imageNamed:@"2"];
            self.descLabel.text = @"2";
            break;
        case 2:
            self.numLabel.text = @"3/3";
            self.headImage.image = [UIImage imageNamed:@"3"];
            self.descLabel.text = @"3";
        default:
            break;
    }
    
}

@end
