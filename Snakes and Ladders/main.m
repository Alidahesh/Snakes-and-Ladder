//
//  main.m
//  Snakes and Ladders
//
//  Created by Ali Dahesh on 2016-11-06.
//  Copyright © 2016 Ali Dahesh. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Player.h"
#import "Square.h"


int main(int argc, const char * argv[]) {
    
        char diff [100];
        char size [100];
        Player *player1 = [[Player alloc] init];
        Player *player2 = [[Player alloc] init];
        
        while (YES) {
            
           
            Square *startingSquare = [[board objectAtIndex:0] objectAtIndex:0];
            player1.currentSquare = startingSquare;
            player2.currentSquare = startingSquare;
            
                
                while (YES) {
                    
                    Square *finalSquare = [[board objectAtIndex:[boardSize integerValue] -1] objectAtIndex:[boardSize integerValue] -1];
                    char move [100];
                    NSLog(@"Player 1: Please enter your move:");
                    scanf("%100s", move);
                    NSString *player1Move = [[NSString alloc] initWithUTF8String: move];
                    int moves = [player1Move integerValue];
                    
                    [player1 movePlayer:player1 withNumberOfTurns:moves andBoardSize:boardSize];
                    
                    if(player1.currentSquare.hasLadder) {
                        NSLog(@"You hit a ladder! Go up %i squares!", (int)[boardSize integerValue]);
                        player1.currentSquare = [player1.currentSquare hitLadder:player1 withRowSize:boardSize];
                        NSLog(@"You are now at square: %@", player1.currentSquare.name);
                    }
                    
                    if (player1.currentSquare.hasSnake) {
                        NSLog(@"You hit a snake! Go down %i squares!", (int)[boardSize integerValue]);
                        player1.currentSquare = [player1.currentSquare hitSnake:player1 withRowSize:boardSize];
                        NSLog(@"You are now at square: %@", player1.currentSquare.name);
                    }
                    
                    
                    if (player1.currentSquare == finalSquare) {
                        NSLog(@"Player 1 wins!");
                        NSLog(@"Game Over!");
                        break;
                    }
                    
                    
                    NSLog(@"Player 2: Please enter your move:");
                    
                    scanf("%100s", move);
                    NSString *player2Move = [[NSString alloc] initWithUTF8String: move];
                    moves = [player2Move integerValue];
                    
                    [player2 movePlayer:player2 withNumberOfTurns:moves andBoardSize:boardSize];
                    
                    if(player2.currentSquare.hasLadder) {
                        NSLog(@"You hit a ladder! Go up %i squares!", (int)[boardSize integerValue]);
                        player2.currentSquare = [player2.currentSquare hitLadder:player2 withRowSize:boardSize];
                        NSLog(@"You are now at square: %@", player2.currentSquare.name);
                    }
                    
                    if (player2.currentSquare.hasSnake) {
                        NSLog(@"You hit a snake! Go down %i squares!", (int)[boardSize integerValue]);
                        player2.currentSquare = [player2.currentSquare hitSnake:player2 withRowSize:boardSize];
                        NSLog(@"You are now at square: %@", player2.currentSquare.name);
                    }
                    
                    if (player2.currentSquare == finalSquare) {
                        NSLog(@"Player 2 wins!");
                        NSLog(@"Game Over!");
                        break;
                    }
            
        }
    }
    return 0;
    
    
    
}
