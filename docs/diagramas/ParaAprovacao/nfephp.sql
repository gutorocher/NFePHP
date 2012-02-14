/*
SQLyog Enterprise - MySQL GUI v6.0
Host - 5.1.32-community : Database - nfephp
*********************************************************************
Server version : 5.1.32-community
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `nfephp`;

USE `nfephp`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `emitente` */

DROP TABLE IF EXISTS `emitente`;

CREATE TABLE `emitente` (
  `Id_emit` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Id sequencial do emitente',
  `Razao_Social` text NOT NULL COMMENT 'Razao Social do emintente',
  `Fantasia` text COMMENT 'Fantasia do Emitente',
  `Cnpj` int(14) NOT NULL COMMENT 'Cnpj Do eminten 14 posicoes',
  `IE` int(11) DEFAULT NULL COMMENT 'Ie do emitente',
  `Cnae_Fiscal` int(11) DEFAULT NULL COMMENT 'Descobrir oq é',
  `IM` int(11) DEFAULT NULL COMMENT 'Inscrica Municial emitente',
  `Ie_St` int(11) DEFAULT NULL COMMENT 'Inscricao Estatdual Subt tributario',
  `Logaduro` text NOT NULL COMMENT 'Endereco do emitente',
  `Numero_logaduro` text NOT NULL COMMENT 'NUmero do endereco',
  `Complemnte` text COMMENT 'complemento do endereco',
  `Bairro` text NOT NULL COMMENT 'Bairro ',
  `Cep` int(8) NOT NULL COMMENT 'Cep',
  `Cod_Pais` int(5) NOT NULL COMMENT 'Codigo Do Pais do Emitente referencia tabela Pais',
  `UF` int(5) NOT NULL COMMENT 'Codigo Da UF Refenreica tabela UF',
  `Municipio` int(5) NOT NULL COMMENT 'Codigo Do Municipio referencia tabela municipio',
  `Telefone` text NOT NULL COMMENT 'Telefone do emintente',
  `logo` text COMMENT 'Caminho ate o logo do eminte',
  PRIMARY KEY (`Id_emit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='Dados de identifcacao do emitente';

/*Data for the table `emitente` */

/*Table structure for table `estado` */

DROP TABLE IF EXISTS `estado`;

CREATE TABLE `estado` (
  `id_uf` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Codigo Sequencial da uf',
  `desc_uf` text NOT NULL COMMENT 'Nome do estado',
  `sigla_uf` varchar(2) NOT NULL COMMENT 'Sigla do estado',
  `id_pais` int(5) NOT NULL COMMENT 'Referencia tabela Pais',
  PRIMARY KEY (`id_uf`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `FK_estado` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='Cadastro de UF';

/*Data for the table `estado` */

/*Table structure for table `funcoes` */

DROP TABLE IF EXISTS `funcoes`;

CREATE TABLE `funcoes` (
  `id_funcao` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Sequencial Tabela',
  `descricao_funcao` text COMMENT 'nome_interno',
  `id_webservice` int(5) DEFAULT NULL COMMENT 'rerefrencia tabela web service para ter o nome do servico',
  `arquivo_xsd` text COMMENT 'path para os arquivo xsd',
  `versao_xsd` varchar(5) DEFAULT NULL COMMENT 'numero da versao do xsd',
  PRIMARY KEY (`id_funcao`),
  KEY `id_webservice` (`id_webservice`),
  CONSTRAINT `FK_funcoes` FOREIGN KEY (`id_webservice`) REFERENCES `webservice` (`id_web-service`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='Nomes Internos e XSD';

/*Data for the table `funcoes` */

/*Table structure for table `municipio` */

DROP TABLE IF EXISTS `municipio`;

CREATE TABLE `municipio` (
  `id_municipio` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Sequencial ID dos municipio',
  `id_uf` int(5) NOT NULL COMMENT 'Codigo da Uf qual pertence a cidade',
  `desc_municipo` text NOT NULL COMMENT 'Nome do Municipio',
  `codigo_ibge` int(7) NOT NULL COMMENT 'Codigo Ibge do muncipio',
  `id_pais` int(5) NOT NULL COMMENT 'refencia tabela pais',
  PRIMARY KEY (`id_municipio`),
  KEY `id_uf` (`id_uf`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `FK_municipio` FOREIGN KEY (`id_uf`) REFERENCES `estado` (`id_uf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='Cadastro De Municipios';

/*Data for the table `municipio` */

/*Table structure for table `nfes` */

DROP TABLE IF EXISTS `nfes`;

CREATE TABLE `nfes` (
  `id` int(11) NOT NULL COMMENT 'Id da Tabela',
  `nfe_id` varchar(44) NOT NULL COMMENT 'IdentificaÃ§Ã£o da NFe',
  `nfe_numnf` int(11) NOT NULL COMMENT 'Numero da NF',
  `nfe_ent_format` varchar(3) NOT NULL COMMENT 'Formato na entrada TXT ou XML',
  `nfe_ent_time` datetime NOT NULL COMMENT 'Data e Hora da Leitura',
  `nfe_sign_time` datetime NOT NULL COMMENT 'Data e Hora da Assinatura Digital',
  `nfe_intval_status` tinyint(4) NOT NULL COMMENT 'Statusda ValidaÃ§Ã£o Interna 0-Falha 1-OK',
  `nfe_lote` int(11) NOT NULL COMMENT 'Numero do lote de envio',
  `nfe_lote_time` datetime NOT NULL COMMENT 'Data e hora da ciraÃ§Ã£o do lote de envio',
  `nfe_SEFAZ_envtime` datetime NOT NULL COMMENT 'DAta e hora do envio ao SEFAZ',
  `nfe_sefaz_retstatus` tinyint(4) NOT NULL COMMENT 'Status da NFe no SEFAZ',
  `nfe_sefaz_rettime` datetime NOT NULL COMMENT 'Data e hora do retorno do SEFAZ',
  `nfe_sefaz_protocol` varchar(44) NOT NULL COMMENT 'Numero do protocolo de aceitaÃ§Ã£o do SEFAZ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cadastro das NFe tratadas pelo sistema';

/*Data for the table `nfes` */

/*Table structure for table `pais` */

DROP TABLE IF EXISTS `pais`;

CREATE TABLE `pais` (
  `id_pais` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Id sequencial codigo do pais',
  `desc_pais` text NOT NULL COMMENT 'Nome do pais',
  `codigo_pais` int(10) NOT NULL COMMENT 'Codigo Pais Ibge',
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='Tabela de Paises';

/*Data for the table `pais` */

/*Table structure for table `paramentro` */

DROP TABLE IF EXISTS `paramentro`;

CREATE TABLE `paramentro` (
  `id_paramentro` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Sequencial',
  `id_usuario` int(5) NOT NULL COMMENT 'Codigo Usuario',
  `autorizacao` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Permite Emissao de nota',
  `cancela` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Permite Cancelar nota',
  `certificado` text COMMENT 'Path Pro certificado',
  `ativa_cups` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Se vai usar ou nao cups',
  `impressora_cups` text COMMENT 'Qual Impressora vai usar',
  PRIMARY KEY (`id_paramentro`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `FK_paramentro` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='Paramentros Dos usuarios';

/*Data for the table `paramentro` */

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id_usuario` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Codigo Squencial Usuario',
  `Nome` text NOT NULL COMMENT 'Nome do Usuario',
  `login` varchar(10) NOT NULL COMMENT 'Login de Acesso',
  `senha` varchar(10) NOT NULL COMMENT 'Senha de Acesso',
  `situacao` int(1) NOT NULL COMMENT 'Situacao Logado Desconectado Bloqueado',
  `emitente` text COMMENT 'Emitentes a qual o usuario esta autorizado a emitir nfe',
  `data_cad` datetime DEFAULT NULL COMMENT 'Data Cadastro Usuario',
  `ultimo_acesso` datetime DEFAULT NULL COMMENT 'Data do ultimo acesso',
  `ultimo_ip` varchar(16) DEFAULT NULL COMMENT 'Ip do ultimo acesso',
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='Cadastro De Usuarios';

/*Data for the table `usuario` */

/*Table structure for table `webservice` */

DROP TABLE IF EXISTS `webservice`;

CREATE TABLE `webservice` (
  `id_web-service` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Sequencial da Lista de Web Service',
  `id_uf` varchar(5) DEFAULT NULL COMMENT 'SIGLA UF ou SCAN/DPEC/SVAN/SVRS',
  `servico` text COMMENT 'Nome Do Servico',
  `url_web_service` text COMMENT 'Url Do Web Service',
  PRIMARY KEY (`id_web-service`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='WebServices';

/*Data for the table `webservice` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
