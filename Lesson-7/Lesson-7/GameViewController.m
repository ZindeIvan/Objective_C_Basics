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

@property (weak, nonatomic) UIImageView *paddleTop;
@property (weak, nonatomic) UIImageView *paddleBottom;
@property (weak, nonatomic) UIView *gridView;
@property (weak, nonatomic) UIView *ball;
@property (weak, nonatomic) UILabel *scoreTop;
@property (weak, nonatomic) UILabel *scoreBottom;


@property (strong, nonatomic) UITouch *topTouch;
@property (strong, nonatomic) UITouch *bottomTouch;
@property (strong, nonatomic) NSTimer *timer;

@property (nonatomic) float dx;
@property (nonatomic) float dy;
@property (nonatomic) float speed;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self becomeFirstResponder];
    [self newGame];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self resignFirstResponder];
}

- (void)config {
    
    self.view.backgroundColor = [UIColor colorWithRed:100.0/255.0 green:135.0/255.0 blue:191.0/255.0 alpha:1.0];
    
    UIView *grid = [[UIView alloc] initWithFrame:CGRectMake(0, HALF_SCREEN_HEIGHT - 2, SCREEN_WIDTH, 4)];
    grid.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:grid];
    self.gridView = grid;
    
    UIView *ball = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x - 10, self.view.center.y - 10, 20, 20)];
    ball.backgroundColor = [UIColor whiteColor];
    ball.layer.cornerRadius = 10;
    ball.hidden = YES;
    [self.view addSubview:ball];
    self.ball = ball;
    
    self.paddleTop = [self configurePaddleWhithImageName:@"paddleTop" andXCoordinate:30 andYCoordinate:40];
    
    self.paddleBottom = [self configurePaddleWhithImageName:@"paddleBottom" andXCoordinate:30 andYCoordinate:SCREEN_HEIGHT - 90];
    
    self.scoreTop = [self configureScoreLabelWhithXCoordinate:SCREEN_WIDTH - 70 andYCoordinate:HALF_SCREEN_HEIGHT - 70];
    
    self.scoreBottom = [self configureScoreLabelWhithXCoordinate:SCREEN_WIDTH - 70 andYCoordinate:HALF_SCREEN_HEIGHT + 20];
    
}

- (UIImageView *) configurePaddleWhithImageName:(NSString *)paddleImageName  andXCoordinate:(double)xCoordinate andYCoordinate:(double )yCoordinate {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(xCoordinate, yCoordinate, 140, 100)];
    imageView.image = [UIImage imageNamed:paddleImageName];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview: imageView];
    return imageView;
}

- (UILabel *) configureScoreLabelWhithXCoordinate:(double)xCoordinate andYCoordinate:(double )yCoordinate {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(xCoordinate, yCoordinate, 50, 50)];
    label.textColor = [UIColor whiteColor];
    label.text = @"0";
    label.font = [UIFont systemFontOfSize:40.0 weight:UIFontWeightLight];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    return label;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint point = [touch locationInView:self.view];
        if (self.bottomTouch == nil && point.y > HALF_SCREEN_HEIGHT) {
            self.bottomTouch = touch;
            self.paddleBottom.center = CGPointMake(point.x, point.y);
        }
        else if (self.topTouch == nil && point.y < HALF_SCREEN_HEIGHT) {
            self.topTouch = touch;
            self.paddleTop.center = CGPointMake(point.x, point.y);
        }
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint point = [touch locationInView:self.view];
        if (touch == self.topTouch) {
            if (point.y > HALF_SCREEN_HEIGHT) {
                self.paddleTop.center = CGPointMake(point.x, HALF_SCREEN_HEIGHT);
                return;
            }
            self.paddleTop.center = point;
        }
        else if (touch == self.bottomTouch) {
            if (point.y < HALF_SCREEN_HEIGHT) {
                self.paddleBottom.center = CGPointMake(point.x, HALF_SCREEN_HEIGHT);
                return;
            }
            self.paddleBottom.center = point;
        }
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        if (touch == self.topTouch) {
            self.topTouch = nil;
        }
        else if (touch == self.bottomTouch) {
            self.bottomTouch = nil;
        }
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchesEnded:touches withEvent:event];
}


- (void)displayMessage:(NSString *)message {
    [self stop];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Ping Pong" message:message preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        if ([self gameOver]) {
            [self newGame];
            return;
        }
        [self reset];
        [self start];
    }];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)newGame {
    [self reset];
    
    self.scoreTop.text = @"0";
    self.scoreBottom.text = @"0";
    
    [self displayMessage:@"Готовы к игре?"];
}

- (int)gameOver {
    if ([self.scoreTop.text intValue] >= MAX_SCORE) return 1;
    if ([self.scoreBottom.text intValue] >= MAX_SCORE) return 2;
    return 0;
}

- (void)start {
    self.ball.center = CGPointMake(HALF_SCREEN_WIDTH, HALF_SCREEN_HEIGHT);
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(animate) userInfo:nil repeats:YES];
    }
    self.ball.hidden = NO;
}

- (void)reset {
    if ((arc4random() % 2) == 0) {
        self.dx = -1;
    } else {
        self.dx = 1;
    }
    
    if (self.dy != 0) {
        self.dy = -self.dy;
    } else if ((arc4random() % 2) == 0) {
        self.dy = -1;
    } else  {
        self.dy = 1;
    }
    
    self.ball.center = CGPointMake(HALF_SCREEN_WIDTH, HALF_SCREEN_HEIGHT);
    
    self.speed = 2;
}

- (void)stop {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.ball.hidden = YES;
}

- (void)animate {
    self.ball.center = CGPointMake(self.ball.center.x + self.dx*self.speed, self.ball.center.y + self.dy*self.speed);
    [self checkCollision:CGRectMake(0, 0, 20, SCREEN_HEIGHT) X:fabs(self.dx) Y:0];
    [self checkCollision:CGRectMake(SCREEN_WIDTH, 0, 20, SCREEN_HEIGHT) X:-fabs(self.dx) Y:0];
    if ([self checkCollision:self.paddleTop.frame X:(self.ball.center.x - self.paddleTop.center.x) / 32.0 Y:1]) {
        [self increaseSpeed];
    }
    if ([self checkCollision:self.paddleBottom.frame X:(self.ball.center.x - self.paddleBottom.center.x) / 32.0 Y:-1]) {
        [self increaseSpeed];
    }
    [self goal];
}

- (void)increaseSpeed {
    self.speed += 0.5;
    if (self.speed > 10) self.speed = 10;
}

- (BOOL)checkCollision: (CGRect)rect X:(float)x Y:(float)y {
    if (CGRectIntersectsRect(self.ball.frame, rect)) {
        if (x != 0) self.dx = x;
        if (y != 0) self.dy = y;
        return YES;
    }
    return NO;
}

- (BOOL)goal {
    if (self.ball.center.y < 0 || self.ball.center.y >= SCREEN_HEIGHT) {
        int s1 = [self.scoreTop.text intValue];
        int s2 = [self.scoreBottom.text intValue];
        
        if (self.ball.center.y < 0) ++s2; else ++s1;
        self.scoreTop.text = [NSString stringWithFormat:@"%u", s1];
        self.scoreBottom.text = [NSString stringWithFormat:@"%u", s2];
        
        int gameOver = [self gameOver];
        if (gameOver) {
            [self displayMessage:[NSString stringWithFormat:@"Игрок %i выиграл", gameOver]];
        } else {
            [self reset];
        }
        
        return YES;
    }
    return NO;
}


@end
