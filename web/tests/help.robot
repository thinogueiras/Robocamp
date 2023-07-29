*** Settings ***
Documentation              Suite de testes de notificações de dúvidas

Resource                   ../resources/base.resource

*** Test Cases ***
Deve receber notificação
    ${admin}               Get Fixture        admin
    ${joao}                Get Fixture        joao

    Reset Student          ${joao}[student][email]
    
    ${token}               Get Service Token      ${admin}
    ${student_id}          POST New Student       ${token}     ${joao}[student]

    POST Question          ${student_id}          ${joao}[question]

    Do Login               ${admin}

    Open Notification
    Notification Should Be        ${joao}[question]