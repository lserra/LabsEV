-- Melhor tempo de Pitstop por equipe por temporada
SELECT 
	C.TEMPORADA_ANO AS 'TEMPORADA', 
	C.NOME AS 'CIRCUITO',
	E.NOME AS 'EQUIPE',
	MIN(TPP.DURACAO_MILIS) AS 'TEMPO_PARADA'
FROM 
	CORRIDA C 
	INNER JOIN TEMPO_POR_PARADA TPP ON C.ID = TPP.CORRIDA_ID
	INNER JOIN RESULTADO R ON TPP.CORRIDA_ID = R.CORRIDA_ID AND TPP.PILOTO_ID = R.PILOTO_ID
	INNER JOIN PILOTO P ON R.PILOTO_ID = P.ID
	INNER JOIN EQUIPE E ON R.EQUIPE_ID = E.ID
GROUP BY
	C.TEMPORADA_ANO;