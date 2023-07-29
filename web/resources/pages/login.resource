*** Settings ***
Documentation        Login Page Keywords

Library              Browser

*** Keywords ***
Go To Login Page
    New Browser      headless=${False}       browser=chromium
    New Page         http://localhost:3000
    Set Viewport Size    1280    768

Fill Credentials
    [Arguments]      ${e-mail}        ${password}

    Fill Text        css=input[placeholder="Seu e-mail"]        ${e-mail}
    Fill Text        css=input[placeholder="Sua Senha"]         ${password}

Submit Credentials
    Click            css=button >> text="Entrar no sistema"

Field Type Should Be Email
    Get Attribute   css=input[placeholder="Seu e-mail"]
    ...             type        equal        email

Alert Text Should Be
    [Arguments]     ${field}        ${expected_message}

    Wait For Elements State        css=span >> text=${expected_message}
    ...                            visible    5
    Get Text        xpath=//input[@type="${field}"]/..//span
    ...             equal        ${expected_message}