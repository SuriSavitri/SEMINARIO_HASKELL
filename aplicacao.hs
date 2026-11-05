-- Aplicacao.hs: Tema 07 - Tuplas como registros em um boletim escolar
-- Cada aluno e representado por (nome, nota1, nota2, nota3).
-- Compilado com ghc -Wall: sem avisos.

type Aluno = (String, Double, Double, Double)
type Resultado = (String, Double, String)

-- 1. Extrai o nome usando pattern matching.
nome :: Aluno -> String
nome (n, _, _, _) = n

-- 2. Calcula a media aritmetica das tres notas.
media :: Aluno -> Double
media (_, nota1, nota2, nota3) = (nota1 + nota2 + nota3) / 3

-- 3. Classifica pela media. A ordem das guardas importa:
-- se testassemos >= 3 primeiro, quem tem 8 viraria "final".
situacao :: Double -> String
situacao valor
  | valor >= 7 = "aprovado"
  | valor >= 3 = "final"
  | otherwise  = "reprovado"

-- 4. Recursiva: caso base (lista vazia) e caso (aluno:restante).
boletim :: [Aluno] -> [Resultado]
boletim [] = []
boletim (aluno:restante) =
  (nome aluno, media aluno, situacao (media aluno)) : boletim restante

-- Auxiliar (nao recursiva): compara dois (nome, media).
-- Empate: fica o primeiro, ou seja, o que aparece antes na lista.
melhorEntre :: (String, Double) -> (String, Double) -> (String, Double)
melhorEntre primeiro@(_, mediaPrimeiro) segundo@(_, mediaSegundo)
  | mediaSegundo > mediaPrimeiro = segundo
  | otherwise                    = primeiro

-- 5. Recursiva. Lista vazia: devolve ("", 0.0) (decisao da equipe).
-- A recursao esta aqui: descobre o melhor do resto e compara com o atual.
melhorAluno :: [Aluno] -> (String, Double)
melhorAluno [] = ("", 0.0)
melhorAluno [aluno] = (nome aluno, media aluno)
melhorAluno (aluno:restante) =
  melhorEntre (nome aluno, media aluno) (melhorAluno restante)

-- Extensao: conta quantos alunos tem a situacao informada.
contarPorSituacao :: String -> [Aluno] -> Int
contarPorSituacao _ [] = 0
contarPorSituacao desejada (aluno:restante)
  | situacao (media aluno) == desejada = 1 + contagemDoResto
  | otherwise                          = contagemDoResto
  where
    contagemDoResto = contarPorSituacao desejada restante

turmaExemplo :: [Aluno]
turmaExemplo =
  [ ("Ana", 8, 9, 7)
  , ("Bruno", 5, 6, 4)
  , ("Carla", 2, 3, 2)
  , ("Diego", 7, 7, 8)
  , ("Eva", 6, 8, 7)
  ]

main :: IO ()
main = do
  putStrLn "===== BOLETIM ESCOLAR ====="
  mapM_ print (boletim turmaExemplo)

  putStrLn "\nAluno com maior media:"
  print (melhorAluno turmaExemplo)

  putStrLn "\nQuantidade por situacao:"
  putStrLn ("aprovado: "  ++ show (contarPorSituacao "aprovado" turmaExemplo))
  putStrLn ("final: "     ++ show (contarPorSituacao "final" turmaExemplo))
  putStrLn ("reprovado: " ++ show (contarPorSituacao "reprovado" turmaExemplo))

  putStrLn "\nCasos limite:"
  putStrLn ("situacao 7.0 = " ++ situacao 7.0)
  putStrLn ("situacao 3.0 = " ++ situacao 3.0)
  putStrLn ("melhorAluno [] = " ++ show (melhorAluno []))
  putStrLn ("empate = " ++ show (melhorAluno [("A", 5, 5, 5), ("B", 5, 5, 5)]))
