-- 1) Quantas vezes Natalie Portman foi indicada ao Oscar?
SELECT * from movies where name like '%Natalie Portman%';

RESPOSTA: 3
-- 2)Quantos Oscars Natalie Portman ganhou?
SELECT * from movies where name = '%Natalie Portman%' and winner like 'True%';

RESPOSTA: Nenhuma
-- 3) Amy Adams já ganhou algum Oscar?
SELECT * from movies where name like '%Amy Adams%' and winner like 'True%';
RESPOSTA: Nenhum 
    
-- 4) A série de filmes Toy Story ganhou um Oscar em quais anos?
SELECT * from movies where film like '%Toy Story%' and winner like 'True%';
RESPOSTA: 2011 e 2020
-- 5)Quem tem mais Oscars: a categoria "Melhor  Ator" ou "Melhor Filme"?
    Select
    SUM(CASE WHEN category like '%ACTOR%' and winner like 'True%' THEN 1 ELSE 0 END) AS Melhor_Ator ,
    SUM(CASE WHEN category like '%BEST PICTURE%' and winner like 'True%' THEN 1 ELSE 0 END)  AS Melhor_Filme
   from movies;

RESPOSTA: Melhor ator com 177 contra 58 melhor filme 

-- 6)O primeiro Oscar para melhor Atriz foi para quem? Em que ano?
SELECT * from movies where category like '%ACTRESS%' and ceremony = '1' and winner like 'true%';

RESPOSTA: O primeiro oscar foi para Janet Gaynor / Ano 1928
    
-- 7) Na coluna/campo Winner, altere todos os valores com "True" para 1 e todos os valores "False" para 0.
UPDATE movies
SET winner = CASE
    WHEN winner = 'true' THEN '1'
    WHEN winner = 'false' THEN '0'
    ELSE winner
END;

1	1927	1928	1	ACTOR	Richard Barthelmess	The Noose	0
2	1927	1928	1	ACTOR	Emil Jannings	The Last Command	1
3	1927	1928	1	ACTRESS	Louise Dresser	A Ship Comes In	0
4	1927	1928	1	ACTRESS	Janet Gaynor	7th Heaven	1
5	1927	1928	1	ACTRESS	Gloria Swanson	Sadie Thompson	0
    
-- 8 Em qual edição do Oscar "Crash" ganhou o prêmio principal?
SELECT * FROM movies WHERE film = 'Crash' AND CATEGORY = 'FILM EDITING' AND winner LIKE '1%';

RESPOSTA: Em 2006 de melhor filme
    
-- 9 Bom... dê um Oscar para um filme que merece muito, mas não ganhou.
UPDATE movies SET winner = '1' WHERE id_movie = '8595';

RESPOSTA:  8595	2005	2006	78	CINEMATOGRAPHY	Wally Pfister	Batman Begins	1
    
-- 10 O filme Central do Brasil aparece no Oscar?
SELECT * FROM movies WHERE film LIKE '%Central Station%';

RESPOSTA: Sim foi indicado em 1999
    
-- 11 Inclua no banco 3 filmes que nunca nem foram nomeados ao Oscar, mas que na sua opinião, merecem. 
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('2019', '2020', '93', '', 'Anthony Russo, Joe Russo', 'Vingadores: Ultimato', '0');
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('2021', '2022', '93', '', 'Jon Watts', 'Homem-Aranha: Sem Volta para Casa', '0');
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('2021', '2022', '93', '', 'Anthony Russo, Joe Russo', 'Vingadores: Guerra Infinita', '0');

RESPOSTA: 
        '10396', '2019', '2020', '93', '', 'Anthony Russo, Joe Russo', 'Vingadores: Ultimato', 'True'
        '10397', '2021', '2022', '93', '', 'Jon Watts', 'Homem-Aranha: Sem Volta para Casa', 'True'
        '10398', '2021', '2022', '93', '', 'Anthony Russo, Joe Russo', 'Vingadores: Guerra Infinita', 'True'
    
-- 12  Crie uma nova categoria de premiação. Qualquer prêmio que você queira dar. Agora vamos dar esses prêmios aos filmes que você cadastrou na questão acima.'
UPDATE movies set category = 'Best Film In The Universe' where ceremony = '93';

RESPOSTA:
10396	2019	2020	93	Best Film In The Universe	Anthony Russo, Joe Russo	Vingadores: Ultimato	True
10397	2021	2022	93	Best Film In The Universe	Jon Watts	Homem-Aranha: Sem Volta para Casa	True
10398	2021	2022	93	Best Film In The Universe	Anthony Russo, Joe Russo	Vingadores: Guerra Infinita	True
    
-- 13 Qual foi o primeiro ano a ter um prêmio do Oscar?
SELECT * from movies where ceremony = '1';

RESPOSTA: EM 1928
    
-- 14 - Pensando no ano em que você nasceu: Qual foi o Oscar de melhor filme, Melhor Atriz e Melhor Diretor?
SELECT year_ceremony, category, film, name from movies where category in ('BEST PICTURE','ACTRESS','DIRECTING') and year_ceremony ='1999' and winner like '1';
RESPOSTA: 2 indicações
    
1999	DIRECTING	Saving Private Ryan	Steven Spielberg
1999	BEST PICTURE	Shakespeare in Love	David Parfitt, Donna Gigliotti, Harvey Weinstein, Edward Zwick and Marc Norman, Producers

-- 15 Agora procure 7 atrizes que não sejam americanas, europeias ou brasileiras.  Vamos cadastrá-los no nosso banco, mas eles ainda não ganharam o Oscar. Só foram nomeados.
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('1991', '1992', '64', 'ACTRESS', 'Gong Li', 'Raise the Red Lantern', '0');
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('2000', '2001', '73', 'ACTRESS', 'Zhang Ziyi', 'Crouching Tiger, Hidden Dragon', '0');
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('2005', '2006', '78', 'ACTRESS', 'Rinko Kikuchi', 'Babel', '0');
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('2020', '2021', '93', 'ACTRESS', 'Priyanka Chopra', '', '0');
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('2014', '2015', '87', 'ACTRESS', 'Rosamund Pike', 'Gone Girl', '0');
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('2006', '2007', '79', 'ACTRESS', 'Marion Cotillard', 'La Vie en Rose', '0');
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('2006', '2007', '79', 'ACTRESS', 'Tilda Swinton', 'Michael Clayton', '0');

RESPOSTA: 
1	1927	1928	1	ACTOR	Richard Barthelmess	The Noose	False
2	1927	1928	1	ACTOR	Emil Jannings	The Last Command	True
3	1927	1928	1	ACTRESS	Louise Dresser	A Ship Comes In	False
4	1927	1928	1	ACTRESS	Janet Gaynor	7th Heaven	True
5	1927	1928	1	ACTRESS	Gloria Swanson	Sadie Thompson	False
6	1927	1928	1	ART DIRECTION	Rochus Gliese	Sunrise	False
7	1927	1928	1	ART DIRECTION	William Cameron Menzies	The Dove;	True

-- 16- Agora vamos falar da sua vida. Me diga o nome de uma pessoa que você admira e o que ela fez na sua vida. Agora me diz: Quê prêmio essa pessoa merece? 
-- meu pai que me deu todo apoio confiança em todos momentos que foi preciso e cada passo dado.
INSERT INTO movies (year_film, year_ceremony, ceremony, category, `name`, film, winner) VALUES ('2022', '2023', '94', 'BEST DAD', 'José Da Purificação Oliveira', 'O Pai Do Ano', '1');
RESPOSTA: 10396	2022	2023	94	BEST DAD	José Da Purificação Oliveira	O Pai Do Ano	1
