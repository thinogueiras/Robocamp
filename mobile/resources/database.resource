*** Settings ***
Documentation              Gerenciando a massa de testes através do BD

Library                    DatabaseLibrary

*** Keywords ***
Connect To PostgreSQL
    Connect To Database    psycopg2
    ...                    exirawbp
    ...                    exirawbp
    ...                    VItMFjEp9lo5mwcFcCgErrqgrLsg0jUV
    ...                    babar.db.elephantsql.com
    ...                    5432

Select Student Where Email
    [Arguments]            ${email}

    ${query}        Set Variable
    ...             SELECT * FROM public.students WHERE email = '${email}';

    ${result}       Query           ${query}

    [return]        ${result}[0]


Delete Enroll By Email

    [Arguments]            ${email}

    ${user}         Select Student Where Email      ${email}  

    ${query}        Set Variable
    ...             DELETE FROM public.enrollments WHERE student_id = '${user}[0]';

    Execute SQL String     ${query}

Delete Student By Email
    [Arguments]            ${email}

    ${query}        Set Variable
    ...             DELETE FROM public.students WHERE email = '${email}';

    Execute SQL String     ${query}

# Helpers
Reset Student
    [Arguments]            ${email}
    
    Connect To PostgreSQL
    Delete Student By Email       ${email}
    Disconnect From Database