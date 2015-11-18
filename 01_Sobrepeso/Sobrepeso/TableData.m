//
//  TableData.m
//  Sobrepeso
//
//  Created by Roger Luan on 11/18/15.
//  Copyright © 2015 Roger Oba. All rights reserved.
//

#import "TableData.h"

@implementation TableData

-(nonnull instancetype)initWithJSON:(NSDictionary *)json {
	if (!(self = [super init])) { return nil; }
    
    self.title = [[json objectForKey:@"game"] objectForKey:@"name"];
    self.posterURL = [[[json objectForKey:@"game"] objectForKey:@"logo"] objectForKey:@"large"];
    self.views = [json objectForKey:@"viewers"];
    self.channels = [json objectForKey:@"channels"];
    
	return self;
}

@end
