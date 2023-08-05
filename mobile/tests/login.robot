*** Settings ***
Documentation           Suíte de testes de Login

Resource                ../resources/base.resource
Resource                ../resources/services/enrolls.resource

Test Setup              Start App
Test Teardown           Finish App

*** Variables ***
${error_401}            Acesso não autorizado! Entre em contato com a equipe de atendimento.

*** Test Cases ***
Deve logar com sucesso
    ${admin}           Get Fixture          admin
    ${falcao}          Get Fixture          falcao

    Reset Student      ${falcao}[student][email]

    ${token}           Get Service token    ${admin}
    ${student_id}      POST New Student     ${token}    ${falcao}[student]

    POST New Enroll    ${token}    ${student_id}

    Login With Student Id          ${student_id}

    Wait Until Page Contains       Olá, ${falcao}[student][name]!

Código de aluno incorreto
    Login With Student Id       999

    Wait Until Page Contains    ${error_401}

Código de aluno negativo
    Login With Student Id       -1

    Wait Until Page Contains    ${error_401}

Código de aluno alphanumérico
    Login With Student Id       abc123

    Wait Until Page Contains    ${error_401}