# Projeto de Automação de Testes – Cat Fact API & Modelagem ERP

Este repositório foi criado para apresentar minha solução para os desafios técnicos de QA. Aqui, foquei em unir a teoria da modelagem de testes (BDD) com a prática de automação usando Robot Framework e Python.

---

## Estrutura do Projeto

Para garantir um projeto limpo e fácil de manter, separei as responsabilidades assim:

* **`features/`**: Aqui utilizei a sintaxe Gherkin para descrever o comportamento esperado em duas frentes:
    * **Frontend (ERP Matera):** Foquei na modelagem teórica da tela de Consulta de Usuários, mapeando cenários de filtros (Nome, E-mail, Tipo de Pessoa) e fluxos de exceção para garantir uma interface resiliente.
    * **Backend (API Cat Facts):** Documentação que serviu de base para a automação real do endpoint `/breeds`. O foco aqui foi a **Validação de Contrato**, garantindo a integridade do JSON e o tratamento de parâmetros inválidos.
* **`robot-catfact-api/tests/`**: Aqui estão os scripts de automação que o Robot Framework executa.
* **`libraries/`**: Criei a `BreedsLibrary.py` em Python para validar se o contrato da API está certinho (campos obrigatórios e tipos de dados).
* **`resources/`**: Onde guardo minhas Keywords personalizadas e variáveis globais.
* **`reports/`**: Pasta destinada aos logs e relatórios gerados após os testes.

---

## Qualidade de Código & CI/CD

### Análise Estática com Robocop
Para garantir que o código siga as melhores práticas do Robot Framework, utilizei o **Robocop**. Ele analisa o código em busca de melhorias de sintaxe e padrões de projeto.

### Pipeline de CI (GitHub Actions)
Configurei uma pipeline de **Integração Contínua** que automatiza a qualidade do projeto. Toda vez que um novo código é enviado para o repositório (`git push`), o GitHub Actions executa os seguintes passos:

1.  **Prepara o ambiente Python:** Configura a versão correta do interpretador.
2.  **Instala dependências:** Garante que todas as bibliotecas (Robot Framework, Requests, Robocop) estejam presentes.
3.  **Executa a análise estática:** Roda o Robocop para validar a qualidade do código.
4.  **Controle de Build:** Garante que o build só seja aprovado se o código estiver de acordo com os padrões de severidade definidos.

---

## Como preparar o ambiente e rodar os testes

Para garantir que tudo funcione corretamente, siga estes passos para configurar seu ambiente:

* **1. Instalação do Python**: Certifique-se de ter o **Python 3.10+** instalado. Verifique no terminal com `python3 --version`.
    * **Linux (Ubuntu/Debian)**:
      ```bash
      sudo apt update && sudo apt install python3 python3-pip python3-venv
      ```
    * **Windows**: Baixe em [python.org](https://www.python.org/downloads/). *Atenção: Marque a opção "Add Python to PATH" na instalação.*

* **2. Configurando o Ambiente Virtual**: Dentro da pasta raiz do projeto, execute os comandos para isolar as dependências:
    ```bash
    python3 -m venv venv
    source venv/bin/activate  # No Windows use: venv\Scripts\activate
    ```

* **3. Instalando o Robot Framework**: Com o ambiente ativo (venv), instale as bibliotecas necessárias para a automação:
    ```bash
    pip install robotframework robotframework-requests robotframework-robocop
    ```

* **4. Executando os Testes**: Utilize o script de automação ou o comando direto do Robot:
    * **Linux / macOS**: `chmod +x run_tests.sh && ./run_tests.sh`
    * **Windows**: `run_tests.bat`
    * **Manual**: `robot --outputdir reports/ robot-catfact-api/tests/breeds_tests.robot`

* **5. Onde encontrar os resultados?**: Após a execução, os relatórios estarão consolidados na pasta `reports/`:
    * **`log.html`**: Detalhamento técnico com o passo a passo de cada validação.
    * **`report.html`**: Visão executiva com as estatísticas de sucesso dos testes.

---

## Resolução de Problemas & Visão de Qualidade

Abaixo, detalho minha abordagem técnica e estratégica para garantir a confiabilidade do software:

* **1. Resposta a Incidentes (Exercício 3)**: Se um bug afeta o cliente em produção, minha postura é de **resolutividade**:
    * **Reporte e Logs (a)**: Eu abriria um report técnico detalhado com o passo a passo para reprodução e os *payloads* envolvidos.
    * **Mitigação e Prevenção (b)**: Para evitar que este erro ou falhas similares cheguem ao cliente, minha estratégia foca em:
        * **Automação e Regressão**: O bug identificado é transformado em um novo caso de teste automatizado. Isso garante que, em qualquer alteração futura na feature, o erro seja detectado imediatamente no pipeline de CI.
        * **Priorização e Impacto**: A correção é priorizada junto ao PO (Product Owner) analisando o volume de usuários afetados e a criticidade da função (ex: se impede o fluxo principal de venda/consulta, é prioridade máxima).
        * **Monitoramento e Observabilidade**: Implementação de **Dashboards (Grafana)** para acompanhar a taxa de erro e configuração de **Alertas (Slack/E-mail)**. Assim, o time de QA e Engenharia age de forma proativa antes mesmo do cliente abrir um chamado.

* **2. Escalabilidade (Item 4c)**: Para lidar com centenas de variações de dados de forma eficiente:
    * **Data-Driven Testing**: Utilizaria a técnica de **Test Templates** no Robot Framework. Isso permite manter a estrutura do código limpa e o projeto escalável, reaproveitando a mesma lógica para diferentes massas de dados.

* **3. Análise de Resultados (Item 5a)**: Analiso o sucesso da entrega através do conjunto de artefatos gerados pelo framework:
    * **`report.html`**: Fornece a visão consolidada da execução, apresentando as estatísticas de sucesso e falhas que validam a estabilidade da entrega.
    * **`log.html`**: Onde realizo o diagnóstico técnico e a rastreabilidade detalhada de cada keyword e requisição.
    * **`output.xml`**: Arquivo de dados brutos que possibilita a integração com ferramentas de CI/CD para geração de dashboards históricos e análise automatizada de falhas.