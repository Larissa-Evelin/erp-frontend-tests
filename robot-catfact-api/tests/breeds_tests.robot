*** Settings ***
Documentation     Testes do endpoint GET /breeds da Cat Facts API.
Resource          ../resources/keywords.robot
Resource          ../resources/variables.robot

Suite Setup       Create API Session

*** Test Cases ***
Caminho Feliz - Retornar lista de raças
    [Tags]    smoke
    Given que envio GET para "/breeds"
    Then o status code deve ser 200
    And o campo "data" deve existir
    And validar contrato das raças

Caminho Infeliz - Limit inválido
    [Documentation]    Verifica comportamento com texto no lugar de número.
    # Nota: A API catfact.ninja retorna 200 e ignora params inválidos.
    When que envio GET para "/breeds?limit=abc"
    Then o status code deve ser 200

Caminho Infeliz - Limit negativo
    [Documentation]    Verifica comportamento com limite negativo.
    # Nota: A API retorna 404 para este cenário específico.
    When que envio GET para "/breeds?limit=-1"
    Then o status code deve ser 404