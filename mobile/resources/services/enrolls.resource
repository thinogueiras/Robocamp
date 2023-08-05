*** Settings ***
Documentation              Consumindo a rota enrollments da API REST

Library                    RequestsLibrary
Library                    DateTime

*** Keywords ***
POST New Enroll
    [Arguments]            ${token}        ${student_id}

    ${headers}             Create Dictionary        Authorization=${token}

    ${start_date}          Get Current Date

    ${enroll}              Create Dictionary
    ...                    start_date=${start_date}
    ...                    plan_id=3
    ...                    student_id=${student_id}

    ${response}            POST        http://localhost:3333/enrollments
    ...                    json=${enroll}
    ...                    headers=${headers}
    ...                    expected_status=201

    [return]               ${response.json()}[id] 

POST Question
    [Arguments]            ${student_id}        ${question}

    ${payload}             Create Dictionary    question=${question}

    POST                   http://localhost:3333/students/${student_id}/help-orders
    ...                    json=${payload}
    ...                    expected_status=201