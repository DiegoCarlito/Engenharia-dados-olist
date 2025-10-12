# Projeto de Engenharia de Dados com Olist

## Sobre o Projeto

Projeto de engenharia de dados ponta a ponta para análise do ecossistema de e-commerce brasileiro utilizando o dataset da [Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce). O pipeline implementa a Arquitetura Medalhão (Bronze, Silver, Gold) para processar os dados brutos, modela um Data Warehouse em Star Schema e culmina em dashboards analíticos para visualização de KPIs de vendas.

Este projeto foi desenvolvido para a disciplina de Sistemas de Banco de Dados 2 (2025/2).

## Tecnologias Utilizadas

- **Linguagem:** Python
- **Bibliotecas:** PySpark, Pandas, Matplotlib e Seaborn
- **Banco de Dados:** PostgreSQL
- **Orquestração/Ambiente:** Docker
- **Visualização:** Power BI

## Estrutura do Repositório

- `/data`: Contém os dados nas camadas Bronze, Silver e Gold.
- `/notebooks`: Contém os Jupyter Notebooks para análise, ETL e outros scripts.
- `/sql`: Scripts SQL para DDL, DML e consultas.
- `/docs`: Documentação do projeto, dicionários de dados e modelos.