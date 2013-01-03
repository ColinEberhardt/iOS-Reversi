//
//  SHCComputerOpponent.m
//  SHCReversiGame
//
//  Created by Colin Eberhardt on 02/01/2013.
//  Copyright (c) 2013 Colin Eberhardt. All rights reserved.
//

#import "SHCComputerOpponent.h"

@implementation SHCComputerOpponent
{
    SHCReversiBoard* _board;
    BoardCellState _computerColor;
}

- (id)initWithBoard:(SHCReversiBoard *)board color:(BoardCellState)computerColor
{
    if (self = [super init])
    {
        _board = board;
        _computerColor = computerColor;
        
        // listen to game state changes in order to know when to make a move
        [_board.reversiBoardDelegate addDelegate:self];
    }
    return self;
}

- (void)gameStateChanged
{
    if (_board.nextMove == _computerColor)
    {
        // pause 1 second, then make a move
        [self performSelector:@selector(makeNextMove) withObject:nil afterDelay:1.0];
    }
}

// Determines which move to make
- (void)makeNextMove
{
    NSInteger bestScore = NSIntegerMin;
    NSInteger bestRow, bestColumn;;
    
    // check every possible move, then select the one with the best 'score'
    for (NSInteger row = 0; row < 8; row++)
    {
        for (NSInteger col = 0; col < 8; col++)
        {
            if ([_board isValidMoveToColumn:col andRow:row])
            {
                // clone the current board
                SHCReversiBoard* testBoard = [_board copyWithZone:nil];
                
                // make this move
                [testBoard makeMoveToColumn:col andRow:row];
                
                // compute the score - i.e. the difference in black and white score
                int score = _computerColor == BoardCellStateWhitePiece ?
                testBoard.whiteScore - testBoard.blackScore :
                testBoard.blackScore - testBoard.whiteScore;
                
                // record the best score
                if (score > bestScore)
                {
                    bestScore = score;
                    bestRow = row;
                    bestColumn = col;
                }
            }
        }
    }
    
    if (bestScore > NSIntegerMin)
    {
        [_board makeMoveToColumn:bestColumn andRow:bestRow];
    }
}

@end
