//
//  TableDelegate.h
//  Saudavel
//
//  Created by Roger Luan on 11/21/15.
//  Copyright © 2015 Roger Oba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TableDelegate : UIControl <UITableViewDelegate>

@property (nonatomic, strong) NSArray *data;
@property (readonly) id selectedData;

@end
