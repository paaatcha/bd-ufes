Quais os principais dados cadastrais de usuários acima do level 10?

mysql> SELECT NICK_MANE,NOME,PAIS,EMAIL 
FROM CONTA JOIN HEROI ON HEROI.ID_HEROI = CONTA.HEROI_ID 
WHERE HEROI.LEVEL > 10 ORDER BY PAIS;

+------------+----------+--------+-----------------+
| nick_mane  | nome     | pais   | email           |
+------------+----------+--------+-----------------+
| andre      | Andre    | Brasil | andre@gmail.com |
| jojo       | Joana    | Brasil | jojo@gmail.com  |
| t2         | Tiago    | Brasil | tiago@gmail.com |
| mariazinha | Maria    | Brasil | maria@gmail.com |
| lulu       | Luisa    | Canada | lulu@gmail.com  |
| paul       | Paulo    | USA    | paulo@gmail.com |
| lusk       | Lucas    | USA    | lucas@gmail.com |
| h4e1       | Henrique | USA    | hq@gmail.com    |
+------------+----------+--------+-----------------+
8 rows in set (0.00 sec)

	Qual o número de mulheres jogando em cada país?

mysql> SELECT COUNT(ID_CONTA) AS QTDE,SEXO,PAIS FROM CONTA WHERE SEXO LIKE "F" GROUP BY PAIS ORDER BY QTDE;
+------+------+--------+
| QTDE | SEXO | PAIS   |
+------+------+--------+
|    1 | F    | Canada |
|    2 | F    | Brasil |
+------+------+--------+
2 rows in set (0.00 sec)


	Quantas técnicas ainda restam para serem alcançadas por heróis?

mysql> SELECT ID_HEROI,LEVEL,LEVEL_PR 
FROM CONTA,HEROI,TECNICA 
WHERE ID_HEROI = HEROI_ID 
HAVING CAST(TECNICA.LEVEL_PR AS SIGNED) - CAST(HEROI.LEVEL AS SIGNED) > 0;
			
+----------+-------+----------+
| id_heroi | level | level_pr |
+----------+-------+----------+
|        9 |     5 |       10 |
|        2 |    20 |       30 |
|        4 |    10 |       30 |
|        5 |    15 |       30 |
|        8 |    25 |       30 |
|        9 |     5 |       30 |
|       10 |    20 |       30 |
|        9 |     5 |        7 |
+----------+-------+----------+
8 rows in set (0.00 sec)

	Quantos heróis estão em mapas aonde não existem monstros?

mysql> SELECT DISTINCT NOME_HEROI,EMAIL,PAIS 
FROM HEROI,CONTA 
WHERE ID_HEROI = HEROI_ID 
AND NOT EXISTS (SELECT * FROM MONSTRO 
				WHERE HEROI.MAPA_ID = MONSTRO.MAPA_ID);
				
+------------+-----------------+------+
| nome_heroi | email           | pais |
+------------+-----------------+------+
| Goku       | lucas@gmail.com | USA  |
| Batman     | hq@gmail.com    | USA  |
+------------+-----------------+------+
2 rows in set (0.00 sec)



	Qual a quantidade de heróis que podem comprar armas?

mysql> SELECT COUNT(NOME_HEROI), NOME_ARM
    -> FROM HEROI, ARMA
    -> WHERE MOEDAS > P_MOEDA GROUP BY NOME_ARM;
+-------------------+-----------------+
| count(nome_heroi) | nome_arm        |
+-------------------+-----------------+
|                 3 | Arco do Legolas |
|                10 | Cacetete do BME |
|                 9 | Espada de a+ºo  |
|                 8 | Espada de fogo  |
|                 9 | Faquinha do CS  |
|                 8 | Machado bolado  |
|                 9 | Machado simples |
|                 6 | Martelo de Thor |
|                 9 | Purrete         |
|                 3 | Sabre de luz    |
+-------------------+-----------------+
10 rows in set (0.00 sec)

	Quais as distâncias dos monstros para cada baú?

mysql> SELECT ID_BAU,COR,NOME_MONSTRO,
SQRT( 
	POW(CAST(BAU.LOC_X AS SIGNED) - CAST(MONSTRO.LOC_X AS SIGNED), 2 ) 
	+ POW(CAST(BAU.LOC_Y AS SIGNED) - CAST(MONSTRO.LOC_Y AS SIGNED), 2 ) ) AS DISTANCIA
