//
//  MakeCommentViewController.m
//  CarHelp
//
//  Created by Gao Huang on 14-12-2.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "MakeCommentViewController.h"

@implementation MakeCommentViewController
- (IBAction)sliderAction:(UISlider *)sender {
    self.valueLabel.text = [NSString stringWithFormat:@"%0.1f",sender.value];
}

- (IBAction)submitAction:(id)sender {
    
}
@end
