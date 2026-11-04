# Síntese das Descobertas e Comparação de Paradigmas

**Equipe:** Suri Savitri Procópio Alves, Letícia Carvalho Barbosa, Sofia Martins Van Drunen, Mateus de Lira Braga.
**Tema:** Tuplas como registros em um boletim escolar.

## 1. Investigação e Descobertas (Desafio Técnico)
Durante os testes no GHCi, investigámos o comportamento e as limitações das tuplas em Haskell para a representação de registros:
* **Descoberta 1:** As funções nativas `fst` e `snd` funcionam estritamente para pares (tuplas de 2 elementos). Ao tentar aplicá-las à nossa tupla de 4 elementos `(String, Double, Double, Double)`, o compilador gerou um erro de tipo, obrigando-nos a criar nossas próprias funções de extração através de *pattern matching* (ex: `nome (n, _, _, _) = n`).
* **Descoberta 2:** As tuplas têm tipagem forte baseada tanto nos tipos dos dados quanto na quantidade de elementos (aridade). Uma tupla de 3 elementos não pode ser processada por uma função que espera uma tupla de 4 elementos, garantindo segurança em tempo de compilação.

## 2. Análise Comparativa: Haskell (Tuplas) vs C (Struct)
O ficheiro `comparacao.c` implementa o mesmo boletim utilizando `structs` e programação imperativa.
* **Acesso aos dados:** Em C, acedemos aos dados através de identificadores nomeados (`aluno.nota1`). Em Haskell, a tupla é anónima e acedemos aos dados pela posição, utilizando o *pattern matching* para desestruturar a tupla na assinatura da função.
* **Mutabilidade:** No C, os valores das notas podem ser reatribuídos a qualquer momento (`aluno.nota1 = 10.0`). Em Haskell, a tupla é estritamente imutável; para atualizar uma nota, teríamos que retornar uma nova tupla.
* **Iteração:** Enquanto em C iteramos sobre o array de alunos utilizando um ciclo `for` com uma variável de controlo `i`, em Haskell aplicamos recursão ou funções de ordem superior (`map`) para gerar o boletim de todos os alunos.

## 3. Dificuldades Encontradas
* **Dificuldade 1:** Adaptar a lógica mental imperativa de "atualizar a nota do aluno" para a mentalidade funcional, onde os dados originais não mudam.
* **Dificuldade 2:** Lidar com a extração de dados em tuplas maiores através de *pattern matching* e definir a melhor lógica para a função de extensão `[A EQUIPE DEVE DESCREVER AQUI A DIFICULDADE DA FUNÇÃO DE EXTENSÃO]`.

## 4. Quadro de Contribuições

| Integrante | Contribuições Específicas |
| :--- | :--- |
| **Suri Savitri** | Desenvolveu as funções `nome` e `media`. Estruturou o ficheiro principal. |
| **Letícia Carvalho** | Implementou a função `situacao` com guardas e ajudou na lógica recursiva do `boletim`. |
| **Sofia Martins** | Desenvolveu a função `melhorAluno` e elaborou o código de comparação em C. |
| **Mateus de Lira** | Criou a função de extensão original, efetuou os testes no GHCi e reviu a documentação Markdown. |

*(Nota: Ajustem o quadro acima conforme a divisão real de trabalho da equipa)*

## 5. Referências
* HASKELL.ORG. *Documentation*. Disponível em: https://www.haskell.org/documentation/
* LIPOVAČA, M. *Learn You a Haskell for Great Good!* 2011.
