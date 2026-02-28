*** Settings ***
Documentation     Testes do endpoint GET /breeds
Library           RequestsLibrary
Library           Collections
Library           ../libraries/BreedsLibrary.py
Resource          ../resources/keywords.robot
Resource          ../resources/variables.robot

Suite Setup       Create API Session

*** Test Cases ***

Caminho Feliz - Retornar lista de raças
    Given que envio GET para "/breeds"
    Then o status code deve ser 200
    And o campo "data" deve existir
    And validar contrato das raças

Caminho Infeliz - Limit inválido
    When envio GET para "/breeds?limit=abc"
    Then o status code deve ser 400

Caminho Infeliz - Limit negativo
    When envio GET para "/breeds?limit=-1"
    Then o status code deve ser 400