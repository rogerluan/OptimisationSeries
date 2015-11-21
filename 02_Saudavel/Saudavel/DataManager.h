//
//  DataManager.h
//  Saudavel
//
//  Created by Roger Luan on 11/21/15.
//  Copyright © 2015 Roger Oba. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DataManagerDidGetData)(NSArray *json);
typedef void(^DataManagerDidError)(NSError *error);

@interface DataManager : NSObject

- (void)getData:(DataManagerDidGetData)complete error:(DataManagerDidError)error;

@end
