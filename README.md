# Cenários de Teste Funcional – ERP

Este repositório contém cenários de teste funcional escritos em Gherkin, contemplando validações de frontend e backend.

---

## 📌 Visão Geral do Projeto

O objetivo deste projeto é demonstrar a modelagem de testes funcionais utilizando BDD, cobrindo cenários positivos, negativos, validação de contrato de API e análise de comportamento da aplicação.

---

## 🏗 Estrutura do Projeto

- **Testes de Frontend** – Tela de Filtro de Usuários  
- **Testes de Backend** – Endpoint GET `/breeds` (Cat Facts API)

---

## 🖥 Cobertura de Testes – Frontend

Foram considerados os seguintes cenários na tela de filtros:

- Filtro por Tipo de Pessoa  
- Filtro por Nome  
- Filtro por E-mail  
- Validação de e-mail inválido  
- Cenário sem resultados  

---

## 🔎 Cobertura de Testes – Backend

Para o endpoint GET `/breeds`, foram realizadas as seguintes validações:

- Validação de status code  
- Validação de parâmetros de query  
- Validação da estrutura da resposta  
- Validação de contrato (schema)  
- Tratamento de erros  

---

## 🧠 Estratégia de Teste

A abordagem adotada contempla:

- Cenários positivos (Happy Path)  
- Cenários negativos (Unhappy Path)  
- Validação de casos de borda  
- Validação de contrato da API  
- Verificação de campos obrigatórios e tipos de dados  

---

# 📚 Exercício 3 – Resolução de Problemas

## a) Como eu reportaria esse bug?

Caso eu identificasse um bug em produção impactando clientes, trataria imediatamente como um incidente crítico.

O reporte incluiria:

- Descrição clara do problema  
- Comportamento esperado  
- Impacto no cliente  
- Ambiente afetado (Produção)  
- Horário da ocorrência  
- Passos para reprodução (se possível)  
- Evidências como logs, payload da requisição, response da API e correlation ID  

Utilizaria os logs para identificar:

- Stack trace  
- Mensagens de erro internas  
- Falhas de integração  
- Problemas de timeout  
- Padrão de ocorrência  

Essas informações ajudam na identificação rápida da causa raiz e reduzem o tempo de resolução.

---

## b) Como mitigar e evitar problemas futuros?

Se o problema poderia ter sido identificado durante os testes da feature, eu revisaria a cobertura de testes e incluiria:

- Cenários negativos adicionais  
- Validações de casos de borda  
- Reforço na validação de contrato (schema)  
- Inclusão do cenário na suíte de regressão obrigatória  

Além disso, reforçaria o monitoramento em produção com:

- Alertas para erros 5xx  
- Monitoramento de taxa de erro  
- Monitoramento de tempo de resposta  
- Dashboards de acompanhamento da saúde da API  

Também avaliaria o impacto no cliente (quantidade de usuários afetados, indisponibilidade e possíveis prejuízos) para garantir a priorização adequada da correção.

Essa abordagem reduz o risco de recorrência e aumenta a confiabilidade da aplicação.