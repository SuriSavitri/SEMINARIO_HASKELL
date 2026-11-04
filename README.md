# 📚 Boletim Escolar em Haskell

## Sobre o projeto

Este projeto foi desenvolvido como parte do seminário de Programação Funcional, com o tema **"Tuplas como registros em um boletim escolar"**.

O objetivo é demonstrar como utilizar tuplas na linguagem Haskell para armazenar e manipular informações de alunos, como nome, notas, média e situação escolar.

Por meio desse projeto, exploramos conceitos importantes da programação funcional, como funções puras, imutabilidade, tipos de dados e pattern matching.

## Objetivos

- Compreender como funcionam as tuplas em Haskell.
- Utilizar tuplas para representar registros de alunos.
- Desenvolver funções para consultar e calcular informações escolares.
- Aplicar conceitos da programação funcional.
- Praticar a execução e os testes de funções utilizando o GHCi.

## Funcionalidades

O projeto apresenta as seguintes funções:

1. **Criar aluno:** registra o nome e as três notas do aluno.
2. **Consultar nome:** retorna o nome armazenado na tupla.
3. **Calcular média:** calcula a média das três notas.
4. **Verificar situação:** informa se o aluno está aprovado ou reprovado, considerando média mínima 7.
5. **Atualizar nota:** cria um novo registro com a nota atualizada, sem modificar o registro original.

### Função de extensão

Além das cinco funções principais, o projeto apresenta uma função extra chamada `boletim`, que reúne o nome, a média e a situação do aluno em um único resultado.

##  Tecnologias utilizadas

- **Haskell:** linguagem utilizada no desenvolvimento.
- **GHCi:** ambiente interativo utilizado para executar e testar as funções.
- **Git e GitHub:** ferramentas utilizadas para versionamento e compartilhamento do projeto.

## Estrutura do projeto

```text
boletim-escolar/
│
├── Boletim.hs
└── README.md
```

## Como executar o projeto

**1.** Instale o compilador GHC e o GHCi.

**2.** Clone o repositório:

```bash
git clone URL_DO_REPOSITORIO
```

**3.** Entre na pasta do projeto:

```bash
cd boletim-escolar
```

**4.** Abra o GHCi com o arquivo:

```bash
ghci Boletim.hs
```

**5.** Execute os testes no terminal:

```haskell
nomeAluno aluno1
calcularMedia aluno1
situacao aluno1
atualizarNota 1 10 aluno1
putStrLn (boletim aluno1)
```

## Exemplos de testes

Considerando o aluno:

```haskell
aluno1 = ("Ana", 8.0, 7.5, 9.0)
```

Resultados esperados:

| Função | Resultado |
|---|---|
| `nomeAluno aluno1` | "Ana" |
| `calcularMedia aluno1` | 8.1666... |
| `situacao aluno1` | "Aprovado" |
| `atualizarNota 1 10 aluno1` | `Just ("Ana",10.0,7.5,9.0)` |

## Conceitos estudados

- **Tuplas:** agrupamento de informações de diferentes tipos.
- **Funções puras:** funções que produzem resultados sem modificar dados externos.
- **Imutabilidade:** os dados originais não são alterados.
- **Pattern Matching:** identificação e extração de valores de uma tupla.
- **Tipos de dados:** definição dos tipos utilizados nas funções.
- **Maybe:** representação de resultados que podem ou não existir.

## Integrantes da equipe

- Suri Savitri Procópio Alves
- Letícia Carvalho Barbosa
- Nome completo do integrante 3
- Nome completo do integrante 4

## Disciplina

Programação Funcional — Haskell

**Tema:** Tuplas como registros em um boletim escolar.

**Professor:** Ronierison de Souza Maciel

## Considerações finais

O desenvolvimento deste projeto possibilitou compreender, na prática, como as tuplas podem ser utilizadas para organizar informações e como os conceitos da programação funcional contribuem para a criação de códigos mais organizados, previsíveis e seguros.
