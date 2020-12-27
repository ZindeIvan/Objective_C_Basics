//
//  GameViewController.m
//  Lesson-7
//
//  Created by Зинде Иван on 12/27/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

#import "GameViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define HALF_SCREEN_WIDTH SCREEN_WIDTH/2
#define HALF_SCREEN_HEIGHT SCREEN_HEIGHT/2
#define MAX_SCORE 6

@interface GameViewController ()

@property (strong, nonatomic) UIImageView *paddleTop;
@property (strong, nonatomic) UIImageView *paddleBottom;
@property (strong, nonatomic) UIView *gridView;
@property (strong, nonatomic) UIView *ball;
@property (strong, nonatomic) UITouch *topTouch;
@property (strong, nonatomic) UITouch *bottomTouch;
@property (strong, nonatomic) NSTimer *timer;
@property (nonatomic) float dx;
@property (nonatomic) float dy;
@property (nonatomic) float speed;
@property (strong, nonatomic) UILabel *scoreTop;
@property (strong, nonatomic) UILabel *scoreBottom;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
}


- (void)config {
    
    self.view.backgroundColor = [UIColor colorWithRed:100.0/255.0 green:135.0/255.0 blue:191.0/255.0 alpha:1.0];
    
    _gridView = [[UIView alloc] initWithFrame:CGRectMake(0, HALF_SCREEN_HEIGHT - 2, SCREEN_WIDTH, 4)];
    _gridView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:_gridView];
    
    _ball = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x - 10, self.view.center.y - 10, 20, 20)];
    _ball.backgroundColor = [UIColor whiteColor];
    _ball.layer.cornerRadius = 10;
    _ball.hidden = YES;
    [self.view addSubview:_ball];
    
    [self configurePaddle:_paddleTop whithImageName:@"paddleTop" andXCoordinate:30 andYCoordinate:40];
    
    [self configurePaddle:_paddleBottom whithImageName:@"paddleBottom" andXCoordinate:30 andYCoordinate:SCREEN_HEIGHT - 90];
    
    [self configureScoreLabel:_scoreTop whithXCoordinate:SCREEN_WIDTH - 70 andYCoordinate:HALF_SCREEN_HEIGHT - 70];
    
    [self configureScoreLabel:_scoreBottom whithXCoordinate:SCREEN_WIDTH - 70 andYCoordinate:HALF_SCREEN_HEIGHT + 20];
    
}

- (void)configurePaddle:(UIImageView *)imageView whithImageName:(NSString *)paddleImageName  andXCoordinate:(double)xCoordinate andYCoordinate:(double )yCoordinate {
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(xCoordinate, yCoordinate, 140, 100)];
    imageView.image = [UIImage imageNamed:paddleImageName];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview: imageView];
}

- (void) configureScoreLabel:(UILabel *)label whithXCoordinate:(double)xCoordinate andYCoordinate:(double )yCoordinate {
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(xCoordinate, yCoordinate, 50, 50)];
    label.textColor = [UIColor whiteColor];
    label.text = @"0";
    label.font = [UIFont systemFontOfSize:40.0 weight:UIFontWeightLight];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

@end
