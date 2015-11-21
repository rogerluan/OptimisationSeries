//
//  TableViewController.m
//  Saudavel
//
//  Created by Roger Luan on 11/21/15.
//  Copyright © 2015 Roger Oba. All rights reserved.
//

#import "TableViewController.h"
#import "TableData.h"
#import "DataManager.h"
#import "TableCoordinator.h"
#import "TableDelegate.h"

@interface TableViewController ()

@property (nonatomic,strong) DataManager *dataManager;
@property (nonatomic,strong) IBOutlet TableCoordinator *tableViewCoordinator;

@end

@implementation TableViewController

#pragma mark - Lifecycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Exemplo Saudável", nil);
    
    self.dataManager = [DataManager new];
    [self.refreshControl addTarget:self action:@selector(reloadData) forControlEvents:UIControlEventValueChanged];
    
    [self reloadData];
}

#pragma mark - Data -

- (void)reloadData {
    [self.refreshControl beginRefreshing];
    
    [self.dataManager getData:^(NSArray *json) {
        //converte os objetos do servidor no nosso modelo de objetos
        NSMutableArray *items = [NSMutableArray array];
        
        for (NSDictionary *jsonItem in json) {
            TableData *item = [[TableData alloc] initWithJSON:jsonItem];
            item.position = [NSNumber numberWithInteger:[json indexOfObject:jsonItem]+1];
            [items addObject:item];
        }
        
        //salva os objetos e atualiza a table view
        [self.refreshControl endRefreshing];
        [self.tableViewCoordinator reloadData:items];
    } error:^(NSError *error) {
        [self.refreshControl endRefreshing];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Oops...", nil) message:[NSString stringWithFormat:NSLocalizedString(@"Ocorreu Um Erro\n\n%@",nil),error.localizedDescription] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];
    }];
}

#pragma mark - IBActions -

- (IBAction)itemPressed:(TableDelegate*)sender {
    TableData *data = sender.selectedData;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:data.title message:
                                [NSString stringWithFormat:NSLocalizedString(@"Jogo na posição %d, com %d canais e %d visualizações.", nil),[data.position integerValue],[data.channels integerValue],[data.views integerValue]] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
