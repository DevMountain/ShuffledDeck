//
//  Card.h
//  
//
//  Created by Caleb Hicks on 7/7/15.
//
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *suit;
@property (strong, nonatomic) NSString *code;
@property (strong, nonatomic) NSString *value;
@property (strong, nonatomic) NSURL *imageURL;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryRepresentation;

@end
