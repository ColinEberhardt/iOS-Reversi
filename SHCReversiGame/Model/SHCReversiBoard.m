//
//  SHCReversiBoard.m
//  SHCReversiGame
//
//  Created by Colin Eberhardt on 28/12/2012.
//  Copyright (c) 2012 Colin Eberhardt. All rights reserved.
//

#import "SHCReversiBoard.h"

@implementation SHCReversiBoard


- (void)setToInitialState
{
    // clear the board
    [super clearBoard];
    
    // add initial play counters
    [super setCellState:BoardCellStateWhitePiece forColumn:3 andRow:3];
    [super setCellState:BoardCellStateBlackPiece forColumn:4 andRow:3];
    [super setCellState:BoardCellStateBlackPiece forColumn:3 andRow:4];
    [super setCellState:BoardCellStateWhitePiece forColumn:4 andRow:4];
    
    _whiteScore = 2;
    _blackScore = 2;
    
    _nextMove = BoardCellStateBlackPiece;
}

-(BOOL)isValidMoveToColumn:(NSInteger)column andRow:(NSInteger)row
{
    // check the cell is empty
    if ([super cellStateAtColumn:column andRow:row] != BoardCellStateEmpty)
        return NO;
    
    return YES;
}

- (void)makeMoveToColumn:(NSInteger)column andRow:(NSInteger)row
{
    // place the playing piece at the given location
    [self setCellState:self.nextMove forColumn:column  andRow:row];
    
    _nextMove = [self invertState:_nextMove];
}

- (BoardCellState) invertState: (BoardCellState)state
{
    if (state == BoardCellStateBlackPiece)
        return BoardCellStateWhitePiece;
    
    if (state == BoardCellStateWhitePiece)
        return BoardCellStateBlackPiece;
    
    return BoardCellStateEmpty;
}

@end
