*** Settings ***
Documentation          Representação da barra de navegação da área logada

Library                Browser

*** Keywords ***
User Should Be Logged In
    [Arguments]      ${user_name}

    ${logged_user}   Set Variable            css=aside strong

    Wait For Elements State    ${logged_user}    visible    15

    Get Text         ${logged_user}        equal        ${user_name}