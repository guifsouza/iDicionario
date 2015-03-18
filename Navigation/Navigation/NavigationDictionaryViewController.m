//
//  LetraViewController.m
//  Navigation
//
//  Created by Guilherme Ferreira de Souza on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "NavigationDictionaryViewController.h"
#import "Alfabeto.h"

@interface NavigationDictionaryViewController ()

@end

@implementation NavigationDictionaryViewController {
    
    Alfabeto *alfabeto;
    bool executando;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    alfabeto = [Alfabeto sharedInstance];

}

- (void) recarregaInterface {
    
   [[self.view subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    [self.navigationController.tabBarItem setTitle:@"Navegação"];
    self.navigationItem.title = [self.letraAtual.palavra substringToIndex:1];
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    UIBarButtonItem *previous = [[UIBarButtonItem alloc]
                                 initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(previous:)];
    self.navigationItem.leftBarButtonItem = previous;
    
//    UILabel *letraLabel = [UILabel init];
//    [letraLabel setText:[self.letraAtual.palavra substringToIndex:1]];
//    
    UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao
     setTitle:self.letraAtual.palavra
     forState:UIControlStateNormal];
    [botao sizeToFit];

    [self.view addSubview:botao];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(35, -500, 250, 250)];
    
    NSString *imgUrl = [[NSBundle mainBundle] pathForResource:self.letraAtual.caminhoImagem ofType:@"png"];
    [imageView setImage:[UIImage imageWithContentsOfFile:imgUrl]];
    [self.view addSubview:imageView];
    
    [UIView animateWithDuration:0.6
                          delay:0
                        options:UIViewAnimationOptionOverrideInheritedCurve
                     animations:^(void) {
                         imageView.frame = CGRectMake(35, 150, 250, 250);
                     }
                     completion:nil];
    
    [botao setCenter:CGPointMake(imageView.center.x, imageView.center.y + 150)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    executando = NO;
    
    [self recarregaInterface];
}


-(void)next:(id)sender {
    
    if (executando) return;
    executando = YES;
    
    int selfIndex = [self.navigationController.viewControllers indexOfObject:self];
    
    NavigationDictionaryViewController *view = nil;
    NSMutableArray *viewsArray = [self.navigationController.viewControllers mutableCopy];
    
    if (selfIndex == 2) {
        view = [viewsArray objectAtIndex:0];
        [viewsArray removeObjectAtIndex:0];
        [self.navigationController setViewControllers:viewsArray];
        
    } else if (selfIndex <= 1) {
        view = [[NavigationDictionaryViewController alloc] initWithNibName:nil bundle:nil];
    }

    [view setLetraAtual:[alfabeto proximaLetra]];
    [self.navigationController pushViewController:view animated:NO];

    
    NSLog([NSString stringWithFormat:@"%lu", (unsigned long)self.navigationController.viewControllers.count]);
    
}

- (void)previous:(id)sender {
    
    if (executando) return;
    executando = YES;
    
    int selfIndex = [self.navigationController.viewControllers indexOfObject:self];
    
    NavigationDictionaryViewController *view = nil;
    NSMutableArray *viewsArray = [self.navigationController.viewControllers mutableCopy];
    
    if (selfIndex == 2) {
        view = [viewsArray objectAtIndex:0];
        [viewsArray removeObjectAtIndex:0];
        [self.navigationController setViewControllers:viewsArray];
        
    } else if (selfIndex <= 1) {
        view = [[NavigationDictionaryViewController alloc] initWithNibName:nil bundle:nil];
    }
    
    [view setLetraAtual:[alfabeto letraAnterior]];
    [self.navigationController pushViewController:view animated:NO];
    
    NSLog([NSString stringWithFormat:@"%lu", (unsigned long)self.navigationController.viewControllers.count]);

    
}



@end
