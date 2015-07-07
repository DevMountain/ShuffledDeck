//
//  CardTableViewDatasource.m
//  
//
//  Created by Caleb Hicks on 7/7/15.
//
//

#import "CardTableViewDatasource.h"
#import "CardController.h"

static NSString * const kCardCellID = @"cardCell";

@interface CardTableViewDatasource () <UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) NSArray *cards;

@end

@implementation CardTableViewDatasource

- (void)configureTableView:(UITableView *)tableView {
    
    self.tableView = tableView;
    
    [CardController requestNewDeckWithCompletion:^(Deck *deck) {
        
        self.deck = deck;
        
        [CardController shuffleDeck:deck withCompletion:^(BOOL success) {
            [CardController requestCards:52 fromDeck:deck withCompletion:^(NSArray *cards) {
                self.cards = cards;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [self.tableView reloadData];

                });
            }];
        }];
    }];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Card *card = self.cards[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCardCellID];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", card.suit, card.value];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", card.imageURL];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cards.count;
}

@end
