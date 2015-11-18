//
//  CustomTableViewCell.h
//  Sobrepeso
//
//  Created by Roger Luan on 11/18/15.
//  Copyright © 2015 Roger Oba. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableData;

@interface CustomTableViewCell : UITableViewCell

- (void)configureCellWithData:(TableData *)data;

@end
