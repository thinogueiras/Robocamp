*** Settings ***
Documentation           Arquivo que representa a tela de Login

Library                 AppiumLibrary

*** Variables ***
${API_URL}              http://192.168.15.54:3333
${api_field}            xpath=//android.widget.EditText[@text="Informe o endereço ip da api"]
${student_id_field}     xpath=//android.widget.EditText[@text="Informe seu código de acesso"]

*** Keywords ***
Login With Student Id
    [Arguments]         ${student_id}

    Wait Until Element Is Visible            ${api_field}            timeout=20
    Input Text          ${api_field}         ${API_URL}

    Wait Until Element Is Visible            ${student_id_field}     timeout=20
    Input Text          ${student_id_field}  ${student_id}

    Click Text          Entrar        exact_match=true