FROM MONSTRO, BAU
WHERE BAU.MAPA_ID = MONSTRO.MAPA_ID
ORDER BY ID_BAU,DISTANCIA  ASC;
+--------+------------+----------------------+--------------------+
| id_bau | cor        | nome_monstro         | distancia          |
+--------+------------+----------------------+--------------------+
|      1 | Azul       | Freeza               |                  5 |
|      2 | Verde      | Porco Assassino      |                  1 |
|      3 | Preto      | Lobo                 |                  4 |
|      3 | Preto      | Buosi                |  7.280109889280518 |
|      4 | Amarelo    | Mulher de algod+úo   | 5.0990195135927845 |
|      5 | Cinza      | Funkeiro do transcol |  8.246211251235321 |
|      6 | Marrom     | Zumbi                | 11.313708498984761 |
|      7 | Roxo       | Boto Rosa            |  7.810249675906654 |
|      8 | Dourado    | Porco Assassino      |  5.385164807134504 |
|      9 | Laranja    | Boto Rosa            | 5.0990195135927845 |
|     10 | Invis+¡vel | Lobo                 |                 10 |
|     10 | Invis+¡vel | Buosi                | 13.892443989449804 |
+--------+------------+----------------------+--------------------+
12 rows in set (0.00 sec)

	Quais os monstros mais próximos de cada baú?

mysql> SELECT ID_BAU,COR,NOME_MONSTRO,
    -> min(SQRT(POW(CAST(BAU.LOC_X AS SIGNED) - CAST(MONSTRO.LOC_X AS SIGNED), 2
 ) + POW(CAST(BAU.LOC_Y AS SIGNED) - CAST(MONSTRO.LOC_Y AS SIGNED), 2 ) )) AS DI
STANCIA
    -> FROM MONSTRO, BAU
    -> WHERE BAU.MAPA_ID = MONSTRO.MAPA_ID
    -> group by id_bau
    -> ORDER BY ID_BAU,DISTANCIA ASC;
+--------+------------+----------------------+--------------------+
| ID_BAU | COR        | NOME_MONSTRO         | DISTANCIA          |
+--------+------------+----------------------+--------------------+
|      1 | Azul       | Freeza               |                  5 |
|      2 | Verde      | Porco Assassino      |                  1 |
|      3 | Preto      | Lobo                 |                  4 |
|      4 | Amarelo    | Mulher de algod+úo   | 5.0990195135927845 |
|      5 | Cinza      | Funkeiro do transcol |  8.246211251235321 |
|      6 | Marrom     | Zumbi                | 11.313708498984761 |
|      7 | Roxo       | Boto Rosa            |  7.810249675906654 |
|      8 | Dourado    | Porco Assassino      |  5.385164807134504 |
|      9 | Laranja    | Boto Rosa            | 5.0990195135927845 |
|     10 | Invis+¡vel | Lobo                 |                 10 |
+--------+------------+----------------------+--------------------+
10 rows in set (0.00 sec)




	Quantas contas foram criadas entre as datas X e Y?

mysql> SELECT NOME, EMAIL, DATA_IN, NOME_HEROI, HEROI.EXP
    ->  FROM CONTA
    ->  LEFT OUTER JOIN HEROI ON ID_HEROI = HEROI_ID
    ->  WHERE DATA_IN BETWEEN '2011-12-01' AND NOW();
+--------+-----------------+---------------------+------------+------+
| NOME   | EMAIL           | DATA_IN             | nome_heroi | exp  |
+--------+-----------------+---------------------+------------+------+
| Alvaro | alvaro@inf.com  | 2013-07-07 19:00:00 | Jo+úozinho |    2 |
| Tiago  | tiago@gmail.com | 2012-07-07 00:00:00 | Vegeta     |   12 |
| Joana  | jojo@gmail.com  | 2012-07-07 00:00:00 | Legolas    |   40 |
+--------+-----------------+---------------------+------------+------+
3 rows in set (0.00 sec)

ULTIMA POR ENQUANTO

Quanto tem em experiência e moedas as raças que contêm técnicas acima do nível 5?

mysql> SELECT RACA,SUM(EXP) AS EXPERIENCIA,SUM(MOEDAS) AS TOTAL, LEVEL_PR
    -> FROM HEROI, TECNICA
    -> WHERE ID_TECNICA = TECNICA_ID
    -> GROUP BY RACA
    -> HAVING LEVEL_PR > 5;
+-----------+-------------+--------+----------+
| raca      | experiencia | total  | level_pr |
+-----------+-------------+--------+----------+
| Elfo      |          40 |  44599 |       10 |
| Jedi_Sith |          40 | 200000 |       30 |
+-----------+-------------+--------+----------+
2 rows in set (0.01 sec)

