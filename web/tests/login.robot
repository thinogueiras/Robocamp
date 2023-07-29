*** Settings ***
Documentation              Suíte de testes de autenticação

Resource                   ../resources/base.resource

Test Teardown              Finish Test

*** Test Cases ***
Login do Administrador
    Go To Login Page

    Fill Credentials       admin@smartbit.com        qacademy
    Submit Credentials

    User Should Be Logged In    Admin

E-mail não cadastrado
    Go To Login Page

    Fill Credentials       nao-cadastrado@smartbit.com        qacademy
    Submit Credentials    
    
    Verify Toaster         Suas credenciais são inválidas, por favor tente novamente!

Senha inválida
    Go To Login Page

    Fill Credentials       admin@smartbit.com        qacademy123
    Submit Credentials

    Verify Toaster         Suas credenciais são inválidas, por favor tente novamente!

E-mail no formato incorreto
    Go To Login Page
    Fill Credentials       @com.br        abc123
    Submit Credentials
    Field Type Should Be Email

Senha em branco
    Go To Login Page
    Fill Credentials       admin@smartbit.com        ${EMPTY}
    Submit Credentials
    Alert Text Should Be   password     A senha é obrigatória
E-mail em branco
    Go To Login Page
    Fill Credentials       ${EMPTY}        abc123
    Submit Credentials
    Alert Text Should Be   email        O e-mail é obrigatório

E-mail e senha obrigatórios
    Go To Login Page
    Submit Credentials
    Alert Text Should Be   email        O e-mail é obrigatório
    Alert Text Should Be   password     A senha é obrigatória