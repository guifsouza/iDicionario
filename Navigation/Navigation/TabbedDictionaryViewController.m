//
//  TabbedDictionaryViewController.m
//  Navigation
//
//  Created by Guilherme Ferreira de Souza on 3/18/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "TabbedDictionaryViewController.h"
#import "Alfabeto.h"
#import "Letra.h"

@interface TabbedDictionaryViewController ()

@end

@implementation TabbedDictionaryViewController {
    NSArray *abecedario;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Alfabeto *alfabeto = [Alfabeto sharedInstance];

    abecedario = [alfabeto retornaAlfabeto];
    
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 49, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *tableCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"celula"];
    
    Letra *letra = [abecedario objectAtIndex:indexPath.row];
    
    [tableCell.imageView setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:letra.caminhoImagem ofType:@"png"]]];
    [tableCell.textLabel setText:[letra.palavra substringToIndex:1]];
    [tableCell.detailTextLabel setText:letra.palavra];
    
    return tableCell;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 26;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end