Quais equipamentos usam herois em mapas que contem monstros?

mysql> SELECT NOME_HEROI, NOME_CAP,ARMA.NOME_ARM,ARMADURA.NOME_ARM,NOME_BOTA,NOM
E_TEC,NOME_MAGIA
    -> FROM HEROI
    -> LEFT OUTER JOIN CAPACETE ON ID_CAPACETE = CAPACETE_ID
    -> LEFT OUTER JOIN BOTA ON ID_BOTA = BOTA_ID
    -> LEFT OUTER JOIN ARMA ON ID_ARMA = ARMA_ID
    -> LEFT OUTER JOIN ARMADURA ON ID_ARMADURA = ARMADURA_ID
    -> LEFT OUTER JOIN TECNICA ON ID_TECNICA = TECNICA_ID
    -> LEFT OUTER JOIN MAGIA ON ID_MAGIA = MAGIA_ID
    -> WHERE
    -> ID_HEROI IN (SELECT ID_HEROI FROM HEROI, MONSTRO WHERE HEROI.MAPA_ID = MO
NSTRO.MAPA_ID);
+-------------+------------------------+-----------------+----------------------
--+------------------+--------------+---------------+
| nome_heroi  | nome_cap               | nome_arm        | nome_arm
  | nome_bota        | nome_tec     | nome_magia    |
+-------------+------------------------+-----------------+----------------------
--+------------------+--------------+---------------+
| Brandon     | Capacete de urso       | Espada de fogo  | Armadura de bronze
  | Butina           | Esquiva      | Geek Dame     |
| Legolas     | Capacete Romano        | Arco do Legolas | armadura de adamantiu
n | Tamanco          | Silva        | Kamerramerr+í |
| Hodor       | Capacete de motoqueiro | Espada de a+ºo  | Armadura de bronze
  | Butina           | Fecha Guarda | Italia        |
| Thor        | Capacete Bolado        | Martelo de Thor | Armadura de fogo
  | Bota de ouro     | Jones        | Moedao        |
| Darth Vader | Capacete Bolado        | Sabre de luz    | Armadura Nokia Azul
  | Bota inteligente | Fly          | Negra         |
| Anakin      | Panela de adamantium   | Sabre de luz    | Armadura invis+¡vel
  | Havainas de pau  | Fecha Guarda | Vodka         |
| Jo+úozinho  | capacete de melancia   | Machado simples | Armadura de barro
  | All Star         | Esquiva      | Geek Dame     |
| Vegeta      | Capacete Romano        | Espada de fogo  | Armadura de fogo
  | Bota inteligente | Lanca arma   | Moedao        |
+-------------+------------------------+-----------------+----------------------
--+------------------+--------------+---------------+
8 rows in set (0.01 sec)

Qual os dados de conta e heroi daqueles personagens aonde estáo mosntros com ataque maior que 5?

mysql> SELECT NICK_MANE, NOME_HEROI, LEVEL, ATAQUE
    -> FROM CONTA, HEROI
    -> WHERE ID_HEROI = HEROI_ID AND MAPA_ID
    -> IN (SELECT MONSTRO.MAPA_ID FROM MONSTRO WHERE N_ATAQUE > 5);
+------------+-------------+-------+--------+
| nick_mane  | nome_heroi  | level | ataque |
+------------+-------------+-------+--------+
| andre      | Darth Vader |    50 |     83 |
| alvs       | Jo+úozinho  |     5 |      5 |
| mariazinha | Brandon     |    20 |     22 |
| paul       | Anakin      |    60 |     93 |
| t2         | Vegeta      |    20 |     19 |
| jojo       | Legolas     |    44 |     45 |
| lulu       | Thor        |    15 |     38 |
| tutu       | Hodor       |    10 |     12 |
+------------+-------------+-------+--------+
8 rows in set (0.00 sec)

--adicionar em referencias
http://dev.mysql.com/doc/refman/5.0/en/optimizing-subqueries.html

http://dev.mysql.com/doc/refman/5.0/en/in-subquery-optimization.html

---essas sao duas consultas para comparacao de performance... os links acima sao as referencias
Quais os herois pertencentes a contas com email de dominio inf?

SELECT NOME_HEROI, LEVEL
FROM HEROI
WHERE ID_HEROI 
IN (SELECT heroi_id FROM conta WHERE email like '%inf%');
 
 
SELECT NOME_HEROI, LEVEL
FROM HEROI
WHERE exists (SELECT 1 FROM conta WHERE email like '%inf%' and id_heroi = heroi_id);
 
 +------------+-------+
