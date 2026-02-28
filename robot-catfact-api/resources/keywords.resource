*** Settings ***
Documentation    Palavras-chave reutilizáveis para os testes da API Cat Fact.
Library          Collections
Library          RequestsLibrary
Library          ../libraries/BreedsLibrary.py


*** Keywords ***
Create API Session
    [Documentation]    Cria a sessão base para as chamadas da API.
    Create Session    catapi    ${BASE_URL}    disable_warnings=1

A GET Request Is Sent To "${endpoint}"
    [Documentation]    Envia uma requisição GET e armazena a resposta em nível de suíte.
    ${response}=    GET On Session    catapi    ${endpoint}    expected_status=any
    VAR    ${RESPONSE}    ${response}    scope=SUITE

The Response Status Code Should Be ${status}
    [Documentation]    Valida se o status code recebido é o esperado.
    Should Be Equal As Integers    ${RESPONSE.status_code}    ${status}

The Response Body Should Contain A "${field}" Array
    [Documentation]    Verifica se um campo específico existe no JSON de resposta.
    VAR    ${json}    ${RESPONSE.json()}
    Dictionary Should Contain Key    ${json}    ${field}

Validate Breed Structure
    [Documentation]    Chama a biblioteca Python para validar o contrato dos dados.
    VAR    ${json}    ${RESPONSE.json()}
    Validate Breed Contract    ${json["data"]}
