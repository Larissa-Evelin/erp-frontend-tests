*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Keywords ***

Create API Session
    Create Session    catapi    ${BASE_URL}

Que envio GET para "${endpoint}"
    ${response}=    GET On Session    catapi    ${endpoint}
    Set Suite Variable    ${response}

Envio GET para "${endpoint}"
    ${response}=    GET On Session    catapi    ${endpoint}
    Set Suite Variable    ${response}

O status code deve ser ${status}
    Should Be Equal As Integers    ${response.status_code}    ${status}

O campo "${campo}" deve existir
    Dictionary Should Contain Key    ${response.json()}    ${campo}

Validar contrato das raças
    ${data}=    Set Variable    ${response.json()["data"]}
    Validate Breed Contract    ${data}