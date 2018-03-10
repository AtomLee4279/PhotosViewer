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
@property(strong,nonatomic) NSArray *images;//一般oc对象用strong，UI控件用weak
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //保存图片数据
    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
    dict1[@"icon"] = @"1";
    dict1[@"desc"] = @"1";
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
    dict2[@"icon"] = @"2";
    dict2[@"desc"] = @"2";
    NSMutableDictionary *dict3 = [NSMutableDictionary dictionary];
    dict3[@"icon"] = @"3";
    dict3[@"desc"] = @"3";
    _images = @[dict1,dict2,dict3];
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
    self.numLabel.text = [NSString stringWithFormat:@"%d/%d",_index+1,3];
    self.headImage.image = [UIImage imageNamed:_images[_index][@"icon"]];
    self.descLabel.text = _images[_index][@"desc"];
}

@end
