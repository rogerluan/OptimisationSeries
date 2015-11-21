//
//  DataManager.m
//  Saudavel
//
//  Created by Roger Luan on 11/21/15.
//  Copyright © 2015 Roger Oba. All rights reserved.
//

#import "DataManager.h"

static NSString *kURL = @"https://api.twitch.tv/kraken/games/top?limit=100";

@implementation DataManager

- (void)getData:(DataManagerDidGetData)complete error:(DataManagerDidError)error {
    //chamada em background
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        //requisição dos dados do servidor
        NSError *err = nil;
        NSArray *json = nil;
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:kURL]];
        
        //verifica a resposta do servidor
        if (data == nil) {
            err = [NSError errorWithDomain:NSStringFromClass([self class]) code:0
                                  userInfo:@{NSLocalizedDescriptionKey: @"Nenhum dado retornou do servidor"}];
        }
        else { //se for válida, tenta deserializá-la em um json
            json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err][@"top"];
        }
        
        //manipula o resultado na main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            //verifica se algo deu errado na requisição, ou na manipulação para transformar a resposta do servidor em um json
            if (err) {
                error(err); //Algo deu errado
            } else {
                complete(json); //Sucesso!
            }
        });
    });
}

@end