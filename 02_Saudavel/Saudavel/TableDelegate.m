//
//  TableDelegate.m
//  Saudavel
//
//  Created by Roger Luan on 11/21/15.
//  Copyright © 2015 Roger Oba. All rights reserved.
//

#import "TableDelegate.h"
#import "CustomTableViewCell.h"

@implementation TableDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    id data = self.data[indexPath.row];
    [((CustomTableViewCell *)cell) configureCellWithData:data];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _selectedData = self.data[indexPath.row];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

@end
