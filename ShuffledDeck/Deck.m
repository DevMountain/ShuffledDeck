//
//  Deck.m
//  
//
//  Created by Caleb Hicks on 7/7/15.
//
//

#import "Deck.h"

static NSString * const kIdentifierKey = @"deck_id";

@implementation Deck

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        
        self.identifier = dictionary[kIdentifierKey];
    }
    
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    
    return @{
             kIdentifierKey : self.identifier
             };
}

@end
