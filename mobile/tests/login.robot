*** Settings ***
Documentation           Suíte de testes de Login

Resource                ../resources/base.resource

Test Setup              Start App
Test Teardown           Finish App

*** Test Cases ***
Deve logar com sucesso
    ${falcao}           Get Fixture         falcao

    Login With Student Id    ${falcao}[student][id]

    Wait Until Page Contains    Olá, ${falcao}[student][name]!