//
//  Square.h
//  Snakes and Ladders
//
//  Created by Ali Dahesh on 2016-11-06.
//  Copyright © 2016 Ali Dahesh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Player;
@interface Square : NSObject

@property (nonatomic, assign) BOOL hasSnake;
@property (nonatomic, assign) BOOL hasLadder;
@property (nonatomic, strong) Square *next;
@property (nonatomic, strong) Square *prev;
@property (nonatomic, strong) NSString *name;


+(NSMutableArray *)initializeBoard:(NSString *)boardSize;
+(void)initializePointers:(NSString *)boardSize withBoard:(NSMutableArray *)board;
+(void)setLadders:(NSInteger *)ladders withBoard:(NSMutableArray *)board withRowSize:(NSString *)rowSize;
-(Square *)hitLadder:(Player *)player withRowSize:(NSString *)rowSize;
+(void)setSnakes:(NSInteger *)snakes withBoard:(NSMutableArray *)board withRowSize:(NSString *)rowSize;
-(Square *)hitSnake:(Player *)player withRowSize:(NSString *)rowSize;
+(int)randomNumber:(NSString *)number;
@end
