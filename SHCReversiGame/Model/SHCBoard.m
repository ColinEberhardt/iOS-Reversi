//
//  SHCBoard.m
//  SHCReversiGame
//
//  Created by Colin Eberhardt on 27/12/2012.
//  Copyright (c) 2012 Colin Eberhardt. All rights reserved.
//

#import "SHCBoard.h"

@implementation SHCBoard
{
    NSUInteger _board[8][8];
}

- (id)init
{
    if (self = [super init]){
        [self clearBoard];
    }
    return self;
}

- (BoardCellState)cellStateAtColumn:(NSInteger)column andRow:(NSInteger)row
{
    return _board[column][row];
}

- (void)setCellState:(BoardCellState)state forColumn:(NSInteger)column andRow:(NSInteger)row
{
    _board[column][row] = state;
}

- (void)clearBoard
{
    memset(_board, 0, sizeof(NSUInteger) * 8 * 8);
}
@end
