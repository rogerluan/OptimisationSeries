//
//  CustomTableViewCell.m
//  Saudavel
//
//  Created by Roger Luan on 11/21/15.
//  Copyright © 2015 Roger Oba. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "TableData.h"

@interface CustomTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *gameImageView;
@property (weak, nonatomic) IBOutlet UILabel *gameTitleLabel;

@end

@implementation CustomTableViewCell

- (void) configureCellWithData:(TableData *)data {
    self.gameImageView.image = nil;
    self.gameTitleLabel.text = [NSString stringWithFormat:NSLocalizedString(@"#%@ - %@", nil),data.position,data.title];
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:data.posterURL]];
    UIImage *image = [UIImage imageWithData:imageData];
    self.gameImageView.image = image;
    
    
    NSLog(@"title: %@",self.gameTitleLabel.text);
    
}

@end
