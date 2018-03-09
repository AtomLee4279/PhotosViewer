//
//  ViewController.m
//  PhotosViewer
//
//  Created by 李一贤 on 2018/3/9.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)preView;
- (IBAction)next;
@property(nonatomic,assign)int index;//图片索引值，用来判断当前是否第一张/最后一张
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)preView
{
    self.index --;
    switch (_index) {
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

- (IBAction)next
{
    
    self.index ++;
    switch (_index) {
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
