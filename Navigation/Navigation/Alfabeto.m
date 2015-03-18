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

- (void)populaAlfabeto {
    
    Letras = [NSMutableArray new];
    
    Letra *letraA = [[Letra alloc] initWithPalavra:@"Abelha" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/abelha.png"];
    [Letras addObject:letraA];
    Letra *letraB = [[Letra alloc] initWithPalavra:@"Bola" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/images/bola.png"];
    [Letras addObject:letraB];
    Letra *letraC = [[Letra alloc] initWithPalavra:@"Carro" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/carro.png"];
    [Letras addObject:letraC];
    Letra *letraD = [[Letra alloc] initWithPalavra:@"Dado" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/dado.png"];
    [Letras addObject:letraD];
    Letra *letraE = [[Letra alloc] initWithPalavra:@"Esquilo" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/esquilo.gif"];
    [Letras addObject:letraE];
    Letra *letraF = [[Letra alloc] initWithPalavra:@"Faca" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/faca.png"];
    [Letras addObject:letraF];
    Letra *letraG = [[Letra alloc] initWithPalavra:@"Gato" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/gato.png"];
    [Letras addObject:letraG];
    Letra *letraH = [[Letra alloc] initWithPalavra:@"Helicóptero" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/helicoptero.png"];
    [Letras addObject:letraH];
    Letra *letraI = [[Letra alloc] initWithPalavra:@"Igreja" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/igreja.png"];
    [Letras addObject:letraI];
    Letra *letraJ = [[Letra alloc] initWithPalavra:@"Janela" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/janela.png"];
    [Letras addObject:letraJ];
    Letra *letraK = [[Letra alloc] initWithPalavra:@"Ketchup" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/ketchup.png"];
    [Letras addObject:letraK];
    Letra *letraL = [[Letra alloc] initWithPalavra:@"Lâmpada" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/lampada.png"];
    [Letras addObject:letraL];
    Letra *letraM = [[Letra alloc] initWithPalavra:@"Moeda" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/moeda.png"];
    [Letras addObject:letraM];
    Letra *letraN = [[Letra alloc] initWithPalavra:@"Navio" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/navio.png"];
    [Letras addObject:letraN];
    Letra *letraO = [[Letra alloc] initWithPalavra:@"Ovo" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/ovo.png"];
    [Letras addObject:letraO];
    Letra *letraP = [[Letra alloc] initWithPalavra:@"Pato" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/pato.png"];
    [Letras addObject:letraP];
    Letra *letraQ = [[Letra alloc] initWithPalavra:@"Queijo" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/queijo.png"];
    [Letras addObject:letraQ];
    Letra *letraR = [[Letra alloc] initWithPalavra:@"Rã" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/ra.png"];
    [Letras addObject:letraR];
    Letra *letraS = [[Letra alloc] initWithPalavra:@"Sabão" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/sabao.png"];
    [Letras addObject:letraS];
    Letra *letraT = [[Letra alloc] initWithPalavra:@"Torta" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/torta.png"];
    [Letras addObject:letraT];
    Letra *letraU = [[Letra alloc] initWithPalavra:@"Unicórnio" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/unicornio.png"];
    [Letras addObject:letraU];
    Letra *letraV = [[Letra alloc] initWithPalavra:@"Violão" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/violao.png"];
    [Letras addObject:letraV];
    Letra *letraW = [[Letra alloc] initWithPalavra:@"Whisky" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/whisky.png"];
    [Letras addObject:letraW];
    Letra *letraX = [[Letra alloc] initWithPalavra:@"Xadrez" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/xadrez.png"];
    [Letras addObject:letraX];
    Letra *letraY = [[Letra alloc] initWithPalavra:@"Yu-Gi-Oh" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/yugioh.png"];
    [Letras addObject:letraY];
    Letra *letraZ = [[Letra alloc] initWithPalavra:@"Zebra" UrlImagem:@"/Users/guilhermeferreiradesouza/Documents/Projetos/iDicionario/Navigation/images/zebra.png"];
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
