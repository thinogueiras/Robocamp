*** Settings ***
Documentation              Suíte de testes de matrícula de alunos

Resource                   ../resources/base.resource

*** Test Cases ***
Deve matricular aluno
    ${admin}               Get Fixture        admin
    ${falcao}              Get Fixture        falcao
    
    Reset Student          ${falcao}[student][email]

    ${token}               Get Service Token        ${admin}
    POST New Student       ${token}                 ${falcao}[student]

    Do Login               ${admin}

    Go To Enrolls
    Go To Enroll Form
    Select Student         ${falcao}[student][name]
    Select Plan            ${falcao}[enroll][plan]
    Fill Start Date
    Submit Enroll Form
    Verify Toaster         Matrícula cadastrada com sucesso