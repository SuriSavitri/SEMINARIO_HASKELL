-- Exemplo1.hs: exemplo conceitual
-- Conceito: tupla como registro. Aqui so o essencial, sem o boletim completo.

-- Um aluno e uma tupla: (nome, nota1, nota2, nota3).
-- Tipos diferentes juntos (String e Double), tamanho fixo (4 campos).
type Aluno = (String, Double, Double, Double)

aluno :: Aluno
aluno = ("Ana", 8, 9, 7)

-- 1) Pattern matching: damos nome aos campos e usamos _ para ignorar.
segundaNota :: Aluno -> Double
segundaNota (_, _, nota2, _) = nota2

-- 2) fst e snd so funcionam com PARES (2 elementos).
parNomeNota :: (String, Double)
parNomeNota = ("Ana", 8.5)

-- (fst aluno nao compila: aluno tem 4 campos. Teste no GHCi e copie o erro.)

-- 3) Imutabilidade: "mudar" a nota cria uma NOVA tupla; a original continua igual.
comNota1 :: Double -> Aluno -> Aluno
comNota1 nova (n, _, b, c) = (n, nova, b, c)

-- 4) Limite da tupla: nota1 e nota2 sao ambas Double, entao esta troca
-- COMPILA sem aviso. Com struct em C, o nome do campo ajudaria a evitar isso.
trocarSemQuerer :: Aluno -> Aluno
trocarSemQuerer (n, a, b, c) = (n, b, a, c)

-- 5) Lista x tupla: lista tem elementos do MESMO tipo e tamanho variavel.
notas :: [Double]
notas = [8, 9, 7]

main :: IO ()
main = do
  putStrLn "1) O aluno (esperado: (\"Ana\",8.0,9.0,7.0))"
  print aluno

  putStrLn "2) Segunda nota (esperado: 9.0)"
  print (segundaNota aluno)

  putStrLn "3) fst e snd em um par (esperado: \"Ana\" e 8.5)"
  print (fst parNomeNota)
  print (snd parNomeNota)

  putStrLn "4) Nova versao com nota1 = 10 (esperado: (\"Ana\",10.0,9.0,7.0))"
  print (comNota1 10 aluno)
  putStrLn "   Original intacta (esperado: (\"Ana\",8.0,9.0,7.0))"
  print aluno

  putStrLn "5) Troca sem querer, sem erro de compilacao (esperado: (\"Ana\",9.0,8.0,7.0))"
  print (trocarSemQuerer aluno)

  putStrLn "6) Lista de notas (esperado: [8.0,9.0,7.0])"
  print notas
