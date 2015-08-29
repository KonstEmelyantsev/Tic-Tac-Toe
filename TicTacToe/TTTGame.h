//
//  TTTGame.h
//  TicTacToe
//
//  Created by KonstEmelyantsev on 8/29/15.
//  Copyright (c) 2015 KonstEmelyantsev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TTTPlayer) {
    PTPlayerFirstPlayer = 1,
    PTPlayerSecondPlayer = 2,
};

@interface TTTGame : NSObject

@property (nonatomic, strong) NSMutableArray *gameGrid;
@property (nonatomic, assign) NSUInteger currentPlayer;

- (id)initWithGameGrid:(NSMutableArray *)gameGrid;

@end
