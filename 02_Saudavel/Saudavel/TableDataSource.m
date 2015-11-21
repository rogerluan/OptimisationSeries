//
//  TableDataSource.m
//  Saudavel
//
//  Created by Roger Luan on 11/21/15.
//  Copyright © 2015 Roger Oba. All rights reserved.
//

#import "TableDataSource.h"
#import "CustomTableViewCell.h"

@implementation TableDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return (self.data == nil ? 0 : 1);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CustomTableViewCell class]) forIndexPath:indexPath];
    return cell;
}

@end