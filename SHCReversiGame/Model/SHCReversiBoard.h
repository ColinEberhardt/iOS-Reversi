//
//  SHCReversiBoard.h
//  SHCReversiGame
//
//  Created by Colin Eberhardt on 28/12/2012.
//  Copyright (c) 2012 Colin Eberhardt. All rights reserved.
//

#import "SHCBoard.h"

/** A playing board that board that enforces the rules of the game Reversi. */
@interface SHCReversiBoard : SHCBoard

// sets the board to the opening positions for Reversi
- (void) setToInitialState;

// the white player's score
@property (readonly) NSInteger whiteScore;

// the black payer's score
@property (readonly) NSInteger blackScore;

@end
