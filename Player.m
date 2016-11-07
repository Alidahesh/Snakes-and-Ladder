//
//  Player.m
//  Snakes and Ladders
//
//  Created by Ali Dahesh on 2016-11-06.
//  Copyright © 2016 Ali Dahesh. All rights reserved.
//

#import "Player.h"
#import "Square.h"

@implementation Player

-(Square *)movePlayer:(Player *)player withNumberOfTurns:(int)moves andBoardSize:(NSString *)boardSize {
    
    while (moves > 0) {
        
        player.currentSquare = player.currentSquare.next;
        
        moves--;
        
    }
    
    NSLog(@"You are now at square: %@", player.currentSquare.name);
    return player.currentSquare;
}


@end
