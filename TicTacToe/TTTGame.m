//
//  TTTGame.m
//  TicTacToe
//
//  Created by KonstEmelyantsev on 8/29/15.
//  Copyright (c) 2015 KonstEmelyantsev. All rights reserved.
//

#import "TTTGame.h"

@implementation TTTGame

- (id)initWithGameGrid:(NSMutableArray *)gameGrid {
    self = [TTTGame init];
    if(self) {
        self.gameGrid = gameGrid;
    }
    return self;
}

@end
