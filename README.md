# Projeto de Engenharia de Dados com Olist

## 📖 Sobre o Projeto

Projeto de engenharia de dados ponta a ponta para análise do ecossistema de e-commerce brasileiro utilizando o dataset da [Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce). O pipeline implementa a Arquitetura Medalhão (Bronze, Silver, Gold) para processar os dados brutos, modela um Data Warehouse em Star Schema e culmina em dashboards analíticos para visualização de KPIs de vendas.

Este projeto foi desenvolvido para a disciplina de Sistemas de Banco de Dados 2 (2025/2).

## 🛠️ Tecnologias Utilizadas

- **Linguagem:** Python
- **Bibliotecas:** PySpark, Pandas, Matplotlib e Seaborn
- **Banco de Dados:** PostgreSQL
- **Orquestração/Ambiente:** Docker
- **Visualização:** Power BI

### 📋 Pré-requisitos

Antes de começar, garanta que você tenha os seguintes softwares instalados:
-   [Git](https://git-scm.com/)
-   [Python](https://www.python.org/downloads/) (versão 3.9 ou superior)
-   [Docker](https://www.docker.com/products/docker-desktop/) e Docker Compose

### ⚙️ Passos para Execução

1.  **Clonar o Repositório:**
    ```sh
    git clone https://github.com/DiegoCarlito/Engenharia-dados-olist.git
    cd Engenharia-dados-olist
    ```

2.  **Configurar o Ambiente Virtual:**
    ```sh
    # Criar o ambiente virtual
    python -m venv venv

    # Ativar o ambiente
    # Windows
    .\venv\Scripts\activate
    # macOS / Linux
    source venv/bin/activate
    ```

3.  **Instalar as Dependências:**
    ```sh
    pip install -r requirements.txt
    ```

4.  **Configurar as Credenciais do Banco de Dados:**
    O projeto utiliza um arquivo `.env` para gerenciar as credenciais de forma segura.
    ```sh
    # Copie o arquivo de exemplo
    cp .env.example .env
    ```
    Agora, abra o arquivo `.env` e preencha as variáveis com seus valores (especialmente `DB_PASSWORD`).

5.  **Executar o ETL (Bronze -> Prata):**
    Este notebook lê os dados brutos da camada Bronze, aplica as transformações e salva o resultado em formato Parquet na camada Prata.
    ```sh
    # Execute o notebook 02 (ou rode-o via VS Code)
    # Esta etapa pode demorar alguns minutos
    ```
    Após a execução, a pasta `/data/silver/pedidos` será criada.

6.  **Iniciar o Banco de Dados com Docker:**
    ```sh
    docker-compose up -d
    ```

7.  **Popular o Banco de Dados:**
    Este script lê os arquivos Parquet da camada Prata e os insere na tabela `pedidos` do PostgreSQL.
    ```sh
    python notebooks/03_popula_banco_silver.py
    ```

## 📁 Estrutura do Repositório

- `/data`: Contém os dados nas camadas Bronze, Silver e Gold.
- `/notebooks`: Contém os Jupyter Notebooks para análise, ETL e outros scripts.
- `/sql`: Scripts SQL para DDL, DML e consultas.
- `/docs`: Documentação do projeto, dicionários de dados e modelos.