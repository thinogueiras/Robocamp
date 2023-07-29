*** Settings ***
Documentation           Arquivo principal

Library                 AppiumLibrary
Library                 JSONLibrary

Resource                screens/login.resource

*** Keywords ***
Start App
    Open Application    http://localhost:4723/wd/hub
    ...                 alias=SmartBit
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=Pixel 4
    ...                 app=${EXECDIR}/app/smartbit.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true
    ...                 noReset=true

    Wait Until Page Contains        Informe seu código de acesso

Finish App
    Capture Page Screenshot
    Remove Application        com.papitorocks.smartbitmobile

Get Fixture
    [Arguments]         ${fixture_file}

    ${fixture}          Load Json From File    
    ...                 ${EXECDIR}/resources/fixtures/${fixture_file}.json
    ...                 encoding=UTF-8

    [return]            ${fixture}