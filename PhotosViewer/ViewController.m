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
    self.index = 0;
    self.preViewBtn.enabled = NO;
    [self setPhotosData];
}

//懒加载（延迟加载）
//核心思想：当数据不存在的时候加载
//实现方式：重写get方法
-(NSArray*)images
{
    if(_images ==nil)//注意：此处若用self.images ==nil,那么相当于重写get方法里又调用了get方法。会造成死循环。所以改用成员属性_images描述
    {
        //读取图片数据
        //1.获取plist文件的全路径
        NSString* path = [[NSBundle mainBundle] pathForResource:@"images.plist" ofType:nil];
        //2.读取plist文件
        _images = [NSArray arrayWithContentsOfFile:path];
    }
    return _images;
}

//点击前一张/后一张触发事件
-(IBAction)viewPhotos:(UIButton*)btn
{
    switch (btn.tag) {
        case 1:
            self.index--;
            break;
        case 2:
            self.index++;
        default:
            break;
    }
    NSLog(@"viewPhotos:index:%@",[NSString stringWithFormat:@"%d",self.index]);
    [self setPhotosData];
    self.preViewBtn.enabled = (self.index!=0);
    self.nextBtn.enabled = (self.index!=self.images.count-1);
}

//根据索引值设置图片数据
-(void)setPhotosData
{
    self.numLabel.text = [NSString stringWithFormat:@"%d/%ld",_index+1,self.images.count];
    self.headImage.image = [UIImage imageNamed:self.images[_index][@"icon"]];
    self.descLabel.text = self.images[_index][@"desc"];
}

@end
