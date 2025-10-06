CREATE OR REPLACE FUNCTION fn_valor_aleatorio_entre(lim_inferior INT, lim_superior INT)
RETURNS INT AS
$$
BEGIN
    RETURN floor(random() * (lim_superior - lim_inferior + 1) + lim_inferior);
END;
$$
LANGUAGE plpgsql;
-- 1.5 Faça um programa que calcule o determinante de uma matriz quadrada de ordem 3 utilizando a regra de Sarrus. 
-- Veja a regra aqui: https://en.wikipedia.org/wiki/Rule_of_Sarrus Preencha a matriz com valores inteiros aleatórios no intervalo de 1 a 12.

DO $$
DECLARE
  matriz INT[][] := ARRAY[
    [fn_valor_aleatorio_entre(1, 12), fn_valor_aleatorio_entre(1, 12), fn_valor_aleatorio_entre(1, 12)],
    [fn_valor_aleatorio_entre(1, 12), fn_valor_aleatorio_entre(1, 12), fn_valor_aleatorio_entre(1, 12)],
    [fn_valor_aleatorio_entre(1, 12), fn_valor_aleatorio_entre(1, 12), fn_valor_aleatorio_entre(1, 12)]
  ];
  linha INT[];
  det INT;
BEGIN
  RAISE NOTICE 'Matriz:';
  FOREACH linha SLICE 1 IN ARRAY matriz LOOP
    RAISE NOTICE '%', linha;
  END LOOP;

  det :=
    (matriz[1][1] * matriz[2][2] * matriz[3][3]) +
    (matriz[1][2] * matriz[2][3] * matriz[3][1]) +
    (matriz[1][3] * matriz[2][1] * matriz[3][2]) -
    (matriz[1][3] * matriz[2][2] * matriz[3][1]) -
    (matriz[1][1] * matriz[2][3] * matriz[3][2]) -
    (matriz[1][2] * matriz[2][1] * matriz[3][3]);

  RAISE NOTICE 'Determinante: %', det;
END;
$$;




-- 1.4 Gerar inteiros no intervalo de 1 a 100. 
-- Leia um conjunto não determinado de pares de valores M e N (parar quando algum dos valores for menor ou igual a zero). Para cada par lido, mostre a sequência do menor até o maior e a soma dos inteiros consecutivos entre eles (incluindo o N e M).
-- Entrada
-- O arquivo de entrada contém um número não determinado de valores M e N. A última linha de entrada vai conter um número nulo ou negativo.
-- Saída
-- Para cada dupla de valores, imprima a sequência do menor até o maior e a soma deles, conforme exemplo abaixo.
-- DO $$
-- DECLARE
--   m INT;
--   n INT;
--   menor INT;
--   maior INT;
--   soma INT;
--   contador INT := 0;
-- BEGIN
--   LOOP
--     contador := contador + 1;
--     EXIT WHEN contador > 5;  

--     m := fn_aleatorio_entre(1, 100);
--     n := fn_aleatorio_entre(1, 100);

--     -- Simula condição de parada (10% de chance de encerrar)
--     IF fn_aleatorio_entre(1, 10) = 1 THEN
--       RAISE NOTICE 'Parando aleatoriamente...';
--       EXIT;
--     END IF;

--     IF m > n THEN
--       menor := n;
--       maior := m;
--     ELSE
--       menor := m;
--       maior := n;
--     END IF;

--     soma := 0;
--     RAISE NOTICE 'Sequência de % a %:', menor, maior;

--     FOR i IN menor..maior LOOP
--       RAISE NOTICE '%', i;
--       soma := soma + i;
--     END LOOP;

--     RAISE NOTICE 'Soma = %', soma;
--     RAISE NOTICE '--------------------------';
--   END LOOP;

--   RAISE NOTICE 'Encerrado.';
-- END;
-- $$;




-- 1.3 Gerar inteiros no intervalo de 20 a 50. 
-- Leia 2 valores inteiros X e Y. A seguir, calcule e mostre a soma dos números impares entre eles.
-- Entrada
-- O arquivo de entrada contém dois valores inteiros.
-- Saída
-- O programa deve imprimir um valor inteiro. Este valor é a soma dos valores ímpares que estão entre os valores fornecidos na entrada que deverá caber em um inteiro.

-- DO $$
-- DECLARE
--   x INT := fn_valor_aleatorio_entre(20, 50);
--   y INT := fn_valor_aleatorio_entre(20, 50);
--   menor INT;
--   maior INT;
--   soma INT := 0;
-- BEGIN
--   IF x > y THEN
--     menor := y;
--     maior := x;
--   ELSE
--     menor := x;
--     maior := y;
--   END IF;

--   RAISE NOTICE 'X = %, Y = %', x, y;
--   RAISE NOTICE 'Somando ímpares entre % e %', menor, maior;

--   FOR i IN menor..maior LOOP
--     IF i % 2 <> 0 THEN
--       soma := soma + i;
--     END IF;
--   END LOOP;

--   RAISE NOTICE 'Soma dos ímpares: %', soma;
-- END;
-- $$


