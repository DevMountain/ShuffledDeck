//
//  Deck.h
//  
//
//  Created by Caleb Hicks on 7/7/15.
//
//

#import <Foundation/Foundation.h>

@interface Deck : NSObject

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSArray *cards;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryRepresentation;

@end
