//
//  Alfabeto.h
//  Navigation
//
//  Created by Guilherme Ferreira de Souza on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Letra.h"

@interface Alfabeto : NSObject

@property NSString *letraAtual;

- (void)populaAlfabeto;
- (Letra *)proximaLetra;
- (Letra *)letraAnterior;
+ (Alfabeto *)sharedInstance;


@end
