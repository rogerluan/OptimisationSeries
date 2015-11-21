//
//  TableDataSource.h
//  Saudavel
//
//  Created by Roger Luan on 11/21/15.
//  Copyright © 2015 Roger Oba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TableDataSource : NSObject<UITableViewDataSource>

@property (nonatomic, strong) NSArray *data;

@end
