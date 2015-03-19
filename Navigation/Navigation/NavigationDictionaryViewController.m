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
    
    //controles de interface
    UIBarButtonItem *next;
    UIBarButtonItem *previous;
    UIImageView *imageView;
    UILabel *label;
    UIToolbar *toolBar;
    UITextField *txtField;
    UIBarButtonItem *toolBarTextField;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    alfabeto = [Alfabeto sharedInstance];
    
}

- (void) recarregaInterface {
    
   [[self.view subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    [self.navigationController.tabBarItem setTitle:@"Navegação"];
    self.navigationItem.title = [self.letraAtual.palavra substringToIndex:1];
    
    next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    previous = [[UIBarButtonItem alloc]
                                 initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(previous:)];
    self.navigationItem.leftBarButtonItem = previous;
    
    label = [UILabel new];
    [label setText:self.letraAtual.palavra];
    [label sizeToFit];
    label.preferredMaxLayoutWidth = 80;
    [self.view addSubview:label];
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(35, -500, 250, 250)];
    
    NSString *imgUrl = [[NSBundle mainBundle] pathForResource:self.letraAtual.caminhoImagem ofType:@"png"];
    [imageView setImage:[UIImage imageWithContentsOfFile:imgUrl]];
    [imageView setUserInteractionEnabled:YES];
    [self.view addSubview:imageView];
    
    [UIView animateWithDuration:0.6
                          delay:0
                        options:UIViewAnimationOptionOverrideInheritedCurve
                     animations:^(void) {
                         imageView.frame = CGRectMake(35, 150, 250, 250);
                     }
                     completion:nil];
    
    [label setCenter:CGPointMake(imageView.center.x, imageView.center.y + 150)];
    
    
    toolBar = [[UIToolbar alloc] init];
    toolBar.frame = CGRectMake(0, 64, self.view.frame.size.width, 44);

    txtField = [[UITextField alloc] initWithFrame: CGRectMake(0, 65, self.view.frame.size.width, 42)];
    txtField.placeholder = @"Alterar a palavra...";
    
    toolBarTextField = [[UIBarButtonItem alloc] initWithCustomView:txtField];
    [toolBar setItems:[NSArray arrayWithObject:toolBarTextField]];
    
    [self.view addSubview:toolBar];
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
    
    int selfIndex = (int)[self.navigationController.viewControllers indexOfObject:self];
    
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

    
}

- (void)previous:(id)sender {
    
    if (executando) return;
    executando = YES;
    
    int selfIndex = (int)[self.navigationController.viewControllers indexOfObject:self];
    
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
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (![txtField.text isEqualToString:@""]) {

        [label setText:txtField.text];
        [txtField setText:@""];
        [label sizeToFit];
        [label setCenter:CGPointMake(imageView.center.x, imageView.center.y + 150)];
    }
    
    [txtField resignFirstResponder];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *toque = [touches anyObject];
    
    if (toque.view == imageView) {
        CGPoint location = [toque locationInView:self.view];
    
        imageView.center = location;
    }
}



@end
