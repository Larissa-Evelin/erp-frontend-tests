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

## Como preparar o ambiente e rodar os testes

### 1. Instalação do Python
Certifique-se de ter o **Python 3.10+** instalado. No terminal, verifique com o comando: `python3 --version`.

* **Linux (Ubuntu/Debian):** ```bash
sudo apt update && sudo apt install python3 python3-pip python3-venv

Windows: Baixe em [python.org](https://www.python.org/downloads/).

Atenção: Durante a instalação, marque a opção "Add Python to PATH".

2. Configurando o Ambiente Virtual
Dentro da pasta raiz do projeto, execute:

python3 -m venv venv
source venv/bin/activate  # No Windows use: venv\Scripts\activate

3. Instalando o Robot Framework
Com o ambiente ativo (venv), instale as bibliotecas necessárias:

Bash
pip install robotframework robotframework-requests

4. Executando os Testes e Analisando Resultados

No Linux / macOS
Bash
chmod +x run_tests.sh
./run_tests.sh
No Windows (Prompt de Comando ou PowerShell)
Snippet de código
run_tests.bat
Nota: Se preferir rodar manualmente ou em outros terminais, utilize o comando padrão:
robot --outputdir reports/ robot-catfact-api/tests/breeds_tests.robot

Onde encontrar os resultados?
Após a execução, os relatórios estarão consolidados na pasta reports/:

log.html: Detalhamento técnico com o passo a passo de cada requisição e validação.

report.html: Visão executiva e estatística do sucesso da execução dos testes.

output.xml: Dados brutos da execução (utilizados para integração com ferramentas de CI/CD).

## Resolução de Problemas & Visão de Qualidade

### 1. (Exercício 3)
Se um bug afeta o cliente em produção, minha postura é de **resolutividade**:

* **Reporte e Logs (A):** Eu abriria um report técnico detalhado com o passo a passo para reprodução e os *payloads* envolvidos. Usaria o **Correlation ID** nos logs do servidor (como CloudWatch ou ELK) para entregar o diagnóstico exato ao desenvolvedor, economizando tempo precioso de depuração.
* **Mitigação e Prevenção (B):** 1.  O bug identificado viraria, obrigatoriamente, um novo **teste de regressão** automatizado na nossa suíte.
    2.  Avaliaria a **priorização** junto ao PO (Product Owner), baseando a urgência no impacto real causado ao cliente.
    3.  Sugeriria a implementação de **dashboards e alertas** (via Grafana ou ferramenta similar) para monitorar erros 5xx, permitindo que o time aja de forma proativa antes mesmo do cliente reclamar.

### 2. Escalabilidade (Item 4c)
Para lidar com centenas de variações de dados de forma eficiente, utilizaria a técnica de **Test Templates (Data-Driven Testing)** no Robot Framework. Isso permite manter a estrutura do código limpa e o projeto escalável, reaproveitando a mesma lógica para diferentes massas de dados.

### 3. Análise de Resultados (Item 5a)
Analiso o sucesso da entrega através do binômio fornecido pelo framework:
* **Report.html:** Oferece a visão de negócio (o "termômetro" da saúde da entrega).
* **Log.html:** É onde realizo o diagnóstico técnico, utilizando a rastreabilidade de cada requisição para validar se o comportamento do sistema está de acordo com o esperado.