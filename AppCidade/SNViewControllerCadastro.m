//
//  SNViewController.m
//  AppCidade
//
//  Created by Gabriel on 1/27/14.
//  Copyright (c) 2014 SemNorte. All rights reserved.
//

#import "SNViewControllerCadastro.h"

@interface SNViewControllerCadastro ()

@end

@implementation SNViewControllerCadastro

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark - UIViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}


-(void)viewDidAppear:(BOOL)animated
{
    //Verificar se o usuário ja esta logado, se sim, passar da parte de registro
    PFUser *usuario = [PFUser currentUser];
    if (usuario.username != nil)
        [self performSegueWithIdentifier:@"Login" sender:self];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//REGISTRA O USUARIO--------

- (IBAction)registraUsuario:(id)sender
{
    //Remove o teclado
    [_nomeUsuarioTextField resignFirstResponder];
    [_emailUsuarioTextField resignFirstResponder];
    [_senhaUsuarioTextField resignFirstResponder];
    [_confirmaSenhaUsuarioTextField resignFirstResponder];
    
    //Chama metodo para checar campos
    [self checarSeCamposEstaoCompletos];
}

-(void)checarSeCamposEstaoCompletos
{
    if ([_nomeUsuarioTextField.text isEqualToString:@""] || [_emailUsuarioTextField.text isEqualToString:@""] || [_senhaUsuarioTextField.text isEqualToString:@""] || [_confirmaSenhaUsuarioTextField.text isEqualToString:@""])
    {
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Opaaa!" message:@"Você precisa preencher todos os campos! :) " delegate:nil cancelButtonTitle:@"Blz" otherButtonTitles:nil, nil];
        
        [alerta show];
    }
    else
        //chama metodo para ver se senhas sao iguais
        [self checarSeSenhasSaoIguais];
}

-(void)checarSeSenhasSaoIguais
{
    if (![_senhaUsuarioTextField.text isEqualToString:_confirmaSenhaUsuarioTextField.text])
    {
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Opaaa!" message:@"As senhas precisam ser iguais! :) " delegate:nil cancelButtonTitle:@"Blz" otherButtonTitles:nil, nil];
        
        [alerta show];
    }
    else
        //Chama metodo de registro do novo usuario
        [self RegistraNovoUsuarioParse];
}

-(void)RegistraNovoUsuarioParse
{
    NSLog(@"Addedando novo usuario");
    
    PFUser *novoUsuario = [PFUser user];
    novoUsuario.username = _nomeUsuarioTextField.text;
    novoUsuario.email = _emailUsuarioTextField.text;
    novoUsuario.password = _senhaUsuarioTextField.text;
        
    [novoUsuario signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
    {
        if(!error)
        {
            NSLog(@"Registrado com Sucesso");
            [self performSegueWithIdentifier:@"Login" sender:self];
        }
        else
        {
            NSLog(@"Houve um erro ao registrar %@", error);
        }
    }];
}


//USUARIO JA É REGISTRADO E FAZ O LOGIN ----------

- (IBAction)jaSouRegistrado:(id)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        
        _viewNovaLogin.frame = self.view.frame;
    }];
}

- (IBAction)botaoLogin:(id)sender
{
    [PFUser logInWithUsernameInBackground:_nomeUsuarioLoginTextField.text password:_senhaUsuarioLoginTextField.text block:^(PFUser *user, NSError *error)
     {
         if (!error)
         {
             NSLog(@"Fazendo o Login!");
             _nomeUsuarioLoginTextField.text = nil;
             _nomeUsuarioTextField.text = nil;
             _senhaUsuarioLoginTextField.text = nil;
             _senhaUsuarioTextField.text = nil;
             _senhaUsuarioLoginTextField.text = nil;
             _senhaUsuarioTextField.text = nil;
             _confirmaSenhaUsuarioTextField.text = nil;
             _emailUsuarioTextField.text = nil;
             [self performSegueWithIdentifier:@"Login" sender:self];
         }
         else
         {
             UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Opaaaa" message:@"Problema para logar o usuario" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
             
             [alerta show];             
         }
     }];
}

@end
