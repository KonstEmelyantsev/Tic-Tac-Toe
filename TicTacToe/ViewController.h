//
//  ViewController.h
//  TicTacToe
//
//  Created by KonstEmelyantsev on 8/29/15.
//  Copyright (c) 2015 KonstEmelyantsev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TTTGameController;

@interface ViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *gameGrid;
@property (nonatomic, strong) TTTGameController *currentGame;

@end

