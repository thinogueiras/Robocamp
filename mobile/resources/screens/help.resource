*** Settings ***
Documentation           Arquivo que representa a tela de pedido de ajuda

Library                 AppiumLibrary

*** Variables ***
${help_button}          xpath=//android.widget.TextView[@text="Enviar dúvida"]
${help_text}            xpath=//android.widget.EditText[@text="Escreva sua dúvida aqui"]
${help_btn_enviar}      xpath=//android.widget.TextView[@text="Enviar"]

*** Keywords ***
Submit Help Order
    [Arguments]         ${text}

    Wait Until Element Is Visible    ${help_button}    timeout=20
    Click Element                    ${help_button}   
    
    Wait Until Element Is Visible    ${help_text}      timeout=20
    Input Text                       ${help_text}      ${text} 
    Click Element                    ${help_btn_enviar}