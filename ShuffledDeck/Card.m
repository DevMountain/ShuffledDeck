//
//  Card.m
//  
//
//  Created by Caleb Hicks on 7/7/15.
//
//

#import "Card.h"

static NSString * const kSuitKey = @"suit";
static NSString * const kValueKey = @"value";
static NSString * const kImageURLKey = @"image";

@implementation Card

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        
        self.suit = dictionary[kSuitKey];
        self.value = dictionary[kValueKey];
        self.imageURL = dictionary[kImageURLKey];
        
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    
    return @{
             kSuitKey : self.suit,
             kValueKey : self.value,
             kImageURLKey : self.imageURL,
             };
}

@end
