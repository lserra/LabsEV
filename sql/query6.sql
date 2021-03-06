-- Pontuação mediana por temporada dos 20 melhores pilotos das últimas 10 temporadas
SELECT
	C.TEMPORADA_ANO AS 'TEMPORADA',
    P.NOME || ' ' || P.SOBRENOME AS 'PILOTO',
    P.NACIONALIDADE AS 'NACIONALIDADE',
    ROUND(AVG(HP.PONTUACAO),2) AS 'PONTUACAO_MEDIA'
FROM 
    HISTORICO_PILOTO HP 
	INNER JOIN CORRIDA C ON C.ID = HP.CORRIDA_ID
    INNER JOIN PILOTO P ON HP.PILOTO_ID = P.ID
WHERE 
	C.TEMPORADA_ANO >= (SELECT STRFTIME('%Y', 'NOW', '-10 YEARS') AS 'YEAR') 
	AND C.TEMPORADA_ANO <= (SELECT MAX(ANO) FROM TEMPORADA)
GROUP BY 
	C.TEMPORADA_ANO,
	P.ID
HAVING
	ROUND(AVG(HP.PONTUACAO),2) > 0
ORDER BY
	C.TEMPORADA_ANO,
	AVG(HP.PONTUACAO) DESC
--LIMIT 20;