//
//  Letra.h
//  Navigation
//
//  Created by Guilherme Ferreira de Souza on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Letra : NSObject

@property NSString *palavra;
@property NSString *caminhoImagem;

- (instancetype)initWithPalavra:(NSString *)palavra UrlImagem:(NSString *)urlImagem;

@end
