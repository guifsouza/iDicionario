//
//  Alfabeto.m
//  Navigation
//
//  Created by Guilherme Ferreira de Souza on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Alfabeto.h"
#import "Letra.h"

@implementation Alfabeto {
    NSMutableArray *Letras;
    int indice;
}

static Alfabeto *SINGLETON = nil;
static bool isFirstAccess = YES;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.letraAtual = @"a";
        indice = -1;
        [self populaAlfabeto];
    }
    return self;
}

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];
    });
    
    return SINGLETON;
}

- (NSArray *)retornaAlfabeto {
    
    if ([Letras count] > 0)
        return Letras;
    else
        return nil;
}

- (void)populaAlfabeto {
    
    Letras = [NSMutableArray new];
    
    Letra *letraA = [[Letra alloc] initWithPalavra:@"Abelha" UrlImagem:@"abelha"];
    [Letras addObject:letraA];
    Letra *letraB = [[Letra alloc] initWithPalavra:@"Bola" UrlImagem:@"bola"];
    [Letras addObject:letraB];
    Letra *letraC = [[Letra alloc] initWithPalavra:@"Carro" UrlImagem:@"carro"];
    [Letras addObject:letraC];
    Letra *letraD = [[Letra alloc] initWithPalavra:@"Dado" UrlImagem:@"dado"];
    [Letras addObject:letraD];
    Letra *letraE = [[Letra alloc] initWithPalavra:@"Esquilo" UrlImagem:@"esquilo"];
    [Letras addObject:letraE];
    Letra *letraF = [[Letra alloc] initWithPalavra:@"Faca" UrlImagem:@"faca"];
    [Letras addObject:letraF];
    Letra *letraG = [[Letra alloc] initWithPalavra:@"Gato" UrlImagem:@"gato"];
    [Letras addObject:letraG];
    Letra *letraH = [[Letra alloc] initWithPalavra:@"Helicóptero" UrlImagem:@"helicoptero"];
    [Letras addObject:letraH];
    Letra *letraI = [[Letra alloc] initWithPalavra:@"Igreja" UrlImagem:@"igreja"];
    [Letras addObject:letraI];
    Letra *letraJ = [[Letra alloc] initWithPalavra:@"Janela" UrlImagem:@"janela"];
    [Letras addObject:letraJ];
    Letra *letraK = [[Letra alloc] initWithPalavra:@"Ketchup" UrlImagem:@"ketchup"];
    [Letras addObject:letraK];
    Letra *letraL = [[Letra alloc] initWithPalavra:@"Lâmpada" UrlImagem:@"lampada"];
    [Letras addObject:letraL];
    Letra *letraM = [[Letra alloc] initWithPalavra:@"Moeda" UrlImagem:@"moeda"];
    [Letras addObject:letraM];
    Letra *letraN = [[Letra alloc] initWithPalavra:@"Navio" UrlImagem:@"navio"];
    [Letras addObject:letraN];
    Letra *letraO = [[Letra alloc] initWithPalavra:@"Ovo" UrlImagem:@"ovo"];
    [Letras addObject:letraO];
    Letra *letraP = [[Letra alloc] initWithPalavra:@"Pato" UrlImagem:@"pato"];
    [Letras addObject:letraP];
    Letra *letraQ = [[Letra alloc] initWithPalavra:@"Queijo" UrlImagem:@"queijo"];
    [Letras addObject:letraQ];
    Letra *letraR = [[Letra alloc] initWithPalavra:@"Rã" UrlImagem:@"ra"];
    [Letras addObject:letraR];
    Letra *letraS = [[Letra alloc] initWithPalavra:@"Sabão" UrlImagem:@"sabao"];
    [Letras addObject:letraS];
    Letra *letraT = [[Letra alloc] initWithPalavra:@"Torta" UrlImagem:@"torta"];
    [Letras addObject:letraT];
    Letra *letraU = [[Letra alloc] initWithPalavra:@"Unicórnio" UrlImagem:@"unicornio"];
    [Letras addObject:letraU];
    Letra *letraV = [[Letra alloc] initWithPalavra:@"Violão" UrlImagem:@"violao"];
    [Letras addObject:letraV];
    Letra *letraW = [[Letra alloc] initWithPalavra:@"Whisky" UrlImagem:@"whisky"];
    [Letras addObject:letraW];
    Letra *letraX = [[Letra alloc] initWithPalavra:@"Xadrez" UrlImagem:@"xadrez"];
    [Letras addObject:letraX];
    Letra *letraY = [[Letra alloc] initWithPalavra:@"Yu-Gi-Oh" UrlImagem:@"yugioh"];
    [Letras addObject:letraY];
    Letra *letraZ = [[Letra alloc] initWithPalavra:@"Zebra" UrlImagem:@"zebra"];
    [Letras addObject:letraZ];
    
}

- (Letra *)proximaLetra {
    
    NSArray *arrayLetras = [[NSArray alloc] initWithObjects:@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", nil] ;
    
    if (indice == -1 || indice == 25)
        indice = 0;
    else {
        int indicedaletra = (int)[arrayLetras indexOfObject:self.letraAtual];
        indice = indicedaletra + 1;
    }
    self.letraAtual = [arrayLetras objectAtIndex:indice];
    Letra *proxLetra = [Letras objectAtIndex:indice];
    
    return proxLetra;
}

- (Letra *)letraAnterior {
    
    NSArray *arrayLetras = [[NSArray alloc] initWithObjects:@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", nil] ;
    
    if (indice == -1 || indice == 0)
        indice = 25;
    else {
        int indicedaletra = (int)[arrayLetras indexOfObject:self.letraAtual];
        indice = indicedaletra - 1;
    }
    self.letraAtual = [arrayLetras objectAtIndex:indice];
    Letra *letraAnterior = [Letras objectAtIndex:indice];
    
    return letraAnterior;

}

@end
