//
//  TableViewController.m
//  Sobrepeso
//
//  Created by Roger Luan on 11/18/15.
//  Copyright © 2015 Roger Oba. All rights reserved.
//

#import "TableViewController.h"
#import "CustomTableViewCell.h"
#import "TableData.h"

static NSString *kURL = @"https://api.twitch.tv/kraken/games/top?limit=100";

@interface TableViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *data;

@end

@implementation TableViewController

#pragma mark - Lifecycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Exemplo de Sobrepeso", nil);
    
//    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"CustomTableViewCell"];
    
    [self.refreshControl addTarget:self action:@selector(reloadData) forControlEvents:UIControlEventValueChanged];
    
    [self reloadData];
}

#pragma mark - Data - 

- (void)reloadData {
    [self.refreshControl beginRefreshing];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSError *err = nil;
        NSArray *json = nil;
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:kURL]];
        if (data == nil) {
            err = [NSError errorWithDomain:NSStringFromClass([self class]) code:0
                                  userInfo:@{NSLocalizedDescriptionKey: @"No data returned by server"}];
        }
        else {
            json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err][@"top"];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (err) {
                [self.refreshControl endRefreshing];
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Oops...", nil) message:[NSString stringWithFormat:NSLocalizedString(@"Ocorreu Um Erro\n\n%@",nil),err.localizedDescription] preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
                [alert addAction:cancelAction];
                [self presentViewController:alert animated:YES completion:nil];
                
            }
            else {
                NSMutableArray *items = [NSMutableArray array];
                
                for (NSDictionary *jsonItem in json) {
                    TableData *item = [[TableData alloc] initWithJSON:jsonItem];
                    item.position = [NSNumber numberWithInteger:[json indexOfObject:jsonItem]+1];
                    [items addObject:item];
                }
                
                [self.refreshControl endRefreshing];
                self.data = items;
                [self.tableView reloadData];
            }
        });
    });
}

#pragma mark - UITableViewDataSource -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return (self.data ? 1 : 0);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CustomTableViewCell class]) forIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate -

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableData *data = self.data[indexPath.row];
    [(CustomTableViewCell*)cell configureCellWithData:data];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TableData *data = self.data[indexPath.row];
    
     UIAlertController *alert = [UIAlertController alertControllerWithTitle:data.title message:
                                 [NSString stringWithFormat:NSLocalizedString(@"Jogo na posição %d, com %d canais e %d visualizações.", nil),[data.position integerValue],[data.channels integerValue],[data.views integerValue]] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
