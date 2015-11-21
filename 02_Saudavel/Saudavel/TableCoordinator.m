//
//  TableCoordinator.m
//  Saudavel
//
//  Created by Roger Luan on 11/21/15.
//  Copyright © 2015 Roger Oba. All rights reserved.
//

#import "TableCoordinator.h"
#import "TableDataSource.h"
#import "TableDelegate.h"
#import "CustomTableViewCell.h"

@interface TableCoordinator ()

@property (nonatomic, strong) IBOutlet TableDataSource *dataSource;
@property (nonatomic, strong) IBOutlet TableDelegate *delegate;

@end

@implementation TableCoordinator

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //    [self registerCells];
}

- (void)reloadData:(NSArray *)data {
    self.dataSource.data = data;
    self.delegate.data = data;
    
    [self.tableView reloadData];
}

/**
 *
 *  Se você for utilizar nibs ao invés de storyboard, precisará registrar suas cells para reutilizá-las. Note que isso será necessário sempre, independente de estar utilizando essas classes especiais ou não. No início do projeto, isso estaria (mal)localizado na classe TableViewController, e sendo chamado dentro do viewDidload, caso contrário suas células não mostrarão conteúdo algum.
 */
//- (void) registerCells {
//    UINib *nib = [UINib nibWithNibName:@"nome_da_sua_nib" bundle:nil];
//    [self.tableView registerNib:nib forCellReuseIdentifier:@"identifier_da_sua_cell"];
//}

@end