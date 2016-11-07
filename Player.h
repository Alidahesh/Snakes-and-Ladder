//
//  Player.h
//  Snakes and Ladders
//
//  Created by Ali Dahesh on 2016-11-06.
//  Copyright © 2016 Ali Dahesh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Square;
@interface Player : NSObject

@property (nonatomic, strong) Square *currentSquare;


-(Square *)movePlayer:(Player *)player withNumberOfTurns:(int)moves andBoardSize:(NSString *)boardSize;


@end
