//
//  SNViewController.h
//  AppCidade
//
//  Created by Gabriel on 1/27/14.
//  Copyright (c) 2014 SemNorte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SNViewControllerCadastro : UIViewController

//Registrar o usuario
@property (weak, nonatomic) IBOutlet UITextField *nomeUsuarioTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailUsuarioTextField;
@property (weak, nonatomic) IBOutlet UITextField *senhaUsuarioTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmaSenhaUsuarioTextField;

//Nova view para o Login
@property (weak, nonatomic) IBOutlet UIView *viewNovaLogin;

//Nome usuario no Login
@property (weak, nonatomic) IBOutlet UITextField *nomeUsuarioLoginTextField;
@property (weak, nonatomic) IBOutlet UITextField *senhaUsuarioLoginTextField;

//Ação de registrar o usuario
- (IBAction)registraUsuario:(id)sender;
//Usuario ja é registrado - enviar para tela login
- (IBAction)jaSouRegistrado:(id)sender;
//Botao para Usuario fazer login
- (IBAction)botaoLogin:(id)sender;

-(IBAction)textFieldReturn:(id)sender;



@end
