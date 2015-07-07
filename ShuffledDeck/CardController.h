//
//  CardController.h
//  
//
//  Created by Caleb Hicks on 7/7/15.
//
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardController : NSObject

+ (void)requestNewDeckWithCompletion:(void (^)(Deck *deck))completion;

+ (void)requestCards:(NSInteger)numberOfCards fromDeck:(Deck *)deck withCompletion:(void (^)(NSArray *cards))completion;

+ (void)shuffleDeck:(Deck *)deck withCompletion:(void(^)(BOOL success))completion;

@end
