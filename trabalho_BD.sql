-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 07/07/2013 às 11h27min
-- Versão do Servidor: 5.5.31
-- Versão do PHP: 5.3.10-1ubuntu3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `trabalho_BD`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `arma`
--

CREATE TABLE IF NOT EXISTS `arma` (
  `id_arma` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_arm` varchar(30) NOT NULL,
  `p_diamante` int(10) unsigned NOT NULL,
  `p_moeda` int(10) unsigned NOT NULL,
  `n_ataque` int(10) unsigned NOT NULL,
  `level_pr` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_arma`),
  UNIQUE KEY `nome_arm` (`nome_arm`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `arma`
--

INSERT INTO `arma` (`id_arma`, `nome_arm`, `p_diamante`, `p_moeda`, `n_ataque`, `level_pr`) VALUES
(1, 'Espada de aço', 5, 1000, 6, 1),
(2, 'Espada de fogo', 15, 5000, 14, 5),
(3, 'Machado bolado', 16, 7000, 17, 7),
(4, 'Arco do Legolas', 50, 50000, 50, 20),
(5, 'Martelo de Thor', 30, 35000, 41, 15),
(6, 'Machado simples', 2, 500, 3, 1),
(7, 'Cacetete do BME', 1, 200, 1, 1),
(8, 'Sabre de luz', 60, 70000, 73, 25),
(9, 'Purrete', 5, 1200, 8, 2),
(10, 'Faquinha do CS', 2, 800, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `armadura`
--

CREATE TABLE IF NOT EXISTS `armadura` (
  `id_armadura` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_arm` varchar(30) NOT NULL,
  `p_diamante` int(10) unsigned NOT NULL,
  `p_moeda` int(10) unsigned NOT NULL,
  `n_defesa` int(10) unsigned NOT NULL,
  `level_pr` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_armadura`),
  UNIQUE KEY `nome_arm` (`nome_arm`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `armadura`
--

INSERT INTO `armadura` (`id_armadura`, `nome_arm`, `p_diamante`, `p_moeda`, `n_defesa`, `level_pr`) VALUES
(1, 'Armadura de barro', 0, 100, 1, 1),
(2, 'Armadura de bronze', 2, 900, 3, 1),
(3, 'Armadura de prata', 5, 2000, 10, 2),
(4, 'Armadura de ouro', 7, 2000, 4, 2),
(5, 'Armadura invisível', 12, 7000, 10, 4),
(6, 'Armadura Caveira', 15, 5000, 12, 5),
(7, 'Armadura de fogo', 20, 15000, 20, 7),
(8, 'Colete a prova de boala', 25, 40000, 30, 15),
(9, 'armadura de adamantiun', 50, 100000, 70, 30),
(10, 'Armadura Nokia Azul', 100, 500000, 100, 50);

-- --------------------------------------------------------

--
-- Estrutura da tabela `bau`
--

CREATE TABLE IF NOT EXISTS `bau` (
  `id_bau` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cor` varchar(30) NOT NULL,
  `n_moedas` int(10) unsigned NOT NULL,
  `n_diamantes` int(10) unsigned NOT NULL,
  `loc_x` int(10) unsigned NOT NULL,
  `loc_y` int(10) unsigned NOT NULL,
  `mapa_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_bau`),
  UNIQUE KEY `cor` (`cor`),
  KEY `mapa_id` (`mapa_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `bau`
--

INSERT INTO `bau` (`id_bau`, `cor`, `n_moedas`, `n_diamantes`, `loc_x`, `loc_y`, `mapa_id`) VALUES
(1, 'Azul', 100, 0, 4, 3, 2),
(2, 'Verde', 150, 1, 8, 12, 4),
(3, 'Preto', 0, 3, 1, 9, 10),
(4, 'Amarelo', 500, 1, 7, 2, 9),
(5, 'Cinza', 1000, 0, 11, 4, 8),
(6, 'Marrom', 5, 0, 1, 1, 7),
(7, 'Roxo', 2000, 1, 5, 9, 5),
(8, 'Dourado', 10000, 0, 13, 9, 4),
(9, 'Laranja', 450, 1, 5, 4, 5),
(10, 'Invisível', 50000, 10, 15, 9, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `bota`
--

CREATE TABLE IF NOT EXISTS `bota` (
  `id_bota` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_bota` varchar(30) NOT NULL,
  `p_diamante` int(10) unsigned NOT NULL,
  `p_moeda` int(10) unsigned NOT NULL,
  `n_defesa` int(10) unsigned NOT NULL,
  `level_pr` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_bota`),
  UNIQUE KEY `nome_bota` (`nome_bota`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `bota`
--

INSERT INTO `bota` (`id_bota`, `nome_bota`, `p_diamante`, `p_moeda`, `n_defesa`, `level_pr`) VALUES
(1, 'All Star', 0, 100, 2, 1),
(2, 'Butina', 2, 500, 4, 1),
(3, 'Cuturno', 4, 700, 6, 2),
(4, 'Havainas de pau', 8, 1500, 10, 5),
(5, 'Bota de Aço', 12, 5000, 13, 7),
(6, 'crocs', 6, 1200, 7, 3),
(7, 'Bota de adamantium', 40, 60000, 30, 20),
(8, 'Tamanco', 3, 400, 2, 1),
(9, 'Bota inteligente', 40, 70000, 35, 25),
(10, 'Bota de ouro', 20, 30000, 15, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `capacete`
--

CREATE TABLE IF NOT EXISTS `capacete` (
  `id_capacete` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_cap` varchar(30) NOT NULL,
  `p_diamante` int(10) unsigned NOT NULL,
  `p_moeda` int(10) unsigned NOT NULL,
  `n_defesa` int(10) unsigned NOT NULL,
  `level_pr` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_capacete`),
  UNIQUE KEY `nome_cap` (`nome_cap`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `capacete`
--

INSERT INTO `capacete` (`id_capacete`, `nome_cap`, `p_diamante`, `p_moeda`, `n_defesa`, `level_pr`) VALUES
(1, 'capacete de melancia', 0, 100, 1, 1),
(2, 'Capacete de urso', 1, 300, 2, 1),
(3, 'Capacete de motoqueiro', 1, 700, 3, 1),
(4, 'Capacete de guerra', 3, 1200, 5, 2),
(5, 'Capacete Romano', 5, 1500, 5, 2),
(6, 'Panela de adamantium', 10, 17000, 10, 5),
(7, 'Capacete Viking', 12, 20000, 13, 6),
(8, 'Capacete de fogo', 11, 17000, 10, 4),
(9, 'Capacete Bolado', 14, 23000, 14, 7),
(10, 'Capacete MtForte', 17, 30000, 23, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `conta`
--

CREATE TABLE IF NOT EXISTS `conta` (
  `id_conta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(32) NOT NULL,
  `nick_mane` varchar(50) NOT NULL,
  `sexo` enum('M','F') NOT NULL,
  `pais` varchar(30) NOT NULL,
  `data_in` datetime NOT NULL,
  `heroi_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_conta`),
  UNIQUE KEY `email` (`email`,`nick_mane`),
  KEY `heroi_id` (`heroi_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `conta`
--

INSERT INTO `conta` (`id_conta`, `nome`, `email`, `senha`, `nick_mane`, `sexo`, `pais`, `data_in`, `heroi_id`) VALUES
(1, 'Andre', 'andre@gmail.com', '1234', 'andre', 'M', 'Brasil', '2010-07-01 04:00:00', 6),
(2, 'Alvaro', 'alvaro@inf.com', '1234', 'alvs', 'M', 'Brasil', '2013-07-07 19:00:00', 9),
(3, 'Lucas', 'lucas@gmail.com', '1234', 'lusk', 'M', 'USA', '2009-04-09 15:00:00', 1),
(4, 'Maria', 'maria@gmail.com', '1234', 'mariazinha', 'F', 'Brasil', '2011-07-07 10:00:00', 2),
(5, 'Paulo', 'paulo@gmail.com', '1234', 'paul', 'M', 'USA', '2011-07-07 00:00:00', 7),
(6, 'Tiago', 'tiago@gmail.com', '1234', 't2', 'M', 'Brasil', '2012-07-07 00:00:00', 10),
(7, 'Henrique', 'hq@gmail.com', '1234', 'h4e1', 'M', 'USA', '2011-07-07 00:00:00', 8),
(8, 'Joana', 'jojo@gmail.com', '1234', 'jojo', 'F', 'Brasil', '2012-07-07 00:00:00', 3),
(9, 'Luisa', 'lulu@gmail.com', '1234', 'lulu', 'F', 'Canada', '2011-07-07 00:00:00', 5),
(10, 'Artur', 'tutu@gmail.com', '1234', 'tutu', 'M', 'Brasil', '2010-07-07 00:00:00', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `desafio`
--

CREATE TABLE IF NOT EXISTS `desafio` (
  `id_desafio` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao_des` text NOT NULL,
  `missao_1` varchar(100) NOT NULL,
  `missao_2` varchar(100) NOT NULL,
  `missa_3` varchar(100) NOT NULL,
  PRIMARY KEY (`id_desafio`),
  KEY `id_desafio` (`id_desafio`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Extraindo dados da tabela `desafio`
--

INSERT INTO `desafio` (`id_desafio`, `descricao_des`, `missao_1`, `missao_2`, `missa_3`) VALUES
(1, 'Desafio do dia: Este é apenas um aquecimento. Cumpra as missões a seguir:', 'Mate 20 monstros', 'Não perca sangue', 'Gaste toda sua energia'),
(2, 'Desafio do dia: A vila está em perigo. Você deve proteje-la o mais rapido possivel. As missões são:', 'Colete 5000 moedas', 'Mate 50 monstros', 'Fique 1h na vila'),
(3, 'Desafio do dia: O quão rápido você é? Proteja-se!', 'Encontre 10 baús', 'Conquiste 2 diamantes', 'Obtenha uma nova técnica'),
(4, 'Desafio do dia: A vila foi atacada enquanto você esteve fora. E agora josé? ', 'Mate 100 monstros', 'Utilize uma magia', 'Compre uma nova arma'),
(5, 'Desafio do dia: Você se considera forte o suficiente? Saiba que nunca esta preparado o suficiente.', 'Compre uma nova bota', 'Compre um novo capacete', 'Compre uma nova armadura'),
(7, 'Desafio do dia: A magia é tão importante quanto a técnica.', 'Compre uma nova técnica', 'Compre uma nova magia', 'Utilize uma técnica'),
(8, 'Desafio do dia: Sua vila está falindo. Salve-a', 'Recolha 20 mil moedas', 'Recolha 5 diamantes', 'Visite 3 mapas diferentes'),
(9, 'Desafio diario: Subir de level é sempre bom. Você precisa de mais experiência.', 'Conquiste 100 de experiência', 'Encontre 3 baús azuis', 'Suba de level'),
(10, 'Desafio diario: Os monstros estão se aproximando. Haja!', 'Mate 50 monstros', 'Gaste toda sua energia', 'Use uma magia'),
(11, 'Desafio diario: Você se tornou um bom guerreiro, porém pode melhorar.', 'Suba de level', 'Compre uma nova arma', 'Aprenda uma nova técnica');

-- --------------------------------------------------------

--
-- Estrutura da tabela `heroi`
--

CREATE TABLE IF NOT EXISTS `heroi` (
  `id_heroi` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_heroi` varchar(50) NOT NULL,
  `raca` varchar(20) NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `sangue` int(10) unsigned NOT NULL,
  `exp` int(10) unsigned NOT NULL,
  `ataque` int(10) unsigned NOT NULL,
  `defesa` int(10) unsigned NOT NULL,
  `energia` int(10) unsigned NOT NULL,
  `moedas` int(10) unsigned NOT NULL,
  `diamantes` int(10) unsigned NOT NULL,
  `desafio_id` int(10) unsigned NOT NULL,
  `arma_id` int(10) unsigned NOT NULL,
  `armadura_id` int(10) unsigned NOT NULL,
  `magia_id` int(10) unsigned NOT NULL,
  `tecnica_id` int(10) unsigned NOT NULL,
  `bota_id` int(10) unsigned NOT NULL,
  `capacete_id` int(10) unsigned NOT NULL,
  `mapa_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_heroi`),
  UNIQUE KEY `nome_heroi` (`nome_heroi`),
  KEY `desafio_id` (`desafio_id`),
  KEY `arma_id` (`arma_id`),
  KEY `armadura_id` (`armadura_id`),
  KEY `magia_id` (`magia_id`),
  KEY `tecnica_id` (`tecnica_id`),
  KEY `bota_id` (`bota_id`),
  KEY `capacete_id` (`capacete_id`),
  KEY `mapa_id` (`mapa_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `heroi`
--

INSERT INTO `heroi` (`id_heroi`, `nome_heroi`, `raca`, `level`, `sangue`, `exp`, `ataque`, `defesa`, `energia`, `moedas`, `diamantes`, `desafio_id`, `arma_id`, `armadura_id`, `magia_id`, `tecnica_id`, `bota_id`, `capacete_id`, `mapa_id`) VALUES
(1, 'Goku', 'Saiyajin', 37, 100, 22, 39, 25, 90, 107000, 25, 1, 1, 1, 1, 1, 1, 1, 1),
(2, 'Brandon', 'Humano', 20, 89, 15, 22, 15, 92, 40000, 14, 2, 2, 2, 2, 2, 2, 2, 2),
(3, 'Legolas', 'Elfo', 44, 70, 40, 45, 30, 67, 44599, 28, 7, 4, 9, 5, 7, 8, 5, 6),
(4, 'Hodor', 'Orc', 10, 87, 5, 12, 8, 90, 4500, 3, 8, 1, 2, 8, 5, 2, 3, 4),
(5, 'Thor', 'Deus', 15, 98, 10, 38, 20, 77, 30000, 39, 10, 5, 7, 6, 8, 10, 9, 8),
(6, 'Darth Vader', 'Jedi_Sith', 50, 100, 40, 83, 70, 100, 200000, 50, 5, 8, 10, 1, 9, 9, 9, 10),
(7, 'Anakin', 'Jedi', 60, 100, 45, 93, 50, 100, 300000, 55, 9, 8, 5, 10, 5, 4, 6, 8),
(8, 'Batman', 'Morcego', 25, 94, 18, 21, 10, 85, 40000, 15, 2, 3, 6, 8, 1, 2, 1, 1),
(9, 'Joãozinho', 'Humano', 5, 75, 2, 5, 2, 48, 300, 1, 2, 6, 1, 2, 2, 1, 1, 2),
(10, 'Vegeta', 'Saiyajin', 20, 57, 12, 19, 15, 78, 34500, 16, 9, 2, 7, 6, 3, 9, 5, 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `loja`
--

CREATE TABLE IF NOT EXISTS `loja` (
  `id_loja` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_loja` varchar(50) NOT NULL,
  `loc_x` int(10) unsigned NOT NULL,
  `loc_y` int(10) unsigned NOT NULL,
  `tecnica_id` int(10) unsigned NOT NULL,
  `magia_id` int(10) unsigned NOT NULL,
  `armadura_id` int(10) unsigned NOT NULL,
  `arma_id` int(10) unsigned NOT NULL,
  `capacete_id` int(10) unsigned NOT NULL,
  `bota_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_loja`),
  UNIQUE KEY `nome_loja` (`nome_loja`),
  KEY `tecnica_id` (`tecnica_id`),
  KEY `magia_id` (`magia_id`),
  KEY `armadura_id` (`armadura_id`),
  KEY `arma_id` (`arma_id`),
  KEY `capacete_id` (`capacete_id`),
  KEY `bota_id` (`bota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `magia`
--

CREATE TABLE IF NOT EXISTS `magia` (
  `id_magia` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_magia` varchar(30) NOT NULL,
  `descricao` text NOT NULL,
  `p_moedas` int(10) unsigned NOT NULL,
  `p_diamantes` int(10) unsigned NOT NULL,
  `level_pr` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_magia`),
  UNIQUE KEY `nome_magia` (`nome_magia`),
  UNIQUE KEY `nome_magia_2` (`nome_magia`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `magia`
--

INSERT INTO `magia` (`id_magia`, `nome_magia`, `descricao`, `p_moedas`, `p_diamantes`, `level_pr`) VALUES
(1, 'Negra', 'Reduz pela metade o nivel de ataque e defesa de todos os montros', 50000, 10, 2),
(2, 'Geek Dame', 'Mata todos os montros ao seu redor', 13, 47000, 4),
(3, 'Medicinal', 'Restaura todo o seu sangue', 20000, 5, 1),
(4, 'RedBull', 'Restaura toda sua energia', 15000, 4, 2),
(5, 'Kamerramerrá', 'Destrou qualquer mostro indicado', 2000, 2, 1),
(6, 'Moedao', 'Dobra o numero de moedas arrecadadas durante 1h', 30000, 10, 5),
(7, 'UFC', 'Dobra o seu nível de ataque', 15000, 7, 3),
(8, 'Italia', 'Dobra o seu nível de defesa', 6000, 6, 5),
(9, 'Cogumelo do Sol', 'Dobra a sua velocidade', 6000, 7, 3),
(10, 'Vodka', 'Nada que o atingi diminuirá seu sangue', 20000, 12, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `mapa`
--

CREATE TABLE IF NOT EXISTS `mapa` (
  `id_mapa` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_mapa` varchar(30) NOT NULL,
  `n_monstro` int(10) unsigned NOT NULL,
  `moeda_rec` int(10) unsigned NOT NULL,
  `diamante_rec` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_mapa`),
  UNIQUE KEY `nome_mapa` (`nome_mapa`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `mapa`
--

INSERT INTO `mapa` (`id_mapa`, `nome_mapa`, `n_monstro`, `moeda_rec`, `diamante_rec`) VALUES
(1, 'Vila', 0, 0, 0),
(2, 'Caverna do dragão', 5, 500, 1),
(3, 'Winterfell', 7, 1000, 2),
(4, 'Castelo Negro', 10, 2000, 2),
(5, 'Colatina', 14, 3000, 3),
(6, 'Ilha da perdição', 13, 3500, 2),
(7, 'Zumbiland', 20, 4000, 4),
(8, 'Serra', 25, 4500, 4),
(9, 'Parque da cebola', 5, 100, 0),
(10, 'UFES', 50, 5000, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `monstro`
--

CREATE TABLE IF NOT EXISTS `monstro` (
  `id_monstro` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_monstro` varchar(30) NOT NULL,
  `n_ataque` int(10) unsigned NOT NULL,
  `n_defesa` int(10) unsigned NOT NULL,
  `sangue` int(10) unsigned NOT NULL,
  `moeda_cai` int(10) unsigned NOT NULL,
  `exp_cai` int(10) unsigned NOT NULL,
  `loc_x` int(10) unsigned NOT NULL,
  `loc_y` int(10) unsigned NOT NULL,
  `mapa_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_monstro`),
  UNIQUE KEY `nome_monstro` (`nome_monstro`),
  KEY `mapa_id` (`mapa_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `monstro`
--

INSERT INTO `monstro` (`id_monstro`, `nome_monstro`, `n_ataque`, `n_defesa`, `sangue`, `moeda_cai`, `exp_cai`, `loc_x`, `loc_y`, `mapa_id`) VALUES
(1, 'Freeza', 13, 5, 20, 20, 5, 4, 8, 2),
(2, 'Lobo', 15, 10, 15, 15, 3, 5, 9, 10),
(3, 'Kymera', 30, 30, 30, 25, 6, 1, 0, 3),
(4, 'Porco Assassino', 15, 10, 20, 5, 4, 8, 11, 4),
(5, 'Boto Rosa', 50, 50, 50, 10, 10, 10, 3, 5),
(6, 'Urso Negro', 40, 20, 35, 17, 6, 3, 9, 6),
(7, 'Zumbi', 40, 10, 40, 7, 3, 9, 9, 7),
(8, 'Funkeiro do transcol', 50, 15, 20, 0, 0, 3, 2, 8),
(9, 'Mulher de algodão', 43, 24, 30, 4, 4, 6, 7, 9),
(10, 'Buosi', 100, 100, 100, 5, 10, 3, 2, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tecnica`
--

CREATE TABLE IF NOT EXISTS `tecnica` (
  `id_tecnica` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_tec` varchar(30) NOT NULL,
  `descricao` text NOT NULL,
  `p_moedas` int(10) unsigned NOT NULL,
  `p_diamante` int(10) unsigned NOT NULL,
  `level_pr` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_tecnica`),
  UNIQUE KEY `nome_tec` (`nome_tec`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `tecnica`
--

INSERT INTO `tecnica` (`id_tecnica`, `nome_tec`, `descricao`, `p_moedas`, `p_diamante`, `level_pr`) VALUES
(1, 'Golpe Giratorio', 'Aplica um golpe girado no monstro', 3000, 2, 1),
(2, 'Esquiva', 'Consegue se esquivar do monstro rapidamente', 4000, 2, 1),
(3, 'Lanca arma', 'O herói aprende a lançar a arma em direção ao monstro', 7000, 3, 2),
(4, 'Chute', 'Aplica um chute no monstro', 5000, 3, 2),
(5, 'Fecha Guarda', 'O herói aprende a se defender dos golpes de um monstro', 9000, 4, 4),
(6, 'Zidade', 'O Herói aplica um golpe com a cabeça no monstro. O o nivel de defesa do capacete se torna o nivel de ataque da cabeçada', 15000, 5, 5),
(7, 'Silva', 'Aplica um chute fatal no queixo do monstro', 40000, 15, 10),
(8, 'Jones', 'Aplica uma cotovelada que tira metade do sangue do monstro', 23000, 8, 5),
(9, 'Fly', 'O Herói aprende a alçar pequenos voos', 100000, 80, 30),
(10, 'Dedo no olho', 'O herói consegue acertar o dedo nos olhos do monstro deixando o cego', 40000, 15, 7);

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `bau`
--
ALTER TABLE `bau`
  ADD CONSTRAINT `bau_ibfk_1` FOREIGN KEY (`mapa_id`) REFERENCES `mapa` (`id_mapa`);

--
-- Restrições para a tabela `conta`
--
ALTER TABLE `conta`
  ADD CONSTRAINT `conta_ibfk_1` FOREIGN KEY (`heroi_id`) REFERENCES `heroi` (`id_heroi`);

--
-- Restrições para a tabela `heroi`
--
ALTER TABLE `heroi`
  ADD CONSTRAINT `heroi_ibfk_1` FOREIGN KEY (`desafio_id`) REFERENCES `desafio` (`id_desafio`),
  ADD CONSTRAINT `heroi_ibfk_2` FOREIGN KEY (`arma_id`) REFERENCES `arma` (`id_arma`),
  ADD CONSTRAINT `heroi_ibfk_3` FOREIGN KEY (`armadura_id`) REFERENCES `armadura` (`id_armadura`),
  ADD CONSTRAINT `heroi_ibfk_4` FOREIGN KEY (`magia_id`) REFERENCES `magia` (`id_magia`),
  ADD CONSTRAINT `heroi_ibfk_5` FOREIGN KEY (`tecnica_id`) REFERENCES `tecnica` (`id_tecnica`),
  ADD CONSTRAINT `heroi_ibfk_6` FOREIGN KEY (`bota_id`) REFERENCES `bota` (`id_bota`),
  ADD CONSTRAINT `heroi_ibfk_7` FOREIGN KEY (`capacete_id`) REFERENCES `capacete` (`id_capacete`),
  ADD CONSTRAINT `heroi_ibfk_8` FOREIGN KEY (`mapa_id`) REFERENCES `mapa` (`id_mapa`);

--
-- Restrições para a tabela `loja`
--
ALTER TABLE `loja`
  ADD CONSTRAINT `loja_ibfk_1` FOREIGN KEY (`tecnica_id`) REFERENCES `tecnica` (`id_tecnica`),
  ADD CONSTRAINT `loja_ibfk_2` FOREIGN KEY (`magia_id`) REFERENCES `magia` (`id_magia`),
  ADD CONSTRAINT `loja_ibfk_3` FOREIGN KEY (`armadura_id`) REFERENCES `armadura` (`id_armadura`),
  ADD CONSTRAINT `loja_ibfk_4` FOREIGN KEY (`arma_id`) REFERENCES `arma` (`id_arma`),
  ADD CONSTRAINT `loja_ibfk_5` FOREIGN KEY (`capacete_id`) REFERENCES `capacete` (`id_capacete`),
  ADD CONSTRAINT `loja_ibfk_6` FOREIGN KEY (`bota_id`) REFERENCES `bota` (`id_bota`);

--
-- Restrições para a tabela `monstro`
--
ALTER TABLE `monstro`
  ADD CONSTRAINT `monstro_ibfk_1` FOREIGN KEY (`mapa_id`) REFERENCES `mapa` (`id_mapa`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
