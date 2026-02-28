*** Settings ***
Documentation     Suíte de testes para o endpoint /breeds da Cat Facts API.
Resource          ../resources/keywords.resource
Resource          ../resources/variables.resource

Suite Setup       Create API Session


*** Test Cases ***
Happy Path - Retrieve cat breeds list
    [Documentation]    Verifica se a lista de raças é retornada com sucesso e contrato íntegro.
    [Tags]    smoke
    When A GET Request Is Sent To "/breeds"
    Then The Response Status Code Should Be 200
    And The Response Body Should Contain A "data" Array
    And Validate Breed Structure

Unhappy Path - Invalid limit parameter
    [Documentation]    Valida o comportamento da API ao receber um texto no parâmetro de limite.
    When A GET Request Is Sent To "/breeds?limit=abc"
    Then The Response Status Code Should Be 200

Unhappy Path - Negative limit parameter
    [Documentation]    Valida o comportamento da API ao receber um limite negativo.
    When A GET Request Is Sent To "/breeds?limit=-1"
    Then The Response Status Code Should Be 404
