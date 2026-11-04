#include <stdio.h>
#include <string.h>

// Representação de um aluno em C usando struct
// Essa estrutura é a correspondência direta imperativa da tupla 
// (String, Double, Double, Double) usada no Haskell.
typedef struct {
    char nome[50];
    double nota1;
    double nota2;
    double nota3;
} Aluno;

// Função equivalente à função 'media' desenvolvida em Haskell
double calcularMedia(Aluno a) {
    return (a.nota1 + a.nota2 + a.nota3) / 3.0;
}

// Função equivalente à função 'situacao' desenvolvida em Haskell
void imprimirSituacao(double media) {
    if (media >= 7.0) {
        printf("Situação: aprovado\n");
    } else if (media >= 3.0) {
        printf("Situação: final\n");
    } else {
        printf("Situação: reprovado\n");
    }
}

int main() {
    // Inicializando registros de alunos (análogo a uma lista de tuplas)
    Aluno turma[2] = {
        {"Ana", 8.0, 9.0, 7.0},
        {"Bruno", 5.0, 6.0, 4.0}
    };

    printf("=== BOLETIM ESCOLAR (Versão em C) ===\n\n");
    for (int i = 0; i < 2; i++) {
        // Em C, os campos são acessados pelo nome identificador (ex: .nome, .nota1).
        // Na nossa versão em Haskell, extraímos os dados pela posição na tupla 
        // utilizando pattern matching.
        printf("Nome: %s\n", turma[i].nome);
        
        double media = calcularMedia(turma[i]);
        printf("Média: %.1f\n", media);
        
        imprimirSituacao(media);
        printf("----------------------------------\n");
    }

    return 0;
}
