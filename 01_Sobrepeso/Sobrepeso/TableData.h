//
//  TableData.h
//  Sobrepeso
//
//  Created by Roger Luan on 11/18/15.
//  Copyright © 2015 Roger Oba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableData : NSObject

-(nonnull instancetype)initWithJSON:(nonnull NSDictionary *)json;

@property (nullable, nonatomic, retain) NSString *posterURL;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSNumber *views;
@property (nullable, nonatomic, retain) NSNumber *channels;
@property (nullable, nonatomic, retain) NSNumber *position;

@end
