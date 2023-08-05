*** Settings ***
Documentation           Suíte de testes de pedido de ajuda

Resource                ../resources/base.resource
Resource                ../resources/services/enrolls.resource

Test Setup              Start App
Test Teardown           Finish App

*** Test Cases ***
Deve solicitar ajuda
    ${thiago}          Get Fixture          thiago
    ${admin}           Get Fixture          admin

    Reset Student      ${thiago}[student][email]

    ${token}           Get Service token    ${admin}
    ${student_id}      POST New Student     ${token}    ${thiago}[student]

    POST New Enroll    ${token}    ${student_id}

    Login With Student Id          ${student_id}
    Confirm Pop-up    
    Go To Help Order
    Submit Help Order              ${thiago}[help]

    Wait Until Page Contains       Recebemos a sua dúvida. Agora é só aguardar até 24 horas para receber o nosso feedback.