-- 1.2 Gerar inteiros no intervalo de -50 a 50. 
-- Faça um programa que leia 6 valores. Estes valores serão somente negativos ou positivos (desconsidere os valores nulos). A seguir, mostre a quantidade de valores positivos digitados.
-- Entrada
-- Seis valores, negativos e/ou positivos.
-- Saída
-- Imprima uma mensagem dizendo quantos valores positivos foram lidos.
-- Função para gerar número aleatório entre dois limites


-- DO $$
-- DECLARE
--   valores INT[] := ARRAY[
--     fn_aleatorio(-50, 50),
--     fn_aleatorio(-50, 50),
--     fn_aleatorio(-50, 50),
--     fn_aleatorio(-50, 50),
--     fn_aleatorio(-50, 50),
--     fn_aleatorio(-50, 50)
--   ];
--   v INT;
--   positivos INT := 0;
-- BEGIN
--   FOREACH v IN ARRAY valores LOOP
--     RAISE NOTICE 'Valor: %', v;
--     IF v > 0 THEN
--       positivos := positivos + 1;
--     END IF;
--   END LOOP;

--   RAISE NOTICE 'Quantidade de positivos: %', positivos;
-- END;
-- $$;



--  1.1 Resolva cada exercício a seguir usando LOOP, WHILE, FOR e FOREACH. Quando o enunciado disser que é preciso “ler” algum valor, gere-o aleatoriamente. 
-- Faça um programa que mostre os números pares entre 1 e 100, inclusive.
-- Entrada
-- Neste problema extremamente simples de repetição não há entrada.
-- Saída
-- Imprima todos os números pares entre 1 e 100, inclusive se for o caso, um em cada linha.
 
-- -- FOR
-- DO $$
-- BEGIN
--   RAISE NOTICE 'Números pares entre 1 e 100:';
--   FOR i IN 1..100 LOOP
--     IF i % 2 = 0 THEN
--       RAISE NOTICE '%', i;
--     END IF;
--   END LOOP;
-- END;
-- $$

-- --WHILE
-- DO $$
-- DECLARE
--   i INT := 1;
-- BEGIN
--   RAISE NOTICE 'Números pares entre 1 e 100:';
--   WHILE i <= 100 LOOP
--     IF i % 2 = 0 THEN
--       RAISE NOTICE '%', i;
--     END IF;
--     i := i + 1;
--   END LOOP;
-- END;
-- $$



--  -- EXCEPTION
-- DO $$
-- DECLARE
--   a INT := fn_valor_aleatorio_entre(0, 2);
-- BEGIN
--   IF a = 0 THEN
--     RAISE 'o divisor não pode ser zero';
--   ELSE
--     RAISE NOTICE 'Valor de a é %', a;
--   END IF;
-- EXCEPTION WHEN OTHERS THEN
--   --SQLState
--   --SQLERRM
--   RAISE NOTICE 'Exceção: %, %', SQLSTATE, SQLERRM;
-- END;
-- $$


-- DO $$
-- BEGIN
--   RAISE NOTICE 'A';
--   RAISE NOTICE '%', 1 / 0;
--   RAISE NOTICE 'B';
-- EXCEPTION
--   WHEN division_by_zero THEN
--     RAISE NOTICE 'C';
-- END;
-- $$

-- FOREACH combinado fatias(SLICE)
-- DO $$
-- DECLARE
--   vetor INT[] := ARRAY[1, 2, 3];
--   matriz INT[] := ARRAY[
--     [1, 2, 3],
--     [4, 5, 6],
--     [7, 8, 9]
--   ];
--   var_aux INT;
--   vet_aux INT[];
-- BEGIN
--   RAISE NOTICE 'SLICE %, vetor', 0;
--   FOREACH var_aux IN ARRAY vetor LOOP
--     RAISE NOTICE '%', var_aux;
--   END LOOP;
--   RAISE NOTICE '******************';
--   RAISE NOTICE 'SLICE %, vetor', 1;
--   FOREACH vet_aux SLICE 1 IN ARRAY vetor LOOP
--     RAISE NOTICE '%', vet_aux;
--     FOREACH var_aux IN ARRAY vet_aux LOOP
--       RAISE NOTICE '%', var_aux;
--     END LOOP;
--   END LOOP;
--   RAISE NOTICE '******************';
--   RAISE NOTICE 'SLICE %, matriz', 0;
--   FOREACH var_aux IN ARRAY matriz LOOP
--     RAISE NOTICE '%', var_aux;
--   END LOOP;
--   RAISE NOTICE 'SLICE %, matriz', 1;
--   FOREACH vet_aux SLICE 1 IN ARRAY matriz LOOP
--     RAISE NOTICE '%', vet_aux;
--   END LOOP;
--   RAISE NOTICE 'SLICE %, matriz', 2;
--   FOREACH vet_aux SLICE 2 IN ARRAY matriz LOOP
--     RAISE NOTICE '%', vet_aux;
--   END LOOP; 
-- END;
-- $$

