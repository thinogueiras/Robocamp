*** Settings ***
Documentation              Consumindo a rota services da API REST

Library                    RequestsLibrary

*** Keywords ***
Get Service token
    [Arguments]            ${user}

    ${response}            POST
    ...                    http://localhost:3333/sessions
    ...                    json=${user}
    ...                    expected_status=200

    ${token}               Set Variable        Bearer ${response.json()}[token]

    [return]               ${token}