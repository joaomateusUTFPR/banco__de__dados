-- GITHUB: https://github.com/joaomateusUTFPR/banco__de__dados/blob/main/consultas.sql

SELECT F.nome, M.tipo
FROM funcionarios AS F, maquina AS M
WHERE F.cpf IN (SELECT opera.cpf_funcionario
				FROM opera
                                WHERE registro_maquina = 3)
AND M.registro IN (SELECT opera.registro_maquina
				FROM opera
				WHERE registro_maquina = 3);
			 
-- Encontra os nomes dos funcionários que operam a maquina de determinado registro (3) e qual o tipo de maquina.
-- -----------------------------

SELECT F.nome, F.registro AS registro_funcionario, D.nome AS departamento, D.registro AS registro_departamento
FROM funcionarios AS F, departamento AS D
WHERE F.cpf  IN (SELECT trabalha.cpf_funcionario
					   FROM trabalha
					   WHERE registro_departamento = 5)
AND D.registro IN (SELECT trabalha.registro_departamento
					   FROM trabalha
					   WHERE registro_departamento = 5);
                          
-- Encontra os nomes e registros do funcionários que operam no departamento de determinado registro (5) e o nome do departamento.
-- ---------------------------

SELECT P.material, P.valor
FROM produto AS P
WHERE P.cod IN (SELECT possui.cod_produto
		FROM possui
                WHERE possui.registro_categoria IN (SELECT C.registro
						    FROM categoria C 
                                                    WHERE C.nome = 'liga'));
                                                    
-- Encontra os nomes e valores dos materiais que possuem determinada categoria (liga).
-- --------------------------

SELECT E.registro, E.localidade
FROM estoque AS E
WHERE EXISTS (SELECT *
	      FROM guarda G
              WHERE G.cod_produto = 3 AND G.registro_estoque = E.registro);
              
              
-- Encontra o registro e a localidade do estoque que guarda o produto de codigo 3.
-- --------------------------

SELECT F.nome
FROM fornecedor as F
WHERE EXISTS (SELECT *
	      FROM fornece FORN
              WHERE FORN.cod_produto IN (SELECT P.cod
					 FROM produto P
                                         WHERE P.material = 'ferro') AND F.cnpj = FORN.cnpj_fornecedor);
                                         
-- Encontra os nomes de fornecedores que fornecem algum produto com material feito de ferro. 
-- -----------------------

SELECT F.nome, F.cpf
FROM funcionarios as F
WHERE NOT exists (SELECT *
		  FROM trabalha T
                  WHERE T.registro_departamento IN (SELECT D.registro
						    FROM departamento D
                                                    WHERE D.nome = 'Diretoria') AND F.cpf = T.cpf_funcionario);
                                                    
-- Encontra os nomes de funcionários que não trabalham no departamento de diretoria. 
-- --------------------

SELECT L.cnpj, L.nome
FROM loja as L
WHERE L.cnpj IN (SELECT V.cnpj_loja
		 FROM vende as V
                 WHERE V.cod_produto IN (SELECT P.cod
					 FROM produto P
				         WHERE P.material = 'aluminio'));
                                         
-- Encontra o cnpj e os nomes das lojas que vendem algum produto cujo material é feito de aluminio.
-- ---------------------

SELECT M.tipo, M.localidade
FROM maquina as M
WHERE M.registro IN (SELECT F.registro_maquina
		     FROM fabrica F
                     WHERE F.cod_produto IN (SELECT P.cod
					     FROM produto P
                                             WHERE P.valor > 200));
                                             
-- Encontra o tipo e a localidade das maquinas que fabricam produtos cujo valor é maior que 200.
-- -------------------------

SELECT E.registro, E.localidade
FROM estoque E
WHERE E.quantidade > (SELECT AVG(E2.quantidade)
		      FROM estoque E2);

-- Encontra o registro e a localidade dos estoques que possuem a quantidade de armazenamento maior que a média.
-- -------------------------

SELECT DISTINCT F.nome
FROM fornecedor F, fornece FORN
WHERE F.cnpj = FORN.cnpj_fornecedor
AND F.localidade LIKE 'C%'

-- Encontra o nome dos fornecedores cuja localidade é em uma cidade que começa com a letra C.


