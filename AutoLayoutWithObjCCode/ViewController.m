//
//  ViewController.m
//  AutoLayoutWithObjCCode
//
//  Created by Keun young Kim on 2015. 1. 29..
//  Copyright (c) 2015년 Keun young Kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel* centerLabel = [UILabel new];
    centerLabel.backgroundColor = [UIColor yellowColor];
    centerLabel.text = @"Hello Auto Layout";
    centerLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    NSLayoutConstraint* centerXConstraint = [NSLayoutConstraint constraintWithItem:centerLabel
                                                                         attribute:NSLayoutAttributeCenterX
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.view
                                                                         attribute:NSLayoutAttributeCenterX
                                                                        multiplier:1.0f
                                                                          constant:0.0f];
    NSLayoutConstraint* centerYConstraint = [NSLayoutConstraint constraintWithItem:self.view
                                                                         attribute:NSLayoutAttributeCenterY
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:centerLabel
                                                                         attribute:NSLayoutAttributeCenterY
                                                                        multiplier:1.0f
                                                                          constant:0.0f];
    [self.view addSubview:centerLabel];
    
    [self.view addConstraint:centerXConstraint];
    [self.view addConstraint:centerYConstraint];
    
    UIButton* updateButton = [UIButton new];
    updateButton.backgroundColor = [UIColor redColor];
    [updateButton setTitle:@"Update" forState:UIControlStateNormal];
    updateButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:updateButton];
    
    NSDictionary* views = NSDictionaryOfVariableBindings(updateButton);
    
    centerXConstraint = [NSLayoutConstraint constraintWithItem:updateButton
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.view
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0f
                                                      constant:0.0f];
    
    NSArray* horzConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"[updateButton(100)]"
                                                                       options:0
                                                                       metrics:nil
                                                                         views:views];
    NSArray* vertConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[updateButton(50)]-10-|"
                                                                       options:0
                                                                       metrics:nil
                                                                         views:views];
    [updateButton addConstraints:horzConstraints];
    [self.view addConstraint:centerXConstraint];
    [self.view addConstraints:vertConstraints];
    
    for (NSLayoutConstraint* theConstraint in self.view.constraints) {
        // ...
    }
    
    UIView* lineView = [UIView new];
    lineView.backgroundColor = [UIColor redColor];
    lineView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:lineView];
    
    views = NSDictionaryOfVariableBindings(centerLabel, lineView);
    
    horzConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"[lineView(==centerLabel)]"
                                                              options:0
                                                              metrics:nil
                                                                views:views];
    
    NSDictionary* metrics = @{@"margin":@5, @"lineViewHeight":@4};
    vertConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[centerLabel]-margin-[lineView(lineViewHeight)]"
                                                              options:NSLayoutFormatAlignAllCenterX
                                                              metrics:metrics
                                                                views:views];
    
    [self.view addConstraints:horzConstraints];
    [self.view addConstraints:vertConstraints];
}

@end