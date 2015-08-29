//
//  TTTGameCell.h
//  TicTacToe
//
//  Created by KonstEmelyantsev on 8/29/15.
//  Copyright (c) 2015 KonstEmelyantsev. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TTTGameValue) {
    TTTGameValueToe = -1,
    TTTGameValueTic = 1,
};

@interface TTTGameCell : UIButton

@property (nonatomic, assign) NSUInteger currentGameValue;

@end
