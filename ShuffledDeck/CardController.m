//
//  CardController.m
//  
//
//  Created by Caleb Hicks on 7/7/15.
//
//

#import "CardController.h"

static NSString * const kCardsKey = @"cards";
static NSString * const kSuccessKey = @"success";


@implementation CardController

+ (void)requestNewDeckWithCompletion:(void (^)(Deck *deck))completion {
    
    NSURL *newDeckURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://deckofcardsapi.com/api/deck/new/"]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *dataTask = [session dataTaskWithURL:newDeckURL completionHandler:^(NSData * __nullable data, NSURLResponse * __nullable response, NSError * __nullable error) {
        
        if (!error) {
            
            NSError *serializationError;
            
            NSDictionary *serializedJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&serializationError];
            
            Deck *deck = [[Deck alloc] initWithDictionary:serializedJSON];
            
            completion(deck);
        } else {
            completion(nil);
        }
    }];
    
    [dataTask resume];
}

+ (void)requestCards:(NSInteger)numberOfCards fromDeck:(Deck *)deck withCompletion:(void (^)(NSArray *cards))completion {
    
    NSURL *getCardsFromDeckURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://deckofcardsapi.com/api/deck/%@/draw/?count=%ld", deck.identifier, (long)numberOfCards]];
        
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *dataTask = [session dataTaskWithURL:getCardsFromDeckURL completionHandler:^(NSData * __nullable data, NSURLResponse * __nullable response, NSError * __nullable error) {
        
        if (!error) {
            
            NSError *serializationError;
            
            NSDictionary *serializedJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&serializationError];
            
            NSMutableArray *allCards = [NSMutableArray new];
            
            for (NSDictionary *cardDictionary in serializedJSON[kCardsKey]) {
                Card *card = [[Card alloc] initWithDictionary:cardDictionary];
                [allCards addObject:card];
            }
            
            completion(allCards);
        } else {
            completion(nil);
        }
    }];
    
    [dataTask resume];
    
}

+ (void)shuffleDeck:(Deck *)deck withCompletion:(void(^)(BOOL success))completion {
    
    NSURL *newDeckURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://deckofcardsapi.com/api/deck/%@/shuffle/", deck.identifier]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *dataTask = [session dataTaskWithURL:newDeckURL completionHandler:^(NSData * __nullable data, NSURLResponse * __nullable response, NSError * __nullable error) {
        
        if (!error) {
            
            NSError *serializationError;
            
            NSDictionary *serializedJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&serializationError];
            
            BOOL success = [serializedJSON[kSuccessKey] boolValue];
            
            completion(success);
        } else {
            completion(nil);
        }
    }];
    
    [dataTask resume];
    
}

@end
