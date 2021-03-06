//
//  ViewController.m
//  RangeSliderDemo
//
//  Created by Tom Thorpe on 31/03/2015.
//  Copyright (c) 2015 tomthorpe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet TTRangeSlider *rangeSlider;
@property (weak, nonatomic) IBOutlet TTRangeSlider *rangeSliderCurrency;
@property (weak, nonatomic) IBOutlet TTRangeSlider *rangeSliderCustom;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //standard rsnge slider
    self.rangeSlider.delegate = self;
    self.rangeSlider.minValue = 0;
    self.rangeSlider.maxValue = 200;
    self.rangeSlider.selectedMinimum = 50;
    self.rangeSlider.selectedMaximum = 150;
    self.rangeSlider.minimumValuesDifference = 10.0f;
    self.rangeSlider.leftHandle.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.25].CGColor;
    self.rangeSlider.leftHandle.borderWidth = 2.0;
    self.rangeSlider.leftHandle.borderColor = [UIColor greenColor].CGColor;
    self.rangeSlider.startTrackingBlock = ^void(CALayer *handle, CATextLayer *textLayer) {
        [CATransaction begin];
        [CATransaction setAnimationDuration:0.3];
        [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut] ];
        handle.transform = CATransform3DMakeScale(1.7, 1.7, 1);
        textLayer.transform = CATransform3DMakeScale(1.3, 1.3, 1);
        [CATransaction commit];
    };
    self.rangeSlider.endTrackingBlock = ^void(CALayer *handle, CATextLayer *textLayer) {
        [CATransaction begin];
        [CATransaction setAnimationDuration:0.3];
        [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut] ];
        handle.transform = CATransform3DIdentity;
        textLayer.transform = CATransform3DIdentity;
        [CATransaction commit];
    };
//    self.rangeSlider.handleLabelVerticalOffset = 20.0f;
//    self.rangeSlider.minSpacingBetweenLabels = 10.0f;
//    self.rangeSlider.minLabel.fontSize = 25.0f;
//    self.rangeSlider.minLabel.frame = CGRectMake(0, 0, 74, 25);
//    self.rangeSlider.minLabel.font = CFBridgingRetain(@"Futura-Medium");
    
    //currency range slider
    self.rangeSliderCurrency.delegate = self;
    self.rangeSliderCurrency.minValue = 50;
    self.rangeSliderCurrency.maxValue = 150;
    self.rangeSliderCurrency.selectedMinimum = 50;
    self.rangeSliderCurrency.selectedMaximum = 150;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    self.rangeSliderCurrency.numberFormatterOverride = formatter;
    
    //custom number formatter range slider
    self.rangeSliderCustom.delegate = self;
    self.rangeSliderCustom.minValue = 0;
    self.rangeSliderCustom.maxValue = 100;
    self.rangeSliderCustom.selectedMinimum = 40;
    self.rangeSliderCustom.selectedMaximum = 60;
    NSNumberFormatter *customFormatter = [[NSNumberFormatter alloc] init];
    customFormatter.positiveSuffix = @"B";
    self.rangeSliderCustom.numberFormatterOverride = customFormatter;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TTRangeSliderViewDelegate
-(void)rangeSlider:(TTRangeSlider *)sender didChangeSelectedMinimumValue:(float)selectedMinimum andMaximumValue:(float)selectedMaximum{
    if (sender == self.rangeSlider){
        NSLog(@"Standard slider updated. Min Value: %.0f Max Value: %.0f", selectedMinimum, selectedMaximum);
    }
    else if (sender == self.rangeSliderCurrency) {
        NSLog(@"Currency slider updated. Min Value: %.0f Max Value: %.0f", selectedMinimum, selectedMaximum);
    }
    else if (sender == self.rangeSliderCustom){
        NSLog(@"Custom slider updated. Min Value: %.0f Max Value: %.0f", selectedMinimum, selectedMaximum);
    }
}

-(void)rangeSlider:(TTRangeSlider *)sender didStartTrackingWithHandle:(CALayer *)handle andTextLayer:(CATextLayer*)textLayer {
    
}

-(void)rangeSlider:(TTRangeSlider *)sender didEndTrackingWithHandle:(CALayer*)handle andTextLayer:(CATextLayer*)textLayer {
    
}

@end
