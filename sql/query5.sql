-- Piloto que mais pontuou daqueles que nunca subiram no pódio
-- O piloto não pode ter subido no pódio em sua carreira da Fórmula 1 para entrar nesse grupo
-- Considerei as seguintes posições do pódio somente: 1, 2 e 3.
SELECT
	E.NOME AS 'EQUIPE',
	P.NOME || ' ' || P.SOBRENOME AS 'PILOTO',
	SUM(R.PONTUACAO) AS 'TOTAL_PONTOS'
FROM 
	RESULTADO R
	INNER JOIN PILOTO P ON R.PILOTO_ID = P.ID
	INNER JOIN EQUIPE E ON R.EQUIPE_ID = E.ID
WHERE
	R.PONTUACAO > 0
	AND R.POSICAO_ORDEM >= 4
GROUP BY
	R.PILOTO_ID
ORDER BY
	SUM(R.PONTUACAO) DESC;