//
//  YLRangeSliderViewDelegate.h
//  FantasyRealFootball
//
//  Created by Tom Thorpe on 16/04/2014.
//  Copyright (c) 2014 Yahoo inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TTRangeSlider;

@protocol TTRangeSliderDelegate <NSObject>

-(void)rangeSlider:(TTRangeSlider *)sender didChangeSelectedMinimumValue:(float)selectedMinimum andMaximumValue:(float)selectedMaximum;
-(void)rangeSlider:(TTRangeSlider *)sender didStartTrackingWithHandle:(CALayer*)handle;
-(void)rangeSlider:(TTRangeSlider *)sender didEndTrackingWithHandle:(CALayer*)handle;

@end
