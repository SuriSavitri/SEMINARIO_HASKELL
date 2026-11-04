# 📚 Boletim Escolar em Haskell

## Sobre o projeto

Este projeto foi desenvolvido como parte do Seminário Técnico de Programação Funcional com Haskell, com o tema **"Tuplas como registros em um boletim escolar"**.

O objetivo é demonstrar como usar tuplas em Haskell para armazenar e manipular informações de alunos, como nome, notas, média e situação escolar. Cada aluno é uma tupla `(nome, nota1, nota2, nota3)`, do tipo `(String, Double, Double, Double)`.

## Objetivos

- Compreender como funcionam as tuplas em Haskell.
- Utilizar tuplas para representar registros de alunos.
- Desenvolver funções para consultar e calcular informações escolares.
- Aplicar conceitos da programação funcional.
- Praticar a execução e os testes de funções utilizando o GHCi.

## Funcionalidades

O projeto apresenta as cinco funções obrigatórias do tema:

1. **`nome`:** retorna o nome do aluno.
2. **`media`:** calcula a média aritmética das três notas.
3. **`situacao`:** informa "aprovado" (média ≥ 7), "final" (média ≥ 3) ou "reprovado".
4. **`boletim`:** para cada aluno da lista, devolve (nome, média, situação). É recursiva.
5. **`melhorAluno`:** devolve o nome e a média do aluno com maior média. É recursiva.

## Tecnologias utilizadas

- **Haskell:** linguagem utilizada no desenvolvimento.
- **GHC e GHCi:** compilador e ambiente interativo para executar e testar.
- **C:** usado apenas no trecho de comparação com `struct`.
- **Git e GitHub:** versionamento e compartilhamento do projeto.

## Estrutura do projeto

```text
pif-tema07-equipe-[nome]/
│
├── Exemplo1.hs      exemplo conceitual
├── Aplicacao.hs     funções obrigatórias, extensão e main
├── comparacao.c     versão em C com struct
├── SINTESE.md       síntese das descobertas e referências
└── README.md
```

## Como executar o projeto

**1.** Instale o GHC e o GHCi (recomendado: [GHCup](https://www.haskell.org/ghcup/)).

**2.** Clone o repositório:

```bash
git clone URL_DO_REPOSITORIO
```

**3.** Entre na pasta do projeto:

```bash
cd pif-tema07-equipe-[nome]
```

**4.** Abra o GHCi com o arquivo:

```bash
ghci Aplicacao.hs
```

**5.** Execute os testes no terminal:

```haskell
nome ("Ana", 8, 9, 7)
media ("Ana", 8, 9, 7)
situacao 5.0
boletim [("Ana",8,9,7),("Bruno",5,6,4)]
melhorAluno [("Ana",8,9,7),("Bruno",5,6,4)]
```

Para compilar e rodar o programa completo:

```bash
ghc -Wall Aplicacao.hs -o programa
./programa
```

## Exemplos de testes

| Chamada | Resultado esperado |
|---|---|
| `nome ("Ana", 8, 9, 7)` | `"Ana"` |
| `media ("Ana", 8, 9, 7)` | `8.0` |
| `situacao 5.0` | `"final"` |
| `boletim [("Ana",8,9,7),("Bruno",5,6,4)]` | `[("Ana",8.0,"aprovado"),("Bruno",5.0,"final")]` |
| `melhorAluno [("Ana",8,9,7),("Bruno",5,6,4)]` | `("Ana",8.0)` |

Também testamos casos limite: [média exatamente 7.0, média exatamente 3.0, empate, lista vazia].

## Conceitos estudados

- **Tuplas:** agrupamento de valores de tipos diferentes, com tamanho fixo.
- **Pattern matching:** extração dos campos da tupla direto na equação.
- **Funções puras e imutabilidade:** os dados originais nunca são alterados.
- **Guardas:** classificação da situação por faixas de média.
- **Recursão sobre listas:** `boletim` e `melhorAluno`.
- **Limites da tupla:** `fst` e `snd` só servem para pares, e os campos não têm nome como no `struct`.

## Comparação com C
O arquivo comparacao.c apresenta uma estrutura struct Aluno, com campos nomeados. Em Haskell, usamos uma tupla com os campos identificados pela posição. A comparação e as conclusões estão em SINTESE.md.

## Integrantes da equipe
- Suri Savitri Procópio Alves
- Letícia Carvalho Barbosa

## Disciplina

Programação Imperativa e Funcional | CESAR School | 2026.2

**Tema:** Tuplas como registros em um boletim escolar.

**Professor:** Ronierison de Souza Maciel

## Referências e ferramentas de apoio

- HASKELL.ORG. *Documentation*. https://www.haskell.org/documentation/
- LIPOVAČA, M. *Learn You a Haskell for Great Good!* 2011.
- [Ferramentas de apoio usadas, inclusive IA, e para quê]

## Considerações finais

O desenvolvimento deste projeto possibilitou compreender, na prática, como as tuplas organizam informações em um registro e quais são seus limites em comparação com o `struct` do C.
