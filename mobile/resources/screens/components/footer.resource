*** Settings ***
Documentation           Componente que representa o rodapé

Library                 AppiumLibrary

*** Variables ***
${help_order_button}    xpath=//android.widget.TextView[@text="Pedir ajuda"]

*** Keywords ***
Go To Help Order
    Wait Until Element Is Visible   ${help_order_button}     timeout=20
    Click Element                   ${help_order_button}