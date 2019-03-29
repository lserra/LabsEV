# Desafio para Big Data

Diferentemente de outros desafios já realizados, este desafio foi muito divertido!

Eu já fui um grande apaixonado pela Formula 1.
E reviver esta paixão, mas de uma outra perspectiva, foi uma experiência muito
legal!

Eu me senti como uma criança quando acaba de ganhar um brinquedo novo.
Cheio de ideias mirabolantes.

- Criar um painel ou dashboard para apresentar todos estes dados;
- Criar novos relatórios e novas análises;
- Criar alertas;
- Criar um modelo preditivo para a próxima temporada, etc.

Mas, sendo o tempo um recurso que não estava a meu favor, eu resolvi ser prático
e objetivo. E focar naquilo que estava sendo solicitado neste desafio.

Pois com certeza, só isso já seria bastante trabalho. Então, mãos a obra!

## Proposta

O desafio está dividido em duas etapas:

  1. Realização de relatório via consultas SQL
  2. Extração e carregamento de dados no formato Parquet via Python

## Etapa 1

Nesta etapa aprresentamos uma base de dados do histórico de corridas de Fórmula 1.
A mesma encontra-se no arquivo `formula-1.tar.xz`, no formato do banco relacional SQLite3.

![DER](https://github.com/lserra/LabsEV/blob/master/img/schema-formula-1.png?raw=true)

> Modelagem do banco de dados referente à Fórmula 1

O objetivo é responder, através de queries na linguagem SQL, os relatórios abaixo:

  1. Pontuação média dos 20 melhores pilotos das últimas 10 temporadas
  2. Todas as corridas onde apenas 3 equipes pontuaram
  3. Melhor tempo de Pitstop e equipe que executou e piloto que estava no carro por temporada
  4. Melhor tempo de Pitstop por equipe por temporada
  5. Piloto que mais pontuou daqueles que nunca subiram no pódio 
      - O piloto não pode ter subido no pódio em sua carreira da Fórmula 1 para entrar nesse grupo
  6. Pontuação mediana por temporada dos 20 melhores pilotos das últimas 10 temporadas

## Solução da Etapa 1

As queries podem ser encontradas no seguinte caminho do projeto:

```shell
$ cd ../LabsEV/sql
```

## Etapa 2

A proposta é realizar um processo de extração e carregamento de dados, utilizando
a linguagem de programação Python e suas bibliotecas disponíveis.

A extração será feita sob a base de dados do histórico de corridas de Fórmula 1 e
o carregamento deve gerar um arquivo no formato Parquet para cada tabela.

## Solução da Etapa 2

Na solução deste exercício, foi usada a biblioteca Pandas.

Para gerar os arquivos no formato "parquet.gzip", é preciso executar o seguinte comando:

```shell
$ python sqlite_to_parquet.py
```

Os arquivos parquet podem ser encontrados, no seguinte caminho do projeto:

```shell
$ cd ../LabsEV/data/parquet
```

## Pre-requisitos

- Python 3.6+->
- SQLite3->
->
Este projeto possui dependências com algumas-> bibliotecas.
->
Para saber quais as bibliotecas que são usad->as, basta abrir o arquivo:
"**_requirements.txt_**".->
->
Neste arquivo é possível encontrar a lista d->as bibliotecas usadas neste projeto e a sua versão.
->
Antes de executar este projeto, é recomendad->o a instalação destas bibliotecas.

Para instalar estas bibliotecas, basta usar o seguinte comando:

```shell
$ pip install -r requirements.txt
```

## Estrutura de pastas do projeto

```
|__ ..LabsEV/data/        => database sqlite
|__ ..LabsEV/data/parquet => arquivos parquet.gzip
|__ ..LabsEV/img          => diagrama de entidade e relacionamento
|__ ..LabsEV/logs         => arquivos de log
|__ ..LabsEV/sql          => queries do exercício 1 (relatórios)
```
