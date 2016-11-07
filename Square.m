//
//  Square.m
//  Snakes and Ladders
//
//  Created by Ali Dahesh on 2016-11-06.
//  Copyright © 2016 Ali Dahesh. All rights reserved.
//


#import "Square.h"
#import "Player.h"

@implementation Square

+(NSMutableArray *)initializeBoard:(NSString *)boardSize {
    
    NSMutableArray *board = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [boardSize integerValue]; i++) {
        NSMutableArray *row = [[NSMutableArray alloc] init];
        for (int j = 0; j < [boardSize integerValue]; j++) {
            Square *square = [[Square alloc] init];
            [row addObject:square];
            square.name = [NSString stringWithFormat:@"%i", (i * [boardSize integerValue] + j)];
        }
        [board addObject:row];
    }
    [Square initializePointers:boardSize withBoard:board];
    return board;
    
}

+(void)setLadders:(NSInteger *)ladders withBoard:(NSMutableArray *)board withRowSize:(NSString *)rowSize {
    
    int numLadders = (int)ladders;
    
    while (numLadders > 0) {
        
        Square *square = [[Square alloc] init];
        
        square = [[board objectAtIndex:[Square randomNumber:rowSize]] objectAtIndex:[Square randomNumber:rowSize]];
        
        if (square == [[board objectAtIndex:0] objectAtIndex:0]) {
            continue;
        }
        
        if (square == [board objectAtIndex:([rowSize integerValue] - 1)]) {
            continue;
        }
        
        if (square.hasLadder) {
            continue;
        }
        else {
            square.hasLadder = YES;
            //                NSLog(@"square %@ has a ladder!", square.name);
            numLadders--;
        }
        
    }
    
}

-(Square *)hitLadder:(Player *)player withRowSize:(NSString *)rowSize {
    
    int moves = (int)[rowSize integerValue];
    
    while (moves > 0) {
        
        player.currentSquare = player.currentSquare.next;
        moves--;
        
    }
    
    return player.currentSquare;
    
}

+(void)setSnakes:(NSInteger *)snakes withBoard:(NSMutableArray *)board withRowSize:(NSString *)rowSize {
    
    int numSnakes = (int)snakes;
    
    while (numSnakes > 0) {
        
        Square *square = [[Square alloc] init];
        
        square = [[board objectAtIndex:[Square randomNumber:rowSize]] objectAtIndex:[Square randomNumber:rowSize]];
        
        if (square == [[board objectAtIndex:0] objectAtIndex:0]) {
            continue;
        }
        
        if (square == [board objectAtIndex:0]) {
            continue;
        }
        
        if (square.hasLadder) {
            continue;
        }
        
        if (square.hasSnake) {
            continue;
        }
        
        else {
            square.hasSnake = YES;
            //            NSLog(@"square %@ has a snake!", square.name);
            numSnakes--;
        }
        
    }
    
}

-(Square *)hitSnake:(Player *)player withRowSize:(NSString *)rowSize {
    int moves = (int)[rowSize integerValue];
    
    while (moves > 0) {
        
        player.currentSquare = player.currentSquare.prev;
        moves--;
        
    }
    
    return player.currentSquare;
    
}

+(int)randomNumber:(NSString *)number {
    
    int rand = (int)(arc4random() % ([number integerValue] -1));
    
    return rand;
}

@end