| NOME_HEROI | LEVEL |
+------------+-------+
| Jo+úozinho |     5 |
+------------+-------+
1 row in set (0.00 sec)


 --VIEWS
--VIEW Para um usuario poder acompanhar que heroi tem o level mais alto
 
mysql> CREATE VIEW maior_level AS
    -> SELECT NOME_HEROI, NOME_CAP,ARMA.NOME_ARM,ARMADURA.NOME_ARM,NOME_BOTA,NOM
E_TEC,NOME_MAGIA,max(LEVEL)
    -> FROM HEROI
    -> LEFT OUTER JOIN CAPACETE ON ID_CAPACETE = CAPACETE_ID
    -> LEFT OUTER JOIN BOTA ON ID_BOTA = BOTA_ID
    -> LEFT OUTER JOIN ARMA ON ID_ARMA = ARMA_ID
    -> LEFT OUTER JOIN ARMADURA ON ID_ARMADURA = ARMADURA_ID
    -> LEFT OUTER JOIN TECNICA ON ID_TECNICA = TECNICA_ID
    -> LEFT OUTER JOIN MAGIA ON ID_MAGIA = MAGIA_ID;
ERROR 1060 (42S21): Duplicate column name 'NOME_ARM'
mysql> CREATE VIEW maior_level AS
    -> SELECT NOME_HEROI, NOME_CAP, ARMA.NOME_ARM as Arma,ARMADURA.NOME_ARM as a
rmadura,NOME_BOTA,NOME_TEC,NOME_MAGIA,max(LEVEL)
    -> FROM HEROI
    -> LEFT OUTER JOIN CAPACETE ON ID_CAPACETE = CAPACETE_ID
    -> LEFT OUTER JOIN BOTA ON ID_BOTA = BOTA_ID
    -> LEFT OUTER JOIN ARMA ON ID_ARMA = ARMA_ID
    -> LEFT OUTER JOIN ARMADURA ON ID_ARMADURA = ARMADURA_ID
    -> LEFT OUTER JOIN TECNICA ON ID_TECNICA = TECNICA_ID
    -> LEFT OUTER JOIN MAGIA ON ID_MAGIA = MAGIA_ID;
Query OK, 0 rows affected (0.14 sec)

-- exemplo do uso da view
mysql> select * from maior_level;
+------------+----------------------+----------------+-------------------+------
-----+-----------------+------------+------------+
| NOME_HEROI | NOME_CAP             | Arma           | armadura          | NOME_
BOTA | NOME_TEC        | NOME_MAGIA | max(LEVEL) |
+------------+----------------------+----------------+-------------------+------
-----+-----------------+------------+------------+
| Goku       | capacete de melancia | Espada de a+ºo | Armadura de barro | All S
tar  | Golpe Giratorio | Negra      |         60 |
+------------+----------------------+----------------+-------------------+------
-----+-----------------+------------+------------+
1 row in set (0.03 sec)

--segunda view
---ver os usuarios que se cadastraram no dia atual
CREATE VIEW cadastros_dia AS
SELECT NOME, EMAIL, DATA_IN, NOME_HEROI, PAIS
 FROM CONTA
 LEFT OUTER JOIN HEROI ON ID_HEROI = HEROI_ID
 WHERE DATA_IN BETWEEN date_sub(now(),interval 1 day) AND NOW();

----- 15 consultas feitas respeitando os requisitos pedidos. 
FALTA ALGEBRA RELACIONAL
 
1 - Email das contas que contëm herois HUMANOS:
p conta.email ( s heroi.raca = 'Humanos'( heroi |X|(heroi.id_heroi = conta.heroi_id) conta ))

 ps.: troca a letra p pelo SIMBOLO pi e a letra s pelo SIMBOLO sigma
 
2 - nome do mapa em que est[a a conta de ID = 7
p mapa.nome_mapa ( s conta.id_conta = '7' ( conta |X|(conta.heroi_id = heroi.id_heroi) heroi ) |X| (heroi.mapa_id = mapa.id_mapa) mapa)

ps.: troca a letra p pelo SIMBOLO pi e a letra s pelo SIMBOLO sigma

3 - Qual a ultima missao do desafio de Goku?
p desafio.missao_3 ( s heroi.nome_heroi = 'Goku' ( heroi |X|(heroi.desafio_id = desafio.id_desafio) desafio)

ps.: troca a letra p pelo SIMBOLO pi e a letra s pelo SIMBOLO sigma