-- FOREACH
-- DO $$
-- DECLARE
--   valores INT[] := ARRAY[
--     fn_valor_aleatorio_entre(1, 10),
--     fn_valor_aleatorio_entre(1, 10),
--     fn_valor_aleatorio_entre(1, 10),
--     fn_valor_aleatorio_entre(1, 10),
--     fn_valor_aleatorio_entre(1, 10)
--   ];
--   valor INT;
--   soma INT := 0;
-- BEGIN
--   FOREACH valor IN ARRAY valores LOOP
--     RAISE NOTICE 'Valor da vez: %', valor;
--     soma := soma + valor;
--   END LOOP;
--   RAISE NOTICE 'Soma: %', soma;
-- END;
-- $$

-- DO $$
-- DECLARE
--   aluno RECORD;
--   media NUMERIC(10, 2) := 0;
--   total INT;
-- BEGIN
--   FOR aluno IN
--     SELECT * FROM tb_aluno
--   LOOP
--     RAISE NOTICE 'Nota: %', aluno.nota;
--     media := media + aluno.nota;
--   END LOOP;
--     SELECT COUNT(*) FROM tb_aluno INTO total;
--     RAISE NOTICE 'Média: %', media / total;
-- END;
-- $$

-- DO $$
-- BEGIN
--   FOR i IN 1..100 LOOP
--     INSERT INTO 
--       tb_aluno(nota) 
--     VALUES
--       (fn_valor_aleatorio_entre(0, 10));
--   END LOOP;
-- END;
-- $$

-- SELECT * FROM tb_aluno;

-- -- CREATE TABLE tb_aluno(
--   cod_aluno SERIAL PRIMARY KEY,
--   nota INT
-- );

-- FOR
-- DO $$
-- DECLARE
-- BEGIN
--   -- plpgsql RAISE NOTICE 'De 1 a 50, pulando de dois em dois';
--   RAISE NOTICE 'De 1 a 50, pulando de dois em dois';
--   FOR i IN 1..50 BY 2 LOOP
--     RAISE NOTICE '%', i;
--   END LOOP;
--   -- RAISE NOTICE 'E agora? Com Reverse!';
--   -- FOR i IN REVERSE 1..10 LOOP
--   --   RAISE NOTICE '%', i;
--   -- END LOOP;
--   RAISE NOTICE 'de 1 a 10, pulando de um em um';
--   -- FOR i IN 1..10 LOOP
--   --   RAISE NOTICE '%', i;
--   -- END LOOP;
-- END;
-- $$



-- DO $$
-- DECLARE
--   nota INT;
--   media NUMERIC(10, 2) := 0;
--   contador INT := 0;
-- BEGIN
--   --sortear valores no intervalo [-1, 10]
--   SELECT fn_valor_aleatorio_entre(0, 11) - 1 INTO nota;
--   WHILE nota >= 0 LOOP
--     RAISE NOTICE '%', nota;
--     media := media + nota;
--     contador := contador + 1;
--     SELECT fn_valor_aleatorio_entre(0, 11) - 1 INTO nota;
--   END LOOP;
--   IF contador > 0 THEN
--     RAISE NOTICE 'Média %', media / contador;
--   ELSE
--     RAISE NOTICE 'Sem notas no momento';
--   END IF;
-- END;
-- $$

-- DO $$
-- DECLARE
--   i INT;
--   j INT;
-- BEGIN
--   i := 0;
--   <<externo>>
--   LOOP
--     i := i + 1;
--     EXIT WHEN i > 10;
--     j := 1;
--     <<interno>>
--     LOOP
--       RAISE NOTICE '%, %', i, j;
--       j := j + 1;
--       -- EXIT WHEN j > 10;
--       -- EXIT externo WHEN j > 5;
--       EXIT WHEN j > 5;
--     END LOOP;
--   END LOOP;
-- END;
-- $$

-- DO $$
-- DECLARE
--   contador INT := 0;
-- BEGIN
--   LOOP
--     contador := contador + 1;
--     EXIT WHEN contador > 100;
--     IF contador % 7 = 0 THEN
--       CONTINUE; --não execute o restante da iteração atual
--     END IF;
--     CONTINUE WHEN contador % 11 = 0;
--     RAISE NOTICE '%', contador;
--   END LOOP;
-- END;
-- $$


-- DO $$
-- DECLARE
--   contador INT := 1;
-- BEGIN
--   LOOP
--     RAISE NOTICE '%', contador;
--     contador := contador + 1;
--     EXIT WHEN contador > 10;
--   END LOOP;
-- END;
-- $$


-- DO $$
-- DECLARE
--   contador INT := 1;
-- BEGIN
--   LOOP
--     RAISE NOTICE '%', contador;
--     contador := contador + 1;
--     IF contador > 10 THEN
--       EXIT;
--     END IF;
--   END LOOP;
-- END;
-- $$


-- DO $$
-- BEGIN
--   LOOP
--     RAISE NOTICE 'Testando nosso primeiro loop...';
--   END LOOP;
-- END;
-- $$