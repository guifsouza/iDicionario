//
//  Letra.m
//  Navigation
//
//  Created by Guilherme Ferreira de Souza on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Letra.h"

@implementation Letra


-(instancetype)initWithPalavra:(NSString *)palavra UrlImagem:(NSString *)urlImagem {
    
    self = [super init];
    if (self) {
        
        self.palavra = palavra;
        self.caminhoImagem = urlImagem;
    }
    
    return self;
}

@end
