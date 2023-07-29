*** Settings ***
Documentation          Representação do componente Toast

Library                Browser

*** Keywords ***
Verify Toaster
    [Arguments]     ${expected_message}

    Wait For Elements State    
    ...             css=.Toastify__toast-body div >> text=${expected_message}
    ...             visible    5