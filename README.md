# Desafio para Big Data

**Recomendações:**

Não faça fork deste repositório

Envie o link do seu repositório, para que possamos avaliar seu código, práticas
utilizadas, testes, padrões utilizados, frameworks e bibliotecas.

Faça uso de práticas como: Linguagem Ubíqua, KISS, DRY e outras.

A qualidade do produto entregue e seus detalhes de apresentação contarão para
sua avaliação. Fique à vontade para adicionar mais funcionalidades ao que fora
proposto, mas não esqueça de garantir qualidade na sua solução como um todo.

## Proposta

Este desafio será dividido em duas etapas. São elas:

  1. Realização de relatório via consultas SQL
  2. Extração e carregamento de dados no formato Parquet via Python

## Etapa 1

Nesta etapa aprresentamos uma base de dados do histórico de corridas de Fórmula 1. A mesma encontra-se no arquivo `formula-1.tar.xz`, no formato
do banco relacional SQLite3.

![DER](/home/lserra/PycharmProjects/LabsEV/img/schema-formula-1.png)

> Modelagem do banco de dados referente à Fórmula 1

O objetivo é responder, através de queries na linguagem SQL, os relatórios abaixo:

  1. Pontuação média dos 20 melhores pilotos das últimas 10 temporadas
  2. Todas as corridas onde apenas 3 equipes pontuaram
  3. Melhor tempo de Pitstop e equipe que executou e piloto que estava no carro por temporada
  4. Melhor tempo de Pitstop por equipe por temporada
  5. Piloto que mais pontuou daqueles que nunca subiram no pódio 
      - O piloto não pode ter subido no pódio em sua carreira da Fórmula 1 para entrar nesse grupo
  6. Pontuação mediana por temporada dos 20 melhores pilotos das últimas 10 temporadas

## Etapa 2

A proposta é realizar um processo de extração e carregamento de dados, utilizando a linguagem de programação Python e suas bibliotecas disponíveis - listamos algumas delas abaixo.

A extração será feita sob a base de dados do histórico de corridas de Fórmula 1 e o carregamento deve gerar um arquivo no formato Parquet para cada tabela.

## Downloads

[Base de dados Formula 1 - SQLite3](https://raw.githubusercontent.com/estantevirtual/vagas/master/desafios/assets/formula-1.tar.xz)
    - clicar no link com o botão direito e em `Salvar link como...`

## Referências

- [Pandas](https://pandas.pydata.org/)
- [PySpark](https://spark.apache.org/docs/latest/quick-start.html)
- [Docker com Jupyter](https://hub.docker.com/r/jupyter/)
- [Docker com Jupyter/PySpark](https://hub.docker.com/r/jupyter/pyspark-notebook/)
- [Formula 1 Race Data](https://www.kaggle.com/cjgdev/formula-1-race-data-19502017)
