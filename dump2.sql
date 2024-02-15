-- MySQL dump 10.13  Distrib 8.2.0, for Linux (x86_64)
--
-- Host: localhost    Database: keycloakbd
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('02a5d863-2e02-44db-9923-48c00eebf85c',NULL,NULL,'master','d2742d20-ce87-44f8-9710-2471ae07a594',1,30,_binary '','b0338680-2b60-4070-86e5-f935d6d6d893',NULL),('02db5b62-ec3e-4e32-8ad2-9a7976a58960',NULL,'reset-otp','animalia','0276924a-4da5-485b-8bbb-3dc51adce42a',0,20,_binary '\0',NULL,NULL),('030d9f2b-f5f5-4c7d-a47b-e15b62dec8ae',NULL,'direct-grant-validate-otp','master','b0338680-2b60-4070-86e5-f935d6d6d893',0,20,_binary '\0',NULL,NULL),('0435c45d-fce6-43ae-a971-6eec3cf95645',NULL,'conditional-user-configured','master','791357e0-52c8-43fa-9a6c-ebe05abd003a',0,10,_binary '\0',NULL,NULL),('07d4b940-c656-4654-bec4-7c17fd300329',NULL,'docker-http-basic-authenticator','master','9f5e8042-9125-4b51-aed0-089ee032b2d3',0,10,_binary '\0',NULL,NULL),('0b35c4b7-c583-483c-b091-b95720fc179f',NULL,'idp-username-password-form','animalia','9b2f7cd4-6041-47a9-a9a4-cb09360e1418',0,10,_binary '\0',NULL,NULL),('0f236dd2-43ba-4642-931c-5912892a63a7',NULL,'client-jwt','animalia','cfa1fc87-dec3-49b4-aee4-8a80d2a8a77b',2,20,_binary '\0',NULL,NULL),('10a5ba58-0cc1-4dff-a9ea-bb37c606305f',NULL,'auth-cookie','master','cca95a72-6257-4d06-9a85-7ffed902b6ce',2,10,_binary '\0',NULL,NULL),('15b9caef-3024-4648-9040-9bc647657eeb',NULL,'registration-password-action','animalia','916d0797-dcbb-4926-a95c-ae86f183647b',0,50,_binary '\0',NULL,NULL),('17e61314-1c40-4de7-8965-33a6cd24c2e3',NULL,'idp-confirm-link','animalia','7319b48f-2c50-44d6-a4e5-49d421666180',0,10,_binary '\0',NULL,NULL),('1880548d-3199-4110-abd1-1ba599044a30',NULL,'auth-otp-form','animalia','3e021fdb-5cd4-4617-bb42-ef5d0f931659',0,20,_binary '\0',NULL,NULL),('1d02394b-8a91-45b3-9707-6695bbb8afd3',NULL,'basic-auth','master','8038fd8a-c679-46c9-9edc-d29c7c30a8ce',0,10,_binary '\0',NULL,NULL),('1d1393c0-1f0b-4537-9aa7-35e98791ee23',NULL,'auth-spnego','animalia','cd6975ee-80c0-49da-9321-5ff5d01a18f3',3,20,_binary '\0',NULL,NULL),('235d6c09-3c98-4863-8a07-2414751774f3',NULL,'auth-spnego','master','cca95a72-6257-4d06-9a85-7ffed902b6ce',3,20,_binary '\0',NULL,NULL),('26b4e358-d038-4ac9-86d4-09e415198797',NULL,'conditional-user-configured','animalia','0276924a-4da5-485b-8bbb-3dc51adce42a',0,10,_binary '\0',NULL,NULL),('27d8cc30-a3f3-4f1c-b0f9-5d38692ef3eb',NULL,'registration-profile-action','animalia','916d0797-dcbb-4926-a95c-ae86f183647b',0,40,_binary '\0',NULL,NULL),('28db6b4f-6879-4578-a9db-502b21d83efd',NULL,NULL,'animalia','3e2fffe9-3e91-4ecc-8704-49ea71e04def',1,40,_binary '','0276924a-4da5-485b-8bbb-3dc51adce42a',NULL),('2a58e41f-a543-4eca-b927-002bcd41ef8e',NULL,'reset-password','master','f271262e-3f64-4496-8dea-f55de065f841',0,30,_binary '\0',NULL,NULL),('2cd8f519-9d33-4d9b-b6e5-2efeffb2d9c2',NULL,NULL,'animalia','303df658-ad23-4d10-8ae9-643335765ec7',0,20,_binary '','9706eecd-f203-410f-b4fb-09841ce19ead',NULL),('2f0c6721-be97-46c9-9899-b4d7fd3f9ffc',NULL,'direct-grant-validate-username','animalia','60f158e0-7d46-4c95-99f9-13bddad789a2',0,10,_binary '\0',NULL,NULL),('2f4d33cf-92a3-4937-8cc7-19d99d79ddaf',NULL,'registration-profile-action','master','50f35df6-97c6-4ccd-8cdc-712c52170887',0,40,_binary '\0',NULL,NULL),('3938d41b-4887-403f-9c57-844297146936',NULL,'conditional-user-configured','master','ec571d52-54aa-4952-b309-cfcd5a1c5c4b',0,10,_binary '\0',NULL,NULL),('3997a32a-6163-4d03-a219-6e9ffe0ca5b7',NULL,'basic-auth','animalia','37be6a45-7870-4a79-9022-2010672407d9',0,10,_binary '\0',NULL,NULL),('3fa13c69-877e-4307-b848-5d169dd86b90',NULL,'conditional-user-configured','animalia','3e021fdb-5cd4-4617-bb42-ef5d0f931659',0,10,_binary '\0',NULL,NULL),('43f8dc31-2a6e-4e28-93df-827816384eef',NULL,'no-cookie-redirect','master','fa28220f-5408-4b6c-b581-3bfbecb91918',0,10,_binary '\0',NULL,NULL),('46bfb5f6-1bcd-4637-9a36-bbed45de7997',NULL,'http-basic-authenticator','master','45101b20-dff5-4b04-a4f9-bf916c2e8546',0,10,_binary '\0',NULL,NULL),('472f62ea-61e5-4650-855f-99cde2ac5dc9',NULL,'auth-username-password-form','master','cb234361-54f6-4f30-800c-9846bbd3b4d0',0,10,_binary '\0',NULL,NULL),('4a474965-b05b-478a-b5a5-6e9758a68e2d',NULL,NULL,'master','245cb4f6-2512-4536-85dd-345bdb54b370',0,20,_binary '','043d1348-9284-4b23-863e-8e10a00b8b4c',NULL),('4d37c05e-35a1-45b4-b0df-3a696c4bf4f5',NULL,'registration-password-action','master','50f35df6-97c6-4ccd-8cdc-712c52170887',0,50,_binary '\0',NULL,NULL),('504c9cf0-2e71-4dd1-9642-8a0d2fe776a4',NULL,'identity-provider-redirector','animalia','cd6975ee-80c0-49da-9321-5ff5d01a18f3',2,25,_binary '\0',NULL,NULL),('507f3518-4242-4457-ab17-1bca23ef29d7',NULL,'auth-spnego','master','8038fd8a-c679-46c9-9edc-d29c7c30a8ce',3,30,_binary '\0',NULL,NULL),('57e4bca6-5edf-4883-a65b-650dca125560',NULL,'idp-confirm-link','master','de5f1f5b-f6c1-46ba-aef9-b32cbd46aeea',0,10,_binary '\0',NULL,NULL),('58e4b9a9-4c6c-4b09-a520-b30a4bc0b795',NULL,'registration-user-creation','animalia','916d0797-dcbb-4926-a95c-ae86f183647b',0,20,_binary '\0',NULL,NULL),('59488867-17cf-4977-9478-3f7f058ba956',NULL,'reset-password','animalia','3e2fffe9-3e91-4ecc-8704-49ea71e04def',0,30,_binary '\0',NULL,NULL),('5bf42f52-19bb-4d83-b5ff-59d76880c98d',NULL,'idp-email-verification','animalia','b3ebaffb-6848-4cec-be4d-7c7d4072c6cc',2,10,_binary '\0',NULL,NULL),('5e4c88f3-f0ba-4e3e-b1de-a48936bf6e97',NULL,'identity-provider-redirector','master','cca95a72-6257-4d06-9a85-7ffed902b6ce',2,25,_binary '\0',NULL,NULL),('5f3a5439-de9f-4196-b549-e09d232e84d9',NULL,'no-cookie-redirect','animalia','be0f0915-9f81-4bc1-8b47-7baffa8f0db0',0,10,_binary '\0',NULL,NULL),('65079d2c-59f9-41bd-8d06-dbaa4d61fc67',NULL,'conditional-user-configured','master','b0338680-2b60-4070-86e5-f935d6d6d893',0,10,_binary '\0',NULL,NULL),('689a88db-eb47-4f34-a2fb-50f91e336ab7',NULL,'http-basic-authenticator','animalia','ed852844-1ad2-4fd1-852b-8f48c861e344',0,10,_binary '\0',NULL,NULL),('6a5eb1cc-752e-453b-80a0-3a26d6fb24de',NULL,NULL,'animalia','60f158e0-7d46-4c95-99f9-13bddad789a2',1,30,_binary '','a7962e63-16d2-4eaa-ae64-d8d573152189',NULL),('70743041-f807-4a28-b3e5-18882fd5c4cc',NULL,NULL,'animalia','cd6975ee-80c0-49da-9321-5ff5d01a18f3',2,30,_binary '','fdb0151e-d931-494c-b51c-173349fadc17',NULL),('71488760-b1d7-45a4-8496-37b320d9cdac',NULL,NULL,'master','043d1348-9284-4b23-863e-8e10a00b8b4c',2,20,_binary '','de5f1f5b-f6c1-46ba-aef9-b32cbd46aeea',NULL),('746a99bb-7de4-4b90-9e1a-13c6cc76a78d',NULL,'auth-username-password-form','animalia','fdb0151e-d931-494c-b51c-173349fadc17',0,10,_binary '\0',NULL,NULL),('750a1bf4-3ef7-47dc-b4b5-2515ec313e9d',NULL,'registration-recaptcha-action','master','50f35df6-97c6-4ccd-8cdc-712c52170887',3,60,_binary '\0',NULL,NULL),('7582ea8e-fcd4-445d-8841-175d8067ecbf',NULL,'client-secret','master','02dc6b1e-c677-477c-a39b-b0e06812641d',2,10,_binary '\0',NULL,NULL),('75b4196c-efab-483f-a708-f40f4e853f58',NULL,'client-secret-jwt','master','02dc6b1e-c677-477c-a39b-b0e06812641d',2,30,_binary '\0',NULL,NULL),('77248339-7d7f-4fe1-bfee-6d84605aa87a',NULL,NULL,'animalia','9706eecd-f203-410f-b4fb-09841ce19ead',2,20,_binary '','7319b48f-2c50-44d6-a4e5-49d421666180',NULL),('779f9dc8-7731-4076-a15f-a1231a8d1268',NULL,'basic-auth-otp','master','8038fd8a-c679-46c9-9edc-d29c7c30a8ce',3,20,_binary '\0',NULL,NULL),('7c19cc68-1089-44c0-a44a-76bb6a740290',NULL,NULL,'animalia','fdb0151e-d931-494c-b51c-173349fadc17',1,20,_binary '','3e021fdb-5cd4-4617-bb42-ef5d0f931659',NULL),('7fd7114f-90f9-4cf8-916a-4e153a1e5166',NULL,'reset-credential-email','master','f271262e-3f64-4496-8dea-f55de065f841',0,20,_binary '\0',NULL,NULL),('844d48f3-c2ad-4e59-9c56-74e3bd70635e',NULL,'client-secret-jwt','animalia','cfa1fc87-dec3-49b4-aee4-8a80d2a8a77b',2,30,_binary '\0',NULL,NULL),('871781a5-4be7-413c-a5d3-f2bac76df151',NULL,'reset-credentials-choose-user','master','f271262e-3f64-4496-8dea-f55de065f841',0,10,_binary '\0',NULL,NULL),('87a15295-0dc0-4d95-adc7-98d70b0a2335',NULL,'auth-otp-form','master','791357e0-52c8-43fa-9a6c-ebe05abd003a',0,20,_binary '\0',NULL,NULL),('87ca5769-e56d-439c-9e0b-d97406b06755',NULL,'direct-grant-validate-password','master','d2742d20-ce87-44f8-9710-2471ae07a594',0,20,_binary '\0',NULL,NULL),('87d53a3c-8e77-4052-aa27-bd67efb585a3',NULL,NULL,'animalia','be0f0915-9f81-4bc1-8b47-7baffa8f0db0',0,20,_binary '','37be6a45-7870-4a79-9022-2010672407d9',NULL),('8e6c8974-1c16-49d0-a768-d2add5e981a8',NULL,'idp-review-profile','animalia','303df658-ad23-4d10-8ae9-643335765ec7',0,10,_binary '\0',NULL,'6d8be1da-6ac9-463f-b723-2e494b642965'),('90060f19-497a-40f1-9fca-3f26a2645435',NULL,'auth-cookie','animalia','cd6975ee-80c0-49da-9321-5ff5d01a18f3',2,10,_binary '\0',NULL,NULL),('90effeba-4d8d-48bd-9dc1-f70ae6890e75',NULL,'auth-otp-form','master','ec571d52-54aa-4952-b309-cfcd5a1c5c4b',0,20,_binary '\0',NULL,NULL),('9356f390-d87a-4720-8f6e-35b915e72aa1',NULL,NULL,'master','45201917-8391-4083-84f4-d5326a2e40b7',1,20,_binary '','ec571d52-54aa-4952-b309-cfcd5a1c5c4b',NULL),('9626cc59-87e1-4a74-9b7d-e2831b399a72',NULL,'conditional-user-configured','animalia','1cd0adf0-bf84-4fea-9111-8b8c7b3ee881',0,10,_binary '\0',NULL,NULL),('9924936e-bb76-477d-872c-b6d97707df40',NULL,'registration-user-creation','master','50f35df6-97c6-4ccd-8cdc-712c52170887',0,20,_binary '\0',NULL,NULL),('9ddeaaff-a4a9-461c-bb0a-e24d23a8ecfc',NULL,NULL,'master','cb234361-54f6-4f30-800c-9846bbd3b4d0',1,20,_binary '','791357e0-52c8-43fa-9a6c-ebe05abd003a',NULL),('a10c7c96-bafc-4c11-b229-0d87fd87cc26',NULL,'docker-http-basic-authenticator','animalia','e4127d6e-98d7-4866-b812-55e53568ed89',0,10,_binary '\0',NULL,NULL),('ab9aaa3d-3c55-4e5d-8323-e9dfd76c76ed',NULL,NULL,'master','f271262e-3f64-4496-8dea-f55de065f841',1,40,_binary '','562f2d4d-5a2a-4b27-8fa3-1dbc1d80d31b',NULL),('ac795821-f368-4b53-9095-288e5f6316ee',NULL,'registration-page-form','master','807bae13-3c27-4d62-9458-5c5a6e2d9fc7',0,10,_binary '','50f35df6-97c6-4ccd-8cdc-712c52170887',NULL),('b1769ada-2b2a-4fb0-9c5e-4773da610bc1',NULL,'basic-auth-otp','animalia','37be6a45-7870-4a79-9022-2010672407d9',3,20,_binary '\0',NULL,NULL),('b2a1d683-5b61-404e-bcd4-8a4df6e47aee',NULL,NULL,'animalia','b3ebaffb-6848-4cec-be4d-7c7d4072c6cc',2,20,_binary '','9b2f7cd4-6041-47a9-a9a4-cb09360e1418',NULL),('b3578e0a-8ac5-4c45-9d0d-4e430c13d65d',NULL,'direct-grant-validate-username','master','d2742d20-ce87-44f8-9710-2471ae07a594',0,10,_binary '\0',NULL,NULL),('b61c37e0-16c2-451f-b647-e3d09341a022',NULL,'client-x509','master','02dc6b1e-c677-477c-a39b-b0e06812641d',2,40,_binary '\0',NULL,NULL),('bdbe0fa7-a139-4f25-a840-6d33d7f75b81',NULL,NULL,'animalia','9b2f7cd4-6041-47a9-a9a4-cb09360e1418',1,20,_binary '','1cd0adf0-bf84-4fea-9111-8b8c7b3ee881',NULL),('bdbe3c0a-3e03-4331-a006-965d8ac04575',NULL,'registration-recaptcha-action','animalia','916d0797-dcbb-4926-a95c-ae86f183647b',3,60,_binary '\0',NULL,NULL),('be7adf35-375f-41ce-898e-04ef5c16b518',NULL,'reset-otp','master','562f2d4d-5a2a-4b27-8fa3-1dbc1d80d31b',0,20,_binary '\0',NULL,NULL),('c3a29db5-c4d0-4700-aea1-8b9380d4b77c',NULL,'auth-otp-form','animalia','1cd0adf0-bf84-4fea-9111-8b8c7b3ee881',0,20,_binary '\0',NULL,NULL),('c52620d5-6096-46ad-a3c1-fd3de549f7bb',NULL,NULL,'master','93e9ddbc-71ef-4d15-8795-e108b3e9a696',2,20,_binary '','45201917-8391-4083-84f4-d5326a2e40b7',NULL),('c555963a-554d-4588-81d4-fa618b757040',NULL,'conditional-user-configured','animalia','a7962e63-16d2-4eaa-ae64-d8d573152189',0,10,_binary '\0',NULL,NULL),('c96af254-218c-403d-8b25-64d627c8c96d',NULL,'reset-credentials-choose-user','animalia','3e2fffe9-3e91-4ecc-8704-49ea71e04def',0,10,_binary '\0',NULL,NULL),('c99a9376-3a17-4c3b-9395-b001bfc41a20',NULL,'idp-username-password-form','master','45201917-8391-4083-84f4-d5326a2e40b7',0,10,_binary '\0',NULL,NULL),('caee7769-5370-444e-b24b-878187bd2412',NULL,'client-x509','animalia','cfa1fc87-dec3-49b4-aee4-8a80d2a8a77b',2,40,_binary '\0',NULL,NULL),('cc076546-8803-43e4-ba43-dbad665e6cfe',NULL,NULL,'animalia','7319b48f-2c50-44d6-a4e5-49d421666180',0,20,_binary '','b3ebaffb-6848-4cec-be4d-7c7d4072c6cc',NULL),('cdf0b6c6-76d3-4ff5-b992-17e0a75b4e29',NULL,NULL,'master','cca95a72-6257-4d06-9a85-7ffed902b6ce',2,30,_binary '','cb234361-54f6-4f30-800c-9846bbd3b4d0',NULL),('d2a26b11-7f9f-4b11-81fa-e28a44dde816',NULL,'conditional-user-configured','master','562f2d4d-5a2a-4b27-8fa3-1dbc1d80d31b',0,10,_binary '\0',NULL,NULL),('d466821e-f2c2-4a7f-91ce-45595dd429f4',NULL,'idp-email-verification','master','93e9ddbc-71ef-4d15-8795-e108b3e9a696',2,10,_binary '\0',NULL,NULL),('d5ed3ce0-fa16-43bf-bdd9-ffe49ac3710e',NULL,'auth-spnego','animalia','37be6a45-7870-4a79-9022-2010672407d9',3,30,_binary '\0',NULL,NULL),('d638efe0-d97d-4568-862e-d4e57325e468',NULL,'registration-page-form','animalia','d1aac0fa-033b-4b20-971a-526c4cff3adf',0,10,_binary '','916d0797-dcbb-4926-a95c-ae86f183647b',NULL),('dbf6a9d9-8d11-4d4b-bc07-48390835fe9a',NULL,NULL,'master','de5f1f5b-f6c1-46ba-aef9-b32cbd46aeea',0,20,_binary '','93e9ddbc-71ef-4d15-8795-e108b3e9a696',NULL),('e200cb59-9ab7-4002-aa8e-e2566b1ad686',NULL,'direct-grant-validate-password','animalia','60f158e0-7d46-4c95-99f9-13bddad789a2',0,20,_binary '\0',NULL,NULL),('e411118f-c033-4df9-968a-7d40cdf017dd',NULL,'idp-create-user-if-unique','master','043d1348-9284-4b23-863e-8e10a00b8b4c',2,10,_binary '\0',NULL,'4ca0e8cb-7b07-434f-b011-378e5cd2c03e'),('e6a6703d-33a6-4169-ab75-f92a430af584',NULL,'idp-create-user-if-unique','animalia','9706eecd-f203-410f-b4fb-09841ce19ead',2,10,_binary '\0',NULL,'a6e83138-d1f2-461a-8302-5aa0ca3f9f60'),('e7b4bdb6-40ce-41bd-bd43-712425789b42',NULL,'client-secret','animalia','cfa1fc87-dec3-49b4-aee4-8a80d2a8a77b',2,10,_binary '\0',NULL,NULL),('e9cb6034-712e-4e04-894d-a5cc83e39418',NULL,NULL,'master','fa28220f-5408-4b6c-b581-3bfbecb91918',0,20,_binary '','8038fd8a-c679-46c9-9edc-d29c7c30a8ce',NULL),('eb0f37e2-48ae-4158-9e3e-65230003e686',NULL,'reset-credential-email','animalia','3e2fffe9-3e91-4ecc-8704-49ea71e04def',0,20,_binary '\0',NULL,NULL),('ecd557b4-67ae-4341-bd8d-28ea38b59712',NULL,'direct-grant-validate-otp','animalia','a7962e63-16d2-4eaa-ae64-d8d573152189',0,20,_binary '\0',NULL,NULL),('f822e540-4fc8-4c78-a1dc-6a7ec94a6dee',NULL,'idp-review-profile','master','245cb4f6-2512-4536-85dd-345bdb54b370',0,10,_binary '\0',NULL,'b53398e0-dfaf-4d8c-a3db-1e83a07a5236'),('fb1a8514-ba9e-4f3e-b696-cc8821004cc0',NULL,'client-jwt','master','02dc6b1e-c677-477c-a39b-b0e06812641d',2,20,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('0276924a-4da5-485b-8bbb-3dc51adce42a','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','animalia','basic-flow',_binary '\0',_binary ''),('02dc6b1e-c677-477c-a39b-b0e06812641d','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('043d1348-9284-4b23-863e-8e10a00b8b4c','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('1cd0adf0-bf84-4fea-9111-8b8c7b3ee881','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','animalia','basic-flow',_binary '\0',_binary ''),('245cb4f6-2512-4536-85dd-345bdb54b370','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('303df658-ad23-4d10-8ae9-643335765ec7','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','animalia','basic-flow',_binary '',_binary ''),('37be6a45-7870-4a79-9022-2010672407d9','Authentication Options','Authentication options.','animalia','basic-flow',_binary '\0',_binary ''),('3e021fdb-5cd4-4617-bb42-ef5d0f931659','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','animalia','basic-flow',_binary '\0',_binary ''),('3e2fffe9-3e91-4ecc-8704-49ea71e04def','reset credentials','Reset credentials for a user if they forgot their password or something','animalia','basic-flow',_binary '',_binary ''),('45101b20-dff5-4b04-a4f9-bf916c2e8546','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('45201917-8391-4083-84f4-d5326a2e40b7','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('50f35df6-97c6-4ccd-8cdc-712c52170887','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('562f2d4d-5a2a-4b27-8fa3-1dbc1d80d31b','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('60f158e0-7d46-4c95-99f9-13bddad789a2','direct grant','OpenID Connect Resource Owner Grant','animalia','basic-flow',_binary '',_binary ''),('7319b48f-2c50-44d6-a4e5-49d421666180','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','animalia','basic-flow',_binary '\0',_binary ''),('791357e0-52c8-43fa-9a6c-ebe05abd003a','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('8038fd8a-c679-46c9-9edc-d29c7c30a8ce','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('807bae13-3c27-4d62-9458-5c5a6e2d9fc7','registration','registration flow','master','basic-flow',_binary '',_binary ''),('916d0797-dcbb-4926-a95c-ae86f183647b','registration form','registration form','animalia','form-flow',_binary '\0',_binary ''),('93e9ddbc-71ef-4d15-8795-e108b3e9a696','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary ''),('9706eecd-f203-410f-b4fb-09841ce19ead','User creation or linking','Flow for the existing/non-existing user alternatives','animalia','basic-flow',_binary '\0',_binary ''),('9b2f7cd4-6041-47a9-a9a4-cb09360e1418','Verify Existing Account by Re-authentication','Reauthentication of existing account','animalia','basic-flow',_binary '\0',_binary ''),('9f5e8042-9125-4b51-aed0-089ee032b2d3','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('a7962e63-16d2-4eaa-ae64-d8d573152189','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','animalia','basic-flow',_binary '\0',_binary ''),('b0338680-2b60-4070-86e5-f935d6d6d893','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('b3ebaffb-6848-4cec-be4d-7c7d4072c6cc','Account verification options','Method with which to verity the existing account','animalia','basic-flow',_binary '\0',_binary ''),('be0f0915-9f81-4bc1-8b47-7baffa8f0db0','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','animalia','basic-flow',_binary '',_binary ''),('cb234361-54f6-4f30-800c-9846bbd3b4d0','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('cca95a72-6257-4d06-9a85-7ffed902b6ce','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('cd6975ee-80c0-49da-9321-5ff5d01a18f3','browser','browser based authentication','animalia','basic-flow',_binary '',_binary ''),('cfa1fc87-dec3-49b4-aee4-8a80d2a8a77b','clients','Base authentication for clients','animalia','client-flow',_binary '',_binary ''),('d1aac0fa-033b-4b20-971a-526c4cff3adf','registration','registration flow','animalia','basic-flow',_binary '',_binary ''),('d2742d20-ce87-44f8-9710-2471ae07a594','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('de5f1f5b-f6c1-46ba-aef9-b32cbd46aeea','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('e4127d6e-98d7-4866-b812-55e53568ed89','docker auth','Used by Docker clients to authenticate against the IDP','animalia','basic-flow',_binary '',_binary ''),('ec571d52-54aa-4952-b309-cfcd5a1c5c4b','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('ed852844-1ad2-4fd1-852b-8f48c861e344','saml ecp','SAML ECP Profile Authentication Flow','animalia','basic-flow',_binary '',_binary ''),('f271262e-3f64-4496-8dea-f55de065f841','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('fa28220f-5408-4b6c-b581-3bfbecb91918','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('fdb0151e-d931-494c-b51c-173349fadc17','forms','Username, password, otp and other auth forms.','animalia','basic-flow',_binary '\0',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('4ca0e8cb-7b07-434f-b011-378e5cd2c03e','create unique user config','master'),('6d8be1da-6ac9-463f-b723-2e494b642965','review profile config','animalia'),('a6e83138-d1f2-461a-8302-5aa0ca3f9f60','create unique user config','animalia'),('b53398e0-dfaf-4d8c-a3db-1e83a07a5236','review profile config','master');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('4ca0e8cb-7b07-434f-b011-378e5cd2c03e','false','require.password.update.after.registration'),('6d8be1da-6ac9-463f-b723-2e494b642965','missing','update.profile.on.first.login'),('a6e83138-d1f2-461a-8302-5aa0ca3f9f60','false','require.password.update.after.registration'),('b53398e0-dfaf-4d8c-a3db-1e83a07a5236','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('23478395-cce4-4706-9ce3-ea5f4fda8889',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','animalia','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('235384dd-3046-41c7-aea8-a4c31f40608b',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('2b7ebc48-9172-4263-808a-a4b8d7073916',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/animalia/account/',_binary '\0',NULL,_binary '\0','animalia','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('7dc046b3-5bea-4b84-b28a-1e7a34ddcde1',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('921e042b-0a48-44c5-aaee-a99354134698',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('96049ace-2779-4b7b-9108-60f8f945b911',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/animalia/account/',_binary '\0',NULL,_binary '\0','animalia','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('9e9d19f9-0037-4599-9ace-92253aee1e52',_binary '',_binary '\0','animalia-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','animalia Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('aa375dd6-5f93-44f1-963a-da1e3cdb732e',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','animalia','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('b3fe3662-b724-4172-9fc3-2aeb83ca7fb6',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('b7350a97-6be1-4c6a-aa01-1b040916ce0d',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('bf9de4ce-78f2-4209-8e2c-16e2970fab36',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','animalia','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('cac694e9-3144-4988-890c-9d0702b1496c',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('e885bd35-65c4-4a6e-a1f5-ea7f157de58d',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/animalia/console/',_binary '\0',NULL,_binary '\0','animalia','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c',_binary '',_binary '','animalia',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','animalia','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('921e042b-0a48-44c5-aaee-a99354134698','S256','pkce.code.challenge.method'),('96049ace-2779-4b7b-9108-60f8f945b911','S256','pkce.code.challenge.method'),('cac694e9-3144-4988-890c-9d0702b1496c','S256','pkce.code.challenge.method'),('e885bd35-65c4-4a6e-a1f5-ea7f157de58d','S256','pkce.code.challenge.method'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','false','backchannel.logout.revoke.offline.tokens'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','true','backchannel.logout.session.required'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','false','client_credentials.use_refresh_token'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','false','display.on.consent.screen'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','false','exclude.session.state.from.auth.response'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','false','id.token.as.detached.signature'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','keywind','login_theme'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','false','oauth2.device.authorization.grant.enabled'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','false','oidc.ciba.grant.enabled'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','false','require.pushed.authorization.requests'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','false','saml_force_name_id_format'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','false','saml.artifact.binding'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','false','saml.assertion.signature'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','false','saml.authnstatement'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','false','saml.client.signature'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','false','saml.encrypt'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','false','saml.force.post.binding'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','false','saml.multivalued.roles'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','false','saml.onetimeuse.condition'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','false','saml.server.signature'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','false','saml.server.signature.keyinfo.ext'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','false','tls.client.certificate.bound.access.tokens'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','true','use.refresh.tokens');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('05770ea4-1bd5-4987-a024-2dfc6a00c2a9','address','animalia','OpenID Connect built-in scope: address','openid-connect'),('0ea03a8a-790b-446b-a2a8-218126ea2173','web-origins','animalia','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('1460475d-4ec4-45ab-8833-b3122214d499','role_list','master','SAML role list','saml'),('1d6df13c-1ddb-46b9-8e94-a46b24f6f734','microprofile-jwt','animalia','Microprofile - JWT built-in scope','openid-connect'),('1f61c8b7-b44c-452d-9e1e-b149497a4f81','offline_access','animalia','OpenID Connect built-in scope: offline_access','openid-connect'),('420ddaab-3a63-4699-b9f4-8908005b4d2f','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('4377f50e-33a5-4fab-b9b9-52bb98f3d380','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('4a269588-bd90-4609-a2d4-ebdc434a900c','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('57a47430-5051-4d13-8a5f-ffa4cd948e03','phone','animalia','OpenID Connect built-in scope: phone','openid-connect'),('720ef35b-9640-4549-8cc5-effef481bc80','role_list','animalia','SAML role list','saml'),('782ddfc4-2284-4fd8-9f02-405aa63d24d2','profile','animalia','OpenID Connect built-in scope: profile','openid-connect'),('87f6652f-369b-414e-9875-a3eca71e5e43','email','master','OpenID Connect built-in scope: email','openid-connect'),('9ba43097-a075-47a6-ab4c-e001d0596740','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('b1c1b93a-b05d-40cf-8cc2-ee2d87751fd3','roles','animalia','OpenID Connect scope for add user roles to the access token','openid-connect'),('d25fefbb-d4b3-4b9d-ae35-6b87d829e60c','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('dc51d139-a633-4316-9fa7-470e066e3970','email','animalia','OpenID Connect built-in scope: email','openid-connect'),('e907b080-e7c8-4362-9b38-c56483fd53fc','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('f315d53e-ffc1-493f-b8f6-d5c4fc686904','address','master','OpenID Connect built-in scope: address','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('05770ea4-1bd5-4987-a024-2dfc6a00c2a9','${addressScopeConsentText}','consent.screen.text'),('05770ea4-1bd5-4987-a024-2dfc6a00c2a9','true','display.on.consent.screen'),('05770ea4-1bd5-4987-a024-2dfc6a00c2a9','true','include.in.token.scope'),('0ea03a8a-790b-446b-a2a8-218126ea2173','','consent.screen.text'),('0ea03a8a-790b-446b-a2a8-218126ea2173','false','display.on.consent.screen'),('0ea03a8a-790b-446b-a2a8-218126ea2173','false','include.in.token.scope'),('1460475d-4ec4-45ab-8833-b3122214d499','${samlRoleListScopeConsentText}','consent.screen.text'),('1460475d-4ec4-45ab-8833-b3122214d499','true','display.on.consent.screen'),('1d6df13c-1ddb-46b9-8e94-a46b24f6f734','false','display.on.consent.screen'),('1d6df13c-1ddb-46b9-8e94-a46b24f6f734','true','include.in.token.scope'),('1f61c8b7-b44c-452d-9e1e-b149497a4f81','${offlineAccessScopeConsentText}','consent.screen.text'),('1f61c8b7-b44c-452d-9e1e-b149497a4f81','true','display.on.consent.screen'),('420ddaab-3a63-4699-b9f4-8908005b4d2f','${profileScopeConsentText}','consent.screen.text'),('420ddaab-3a63-4699-b9f4-8908005b4d2f','true','display.on.consent.screen'),('420ddaab-3a63-4699-b9f4-8908005b4d2f','true','include.in.token.scope'),('4377f50e-33a5-4fab-b9b9-52bb98f3d380','','consent.screen.text'),('4377f50e-33a5-4fab-b9b9-52bb98f3d380','false','display.on.consent.screen'),('4377f50e-33a5-4fab-b9b9-52bb98f3d380','false','include.in.token.scope'),('4a269588-bd90-4609-a2d4-ebdc434a900c','${rolesScopeConsentText}','consent.screen.text'),('4a269588-bd90-4609-a2d4-ebdc434a900c','true','display.on.consent.screen'),('4a269588-bd90-4609-a2d4-ebdc434a900c','false','include.in.token.scope'),('57a47430-5051-4d13-8a5f-ffa4cd948e03','${phoneScopeConsentText}','consent.screen.text'),('57a47430-5051-4d13-8a5f-ffa4cd948e03','true','display.on.consent.screen'),('57a47430-5051-4d13-8a5f-ffa4cd948e03','true','include.in.token.scope'),('720ef35b-9640-4549-8cc5-effef481bc80','${samlRoleListScopeConsentText}','consent.screen.text'),('720ef35b-9640-4549-8cc5-effef481bc80','true','display.on.consent.screen'),('782ddfc4-2284-4fd8-9f02-405aa63d24d2','${profileScopeConsentText}','consent.screen.text'),('782ddfc4-2284-4fd8-9f02-405aa63d24d2','true','display.on.consent.screen'),('782ddfc4-2284-4fd8-9f02-405aa63d24d2','true','include.in.token.scope'),('87f6652f-369b-414e-9875-a3eca71e5e43','${emailScopeConsentText}','consent.screen.text'),('87f6652f-369b-414e-9875-a3eca71e5e43','true','display.on.consent.screen'),('87f6652f-369b-414e-9875-a3eca71e5e43','true','include.in.token.scope'),('9ba43097-a075-47a6-ab4c-e001d0596740','false','display.on.consent.screen'),('9ba43097-a075-47a6-ab4c-e001d0596740','true','include.in.token.scope'),('b1c1b93a-b05d-40cf-8cc2-ee2d87751fd3','${rolesScopeConsentText}','consent.screen.text'),('b1c1b93a-b05d-40cf-8cc2-ee2d87751fd3','true','display.on.consent.screen'),('b1c1b93a-b05d-40cf-8cc2-ee2d87751fd3','false','include.in.token.scope'),('d25fefbb-d4b3-4b9d-ae35-6b87d829e60c','${phoneScopeConsentText}','consent.screen.text'),('d25fefbb-d4b3-4b9d-ae35-6b87d829e60c','true','display.on.consent.screen'),('d25fefbb-d4b3-4b9d-ae35-6b87d829e60c','true','include.in.token.scope'),('dc51d139-a633-4316-9fa7-470e066e3970','${emailScopeConsentText}','consent.screen.text'),('dc51d139-a633-4316-9fa7-470e066e3970','true','display.on.consent.screen'),('dc51d139-a633-4316-9fa7-470e066e3970','true','include.in.token.scope'),('e907b080-e7c8-4362-9b38-c56483fd53fc','${offlineAccessScopeConsentText}','consent.screen.text'),('e907b080-e7c8-4362-9b38-c56483fd53fc','true','display.on.consent.screen'),('f315d53e-ffc1-493f-b8f6-d5c4fc686904','${addressScopeConsentText}','consent.screen.text'),('f315d53e-ffc1-493f-b8f6-d5c4fc686904','true','display.on.consent.screen'),('f315d53e-ffc1-493f-b8f6-d5c4fc686904','true','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('23478395-cce4-4706-9ce3-ea5f4fda8889','05770ea4-1bd5-4987-a024-2dfc6a00c2a9',_binary '\0'),('23478395-cce4-4706-9ce3-ea5f4fda8889','0ea03a8a-790b-446b-a2a8-218126ea2173',_binary ''),('23478395-cce4-4706-9ce3-ea5f4fda8889','1d6df13c-1ddb-46b9-8e94-a46b24f6f734',_binary '\0'),('23478395-cce4-4706-9ce3-ea5f4fda8889','1f61c8b7-b44c-452d-9e1e-b149497a4f81',_binary '\0'),('23478395-cce4-4706-9ce3-ea5f4fda8889','57a47430-5051-4d13-8a5f-ffa4cd948e03',_binary '\0'),('23478395-cce4-4706-9ce3-ea5f4fda8889','782ddfc4-2284-4fd8-9f02-405aa63d24d2',_binary ''),('23478395-cce4-4706-9ce3-ea5f4fda8889','b1c1b93a-b05d-40cf-8cc2-ee2d87751fd3',_binary ''),('23478395-cce4-4706-9ce3-ea5f4fda8889','dc51d139-a633-4316-9fa7-470e066e3970',_binary ''),('235384dd-3046-41c7-aea8-a4c31f40608b','420ddaab-3a63-4699-b9f4-8908005b4d2f',_binary ''),('235384dd-3046-41c7-aea8-a4c31f40608b','4377f50e-33a5-4fab-b9b9-52bb98f3d380',_binary ''),('235384dd-3046-41c7-aea8-a4c31f40608b','4a269588-bd90-4609-a2d4-ebdc434a900c',_binary ''),('235384dd-3046-41c7-aea8-a4c31f40608b','87f6652f-369b-414e-9875-a3eca71e5e43',_binary ''),('235384dd-3046-41c7-aea8-a4c31f40608b','9ba43097-a075-47a6-ab4c-e001d0596740',_binary '\0'),('235384dd-3046-41c7-aea8-a4c31f40608b','d25fefbb-d4b3-4b9d-ae35-6b87d829e60c',_binary '\0'),('235384dd-3046-41c7-aea8-a4c31f40608b','e907b080-e7c8-4362-9b38-c56483fd53fc',_binary '\0'),('235384dd-3046-41c7-aea8-a4c31f40608b','f315d53e-ffc1-493f-b8f6-d5c4fc686904',_binary '\0'),('2b7ebc48-9172-4263-808a-a4b8d7073916','05770ea4-1bd5-4987-a024-2dfc6a00c2a9',_binary '\0'),('2b7ebc48-9172-4263-808a-a4b8d7073916','0ea03a8a-790b-446b-a2a8-218126ea2173',_binary ''),('2b7ebc48-9172-4263-808a-a4b8d7073916','1d6df13c-1ddb-46b9-8e94-a46b24f6f734',_binary '\0'),('2b7ebc48-9172-4263-808a-a4b8d7073916','1f61c8b7-b44c-452d-9e1e-b149497a4f81',_binary '\0'),('2b7ebc48-9172-4263-808a-a4b8d7073916','57a47430-5051-4d13-8a5f-ffa4cd948e03',_binary '\0'),('2b7ebc48-9172-4263-808a-a4b8d7073916','782ddfc4-2284-4fd8-9f02-405aa63d24d2',_binary ''),('2b7ebc48-9172-4263-808a-a4b8d7073916','b1c1b93a-b05d-40cf-8cc2-ee2d87751fd3',_binary ''),('2b7ebc48-9172-4263-808a-a4b8d7073916','dc51d139-a633-4316-9fa7-470e066e3970',_binary ''),('7dc046b3-5bea-4b84-b28a-1e7a34ddcde1','420ddaab-3a63-4699-b9f4-8908005b4d2f',_binary ''),('7dc046b3-5bea-4b84-b28a-1e7a34ddcde1','4377f50e-33a5-4fab-b9b9-52bb98f3d380',_binary ''),('7dc046b3-5bea-4b84-b28a-1e7a34ddcde1','4a269588-bd90-4609-a2d4-ebdc434a900c',_binary ''),('7dc046b3-5bea-4b84-b28a-1e7a34ddcde1','87f6652f-369b-414e-9875-a3eca71e5e43',_binary ''),('7dc046b3-5bea-4b84-b28a-1e7a34ddcde1','9ba43097-a075-47a6-ab4c-e001d0596740',_binary '\0'),('7dc046b3-5bea-4b84-b28a-1e7a34ddcde1','d25fefbb-d4b3-4b9d-ae35-6b87d829e60c',_binary '\0'),('7dc046b3-5bea-4b84-b28a-1e7a34ddcde1','e907b080-e7c8-4362-9b38-c56483fd53fc',_binary '\0'),('7dc046b3-5bea-4b84-b28a-1e7a34ddcde1','f315d53e-ffc1-493f-b8f6-d5c4fc686904',_binary '\0'),('921e042b-0a48-44c5-aaee-a99354134698','420ddaab-3a63-4699-b9f4-8908005b4d2f',_binary ''),('921e042b-0a48-44c5-aaee-a99354134698','4377f50e-33a5-4fab-b9b9-52bb98f3d380',_binary ''),('921e042b-0a48-44c5-aaee-a99354134698','4a269588-bd90-4609-a2d4-ebdc434a900c',_binary ''),('921e042b-0a48-44c5-aaee-a99354134698','87f6652f-369b-414e-9875-a3eca71e5e43',_binary ''),('921e042b-0a48-44c5-aaee-a99354134698','9ba43097-a075-47a6-ab4c-e001d0596740',_binary '\0'),('921e042b-0a48-44c5-aaee-a99354134698','d25fefbb-d4b3-4b9d-ae35-6b87d829e60c',_binary '\0'),('921e042b-0a48-44c5-aaee-a99354134698','e907b080-e7c8-4362-9b38-c56483fd53fc',_binary '\0'),('921e042b-0a48-44c5-aaee-a99354134698','f315d53e-ffc1-493f-b8f6-d5c4fc686904',_binary '\0'),('96049ace-2779-4b7b-9108-60f8f945b911','05770ea4-1bd5-4987-a024-2dfc6a00c2a9',_binary '\0'),('96049ace-2779-4b7b-9108-60f8f945b911','0ea03a8a-790b-446b-a2a8-218126ea2173',_binary ''),('96049ace-2779-4b7b-9108-60f8f945b911','1d6df13c-1ddb-46b9-8e94-a46b24f6f734',_binary '\0'),('96049ace-2779-4b7b-9108-60f8f945b911','1f61c8b7-b44c-452d-9e1e-b149497a4f81',_binary '\0'),('96049ace-2779-4b7b-9108-60f8f945b911','57a47430-5051-4d13-8a5f-ffa4cd948e03',_binary '\0'),('96049ace-2779-4b7b-9108-60f8f945b911','782ddfc4-2284-4fd8-9f02-405aa63d24d2',_binary ''),('96049ace-2779-4b7b-9108-60f8f945b911','b1c1b93a-b05d-40cf-8cc2-ee2d87751fd3',_binary ''),('96049ace-2779-4b7b-9108-60f8f945b911','dc51d139-a633-4316-9fa7-470e066e3970',_binary ''),('aa375dd6-5f93-44f1-963a-da1e3cdb732e','05770ea4-1bd5-4987-a024-2dfc6a00c2a9',_binary '\0'),('aa375dd6-5f93-44f1-963a-da1e3cdb732e','0ea03a8a-790b-446b-a2a8-218126ea2173',_binary ''),('aa375dd6-5f93-44f1-963a-da1e3cdb732e','1d6df13c-1ddb-46b9-8e94-a46b24f6f734',_binary '\0'),('aa375dd6-5f93-44f1-963a-da1e3cdb732e','1f61c8b7-b44c-452d-9e1e-b149497a4f81',_binary '\0'),('aa375dd6-5f93-44f1-963a-da1e3cdb732e','57a47430-5051-4d13-8a5f-ffa4cd948e03',_binary '\0'),('aa375dd6-5f93-44f1-963a-da1e3cdb732e','782ddfc4-2284-4fd8-9f02-405aa63d24d2',_binary ''),('aa375dd6-5f93-44f1-963a-da1e3cdb732e','b1c1b93a-b05d-40cf-8cc2-ee2d87751fd3',_binary ''),('aa375dd6-5f93-44f1-963a-da1e3cdb732e','dc51d139-a633-4316-9fa7-470e066e3970',_binary ''),('b3fe3662-b724-4172-9fc3-2aeb83ca7fb6','420ddaab-3a63-4699-b9f4-8908005b4d2f',_binary ''),('b3fe3662-b724-4172-9fc3-2aeb83ca7fb6','4377f50e-33a5-4fab-b9b9-52bb98f3d380',_binary ''),('b3fe3662-b724-4172-9fc3-2aeb83ca7fb6','4a269588-bd90-4609-a2d4-ebdc434a900c',_binary ''),('b3fe3662-b724-4172-9fc3-2aeb83ca7fb6','87f6652f-369b-414e-9875-a3eca71e5e43',_binary ''),('b3fe3662-b724-4172-9fc3-2aeb83ca7fb6','9ba43097-a075-47a6-ab4c-e001d0596740',_binary '\0'),('b3fe3662-b724-4172-9fc3-2aeb83ca7fb6','d25fefbb-d4b3-4b9d-ae35-6b87d829e60c',_binary '\0'),('b3fe3662-b724-4172-9fc3-2aeb83ca7fb6','e907b080-e7c8-4362-9b38-c56483fd53fc',_binary '\0'),('b3fe3662-b724-4172-9fc3-2aeb83ca7fb6','f315d53e-ffc1-493f-b8f6-d5c4fc686904',_binary '\0'),('b7350a97-6be1-4c6a-aa01-1b040916ce0d','420ddaab-3a63-4699-b9f4-8908005b4d2f',_binary ''),('b7350a97-6be1-4c6a-aa01-1b040916ce0d','4377f50e-33a5-4fab-b9b9-52bb98f3d380',_binary ''),('b7350a97-6be1-4c6a-aa01-1b040916ce0d','4a269588-bd90-4609-a2d4-ebdc434a900c',_binary ''),('b7350a97-6be1-4c6a-aa01-1b040916ce0d','87f6652f-369b-414e-9875-a3eca71e5e43',_binary ''),('b7350a97-6be1-4c6a-aa01-1b040916ce0d','9ba43097-a075-47a6-ab4c-e001d0596740',_binary '\0'),('b7350a97-6be1-4c6a-aa01-1b040916ce0d','d25fefbb-d4b3-4b9d-ae35-6b87d829e60c',_binary '\0'),('b7350a97-6be1-4c6a-aa01-1b040916ce0d','e907b080-e7c8-4362-9b38-c56483fd53fc',_binary '\0'),('b7350a97-6be1-4c6a-aa01-1b040916ce0d','f315d53e-ffc1-493f-b8f6-d5c4fc686904',_binary '\0'),('bf9de4ce-78f2-4209-8e2c-16e2970fab36','05770ea4-1bd5-4987-a024-2dfc6a00c2a9',_binary '\0'),('bf9de4ce-78f2-4209-8e2c-16e2970fab36','0ea03a8a-790b-446b-a2a8-218126ea2173',_binary ''),('bf9de4ce-78f2-4209-8e2c-16e2970fab36','1d6df13c-1ddb-46b9-8e94-a46b24f6f734',_binary '\0'),('bf9de4ce-78f2-4209-8e2c-16e2970fab36','1f61c8b7-b44c-452d-9e1e-b149497a4f81',_binary '\0'),('bf9de4ce-78f2-4209-8e2c-16e2970fab36','57a47430-5051-4d13-8a5f-ffa4cd948e03',_binary '\0'),('bf9de4ce-78f2-4209-8e2c-16e2970fab36','782ddfc4-2284-4fd8-9f02-405aa63d24d2',_binary ''),('bf9de4ce-78f2-4209-8e2c-16e2970fab36','b1c1b93a-b05d-40cf-8cc2-ee2d87751fd3',_binary ''),('bf9de4ce-78f2-4209-8e2c-16e2970fab36','dc51d139-a633-4316-9fa7-470e066e3970',_binary ''),('cac694e9-3144-4988-890c-9d0702b1496c','420ddaab-3a63-4699-b9f4-8908005b4d2f',_binary ''),('cac694e9-3144-4988-890c-9d0702b1496c','4377f50e-33a5-4fab-b9b9-52bb98f3d380',_binary ''),('cac694e9-3144-4988-890c-9d0702b1496c','4a269588-bd90-4609-a2d4-ebdc434a900c',_binary ''),('cac694e9-3144-4988-890c-9d0702b1496c','87f6652f-369b-414e-9875-a3eca71e5e43',_binary ''),('cac694e9-3144-4988-890c-9d0702b1496c','9ba43097-a075-47a6-ab4c-e001d0596740',_binary '\0'),('cac694e9-3144-4988-890c-9d0702b1496c','d25fefbb-d4b3-4b9d-ae35-6b87d829e60c',_binary '\0'),('cac694e9-3144-4988-890c-9d0702b1496c','e907b080-e7c8-4362-9b38-c56483fd53fc',_binary '\0'),('cac694e9-3144-4988-890c-9d0702b1496c','f315d53e-ffc1-493f-b8f6-d5c4fc686904',_binary '\0'),('e885bd35-65c4-4a6e-a1f5-ea7f157de58d','05770ea4-1bd5-4987-a024-2dfc6a00c2a9',_binary '\0'),('e885bd35-65c4-4a6e-a1f5-ea7f157de58d','0ea03a8a-790b-446b-a2a8-218126ea2173',_binary ''),('e885bd35-65c4-4a6e-a1f5-ea7f157de58d','1d6df13c-1ddb-46b9-8e94-a46b24f6f734',_binary '\0'),('e885bd35-65c4-4a6e-a1f5-ea7f157de58d','1f61c8b7-b44c-452d-9e1e-b149497a4f81',_binary '\0'),('e885bd35-65c4-4a6e-a1f5-ea7f157de58d','57a47430-5051-4d13-8a5f-ffa4cd948e03',_binary '\0'),('e885bd35-65c4-4a6e-a1f5-ea7f157de58d','782ddfc4-2284-4fd8-9f02-405aa63d24d2',_binary ''),('e885bd35-65c4-4a6e-a1f5-ea7f157de58d','b1c1b93a-b05d-40cf-8cc2-ee2d87751fd3',_binary ''),('e885bd35-65c4-4a6e-a1f5-ea7f157de58d','dc51d139-a633-4316-9fa7-470e066e3970',_binary ''),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','05770ea4-1bd5-4987-a024-2dfc6a00c2a9',_binary '\0'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','0ea03a8a-790b-446b-a2a8-218126ea2173',_binary ''),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','1d6df13c-1ddb-46b9-8e94-a46b24f6f734',_binary '\0'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','1f61c8b7-b44c-452d-9e1e-b149497a4f81',_binary '\0'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','57a47430-5051-4d13-8a5f-ffa4cd948e03',_binary '\0'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','782ddfc4-2284-4fd8-9f02-405aa63d24d2',_binary ''),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','b1c1b93a-b05d-40cf-8cc2-ee2d87751fd3',_binary ''),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','dc51d139-a633-4316-9fa7-470e066e3970',_binary '');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('1f61c8b7-b44c-452d-9e1e-b149497a4f81','710651e5-0ebf-4afc-a282-a6a7bc5743f9'),('e907b080-e7c8-4362-9b38-c56483fd53fc','e87bb37c-5692-4625-9d94-ef386dd28978');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('07a59cff-68f0-41ae-b1f0-a56c2a0f9043','Allowed Client Scopes','animalia','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','animalia','anonymous'),('325c3781-1f60-453b-a84f-dd93d0f6e713','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('33302529-09b8-460c-a65b-4b7358699228','Allowed Protocol Mapper Types','animalia','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','animalia','authenticated'),('3747bea6-3802-4455-9e76-4492971438fe','Consent Required','animalia','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','animalia','anonymous'),('3bc0b86c-336a-47c0-8254-799ffdff41f8','Allowed Protocol Mapper Types','animalia','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','animalia','anonymous'),('47b2aa2c-4d42-4390-9385-8d222e145d46','rsa-generated','animalia','rsa-generated','org.keycloak.keys.KeyProvider','animalia',NULL),('4a8a2573-1022-431b-9ee2-628227cba901','rsa-enc-generated','master','rsa-enc-generated','org.keycloak.keys.KeyProvider','master',NULL),('52080504-841c-43ed-97ae-ccabe17255b3','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('5566a59c-a9c4-47f1-a12a-9a991cad1a7f','aes-generated','animalia','aes-generated','org.keycloak.keys.KeyProvider','animalia',NULL),('568d115d-3bbd-4a00-8bde-89a947e54d7b',NULL,'master','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','master',NULL),('5b193819-226b-4070-a38b-d21f990c3d40','Allowed Client Scopes','animalia','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','animalia','authenticated'),('6298b695-1beb-45c1-bac9-0cb4fa9dc7b9','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('6d278802-ec31-439d-b53c-02163bf700e6','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('7ccf17a8-45db-43cd-ac02-f6d9d494bed9','hmac-generated','animalia','hmac-generated','org.keycloak.keys.KeyProvider','animalia',NULL),('88baf686-1621-4838-aeeb-f17303b856da','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('88e8cb62-b630-4d6f-b590-d14f5ba0ffba','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL),('963e2cea-e425-4f06-9f34-06646daf368f','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('ad322e6d-9219-4393-863a-246c87d5ba4f','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('ae2c77eb-b661-43db-baeb-db5ed4adf189','Full Scope Disabled','animalia','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','animalia','anonymous'),('b7d964f2-9637-49b9-a5b2-f313465260ee','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('c3f8750d-b76a-4a7c-b7e4-145395b8cb6f','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('c6a931a2-6b3f-42c3-80ad-2823d1eb5773','Max Clients Limit','animalia','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','animalia','anonymous'),('cf5aa684-a2c5-401e-8890-a5289e23e497','Trusted Hosts','animalia','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','animalia','anonymous'),('da57e076-edde-4470-b188-e1ba460cdaff','rsa-enc-generated','animalia','rsa-enc-generated','org.keycloak.keys.KeyProvider','animalia',NULL),('f2002fa1-8bf6-449b-98e3-d3536f0e19cd','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('030e2ce1-3a35-4e4e-a5cb-170d0d280a40','3bc0b86c-336a-47c0-8254-799ffdff41f8','allowed-protocol-mapper-types','saml-role-list-mapper'),('03eee98c-c498-4c07-b42e-ed893d082e08','b7d964f2-9637-49b9-a5b2-f313465260ee','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('04b59cc3-0d72-4cbe-821f-640dbed57abe','4a8a2573-1022-431b-9ee2-628227cba901','privateKey','MIIEogIBAAKCAQEAgxgQePvKEGS8fiXrlB9kc9uH10Fcz1JWKJcL8DvR2lLUGa9nwy3udaoq3NPGXKNglLHPVWHp2kZmEfSporktOEvBuq6Qneb38YwD5DIkMNDFr0T9WLNLwHq076PNBRK+vqjjl2MqBJH8HrkHWOA2DyQKYtcWf7kRpP479MOL9n804gCz11jnrAC9Vb0IWKdmqlm0yrNjvAih1mVBougR6ciY+DsVGBev1lrihaFODfKs6AShVg73J/0nGbarsMO3whCtN/LF9jJxdiILurJo/FHoa37dlo3LqIDHcDigmtsRz+BBmuB3N7V7OG1onGPa6FoV9mRsThut54mgKzjukQIDAQABAoIBAEntYiy34WWJSXriK42mfmGPpXVQWORZjFjrhUH+mgNCvnWVozBAUL9uLSnHC4/mWmrAMyn1Q4liNeFeVeN8BfI/VorOMqO5Qo2m5fLkC+CzeyeyAiTpR4jOKgcSGmYIAiVG3MHcnC9jnAg/U9Nc7V9wdaLzpK52UWr4LBuFwwJINzccZy3yZCqyi8x0X5KtDIarxTuyoXIti+zcWOni2jReYuBsJysMCWZEafLsJAXOOiW7L/qmmpEVkTNVo9OS7tE1NcV0MiK+3sTwBDiSgopEG266v2cR6N9rx9BkhCM3v5CwziUJIx+M9fh2hN0ue9pQEnRjgrQCFoesGuKfwzkCgYEA8yhdnNeJv5k62+5T0xyFf3ynnvkGfbxPSbsx9u77VvSH6ofM51HpQA9x7V6i8wmTtq01ZHChLhLfYRKLDempkNrC7ConU2IOfN2Ldz5JXnxIqnEzDiQ+/bWlbG1/XIsEjfuMlQA8bGueJNTS1r+GiPPu8s1jSuhrII6Tq8Gm/X8CgYEAigSINkAe090kEULWHFGkiKhW1RzcD9hNwbWKgGXK0O9nAW4muZcAbQSddEb3jADu+9rEcq1GvNoZZNM9zEojQ9CgELGEMAweg61OxNvJe1iMiM8SX19Y2UWLVCpwh+6sXfNiTD1iMfFQqrSy/ALFu/Tq8evh+ubJGNAf7VsaO+8CgYAjbshlaIssHloTXmFcrBVQBIwwgD1P6TbsmZioUR7TBwMfS/ax5p/Es/t4CYhZPhYGUqsrHbZ/DkT60kbtGhWZhCdPXr0oS2utCmOeVrc+S4ITRDeaYfHD6spWSIZ8p81cG0HbHJOxgOUknNa0cGhcYJ97Ri6n5cJmliAysR9yZQKBgDGe04H9p5ewJ+l0yBnCWI8xRpa0G4Iu2DXOmQ70ieh4SeY/vfh3i5WmVR2a7iENrN4rlvlLxuTa3MpdEBjEhs040nNt/wJvOQFKa8lm45dPDKebGxXi58SltiP6Zh7Y9muIt0yFvSoLgl79PGRSctjSgy2bCtHz61TabsAdQt9NAoGAP9J2pW1mO1sbZdRJUXs8KT7a5AspiGDkSbvdVS62ykPmZ6Zs3xcdPSKlt+1uyUzAiBKuFGmQLgUzOZX5EfHsWsd/9M6+s/Tr+NSg4HMCQeWgAh/Bu/StR1WGuUimdHLI5DXzUBsP9KB3V6j7Glgv/fsfX4LOrr+tdANkBgUT0aY='),('06a36870-b554-42d5-8048-8a5de0c79923','07a59cff-68f0-41ae-b1f0-a56c2a0f9043','allow-default-scopes','true'),('0822dbac-42b8-4ded-b75c-ea4eefc1c4d9','b7d964f2-9637-49b9-a5b2-f313465260ee','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('0a5d486c-e16a-4515-ab22-af84bee6f34d','88e8cb62-b630-4d6f-b590-d14f5ba0ffba','secret','pae9n8kJBVTvbNw_easxyQ'),('0cff68d5-7dfd-45f3-a3fc-429f6fa0c719','3bc0b86c-336a-47c0-8254-799ffdff41f8','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('0dda38e6-fa63-4747-a199-fce2ec4eaa93','963e2cea-e425-4f06-9f34-06646daf368f','allowed-protocol-mapper-types','saml-role-list-mapper'),('10a5d1c9-c3b1-4448-96f5-d5fa8629333a','325c3781-1f60-453b-a84f-dd93d0f6e713','certificate','MIICmzCCAYMCBgGNhFl4zjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwMjA3MTYxMjUyWhcNMzQwMjA3MTYxNDMyWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCAi2m+Cu6kZoECgvgc2T8MTqlVF7GD234jlveoTB1RAqHaaQk1LtGJVP6X0vCC7xYwkXTojrA6TwKt3vQN2TQ3EiahyWyPBZcbcl32UKXxpPAJT18vQqt7lEtkuFg+D4vEs6hbC51RPOayTvEkEeB2aCTZcb1ncSMfd46XRc+CUskNaVjDso5sS0svhpS06HwxAPpN979FfGZ7bs6M9hKX7n+IKFmTjz/+nMI6EteIedYWtzImgZ1iAmMWYWI5Br1lUHDSo5TvN/hwPQ8BpYAZdobd+kyQyVZRqTq/zEix4K1ESS9OhZpQyiOXEECJqLesdC7mT78vi8hDRnlCqgUZAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAA95vioqp+WiL5HQc61S5bbznCRdlo9czX1H8QUfaQJLMVnnk1XBWJkJymCv7iv1lt96C/KpdkVI92WkMG0oxkoYlXOt9Q7yoUNxAxfVhuoAjzbSa6Qbbm2/D9t0zR+7co5JwbHs3ghqbcYDhztOPQWPRovtnz6bTOBNXJcf06wDunWA/K5SzgDzxAKiqfGVAzhfC/Zmb7qn75+M+T3SRDyOeuQs/5khKbOfHyHqpX0K/JJ/wU4u3hoa+/1PXBL1zXRkpdMmlPpk3A6P+tRvrPN1A1C29UTzO+KpI/KGK6BipJXWne52RHBb/xs5af3g2Pfq3558IqpTKOjbv5h7cxY='),('16b9af97-12f3-4f7d-a2b8-2dfdce781cee','325c3781-1f60-453b-a84f-dd93d0f6e713','privateKey','MIIEpAIBAAKCAQEAgItpvgrupGaBAoL4HNk/DE6pVRexg9t+I5b3qEwdUQKh2mkJNS7RiVT+l9Lwgu8WMJF06I6wOk8Crd70Ddk0NxImoclsjwWXG3Jd9lCl8aTwCU9fL0Kre5RLZLhYPg+LxLOoWwudUTzmsk7xJBHgdmgk2XG9Z3EjH3eOl0XPglLJDWlYw7KObEtLL4aUtOh8MQD6Tfe/RXxme27OjPYSl+5/iChZk48//pzCOhLXiHnWFrcyJoGdYgJjFmFiOQa9ZVBw0qOU7zf4cD0PAaWAGXaG3fpMkMlWUak6v8xIseCtREkvToWaUMojlxBAiai3rHQu5k+/L4vIQ0Z5QqoFGQIDAQABAoIBAFlontQgpnyTD4i/r/Pg54mX7Q/SuxYLxWDb0MauqnV+bzWLeWwUdIohJDRV9BQeWEDP65EWLl1gN2zYdshrG3ZymYxOncOdD813bwO0dLfvEUZofrxQkxYRv57+2eHQzlay35b0LSgkRBIh9ngwNwAkz/yusB8TAmsQrY1qcTsjcK3yorgG9h9QR+f4EMcMbkvXv84z/HCi4d5PH0IrspO8GHTgg+Z49imjgYSD1jm/mGFVrB/0pf/E+ntCHx5LVBHmBxz9bHbk8dnsOe09xejGfQDRli9vT/LJLy/nEDnUGOr3c/yX3yBQWLNRqHF9tE1LwIcfoJnk3/ptOvCJqkECgYEA+RoMcxEl0z3vhmHRpwCz3pe0emZ4ypFZNvVsJpU/J1HWETV62YCxxuQfW8WHCBdinaqwp37p3GvUrnywYwYQ/ixWezzezGDyYMxXfEO/KRlwmbTvUImWjNgDPxdurPQRFLlSNEic1duqpe6Cp1qjKNkWZe3WdhF8vPKQDU/GkhsCgYEAhBqzg8jHmOkiIWYaU7IQjaXYQBKyBjMbn6g9b4ffPN3Hq/VyU2A/tGTWHYlz2SjnUK2KpPNtTujRdJ8aEfoFumLK6foFyUAW0WyOZCSm4j2BRDCZRvZdStsuSJ0COVgRzewv3YcOQu3NfdFKI+dfM6ZZH+9lvlN+DQbG1c/RmNsCgYEAupOPJZR/b1Rhlpan0F1PW/bm4BLmgFsTpn12TwPUdJ/wJZ2X8VdaUK1G65bsh9v0KkHR5PLDOSyu9S5Bczn0+lu9Prsd6Zjnkicbk+CuSptaYlZKNVmIoN+ett/XLsX0EUCpWK3Wgrvwei5GQBE8SfkntJrK2k5IzsEjskTBZ2cCgYBNPpOzPka/uapUXzCLufYF7XCaXpQsHdxMKgLqYUd+fqwPd7DG4eO+JqwwjzvnQgyn1yHXu+Mxnd9D0vhahJiu2K+PyrtxZwEwqcpE8k2GwrIAXm5x2QLKD4lruisfvsiCYVXHsf370rMym5s/jT3UpLM+giw68vUkxs6jHSaQuwKBgQCLspud9XLltz1ud3itPalvbFJCN4s+okJ5CnBSCEHwKEOvebJHb3+V98X9CT8k519/dWp+q5cmTl2hkuUBIF69hvga3BZziz3vPhlLSIabF+avwfBlH0E7knOaWM1g20bJQWbEqgH3SPNxX+GmpFWHsO9HAAgIDaeGg1dFpdheoA=='),('19287b7e-df5e-4472-bd29-03510ac1e5c7','da57e076-edde-4470-b188-e1ba460cdaff','keyUse','ENC'),('19af077c-4499-45f3-8644-54bc29a0b1d3','b7d964f2-9637-49b9-a5b2-f313465260ee','allowed-protocol-mapper-types','saml-role-list-mapper'),('1e0922f0-d0a1-477b-a9c4-a4021a6b6e03','88baf686-1621-4838-aeeb-f17303b856da','client-uris-must-match','true'),('23e781fa-7386-46ff-aad0-6f686533528e','963e2cea-e425-4f06-9f34-06646daf368f','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('2518d10f-63a2-4480-81a1-c837e6b2c041','b7d964f2-9637-49b9-a5b2-f313465260ee','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('26e33c7f-bee2-432b-95a3-0db2526ce959','c3f8750d-b76a-4a7c-b7e4-145395b8cb6f','max-clients','200'),('3102e959-577a-4887-937a-d9b8fc097a23','3bc0b86c-336a-47c0-8254-799ffdff41f8','allowed-protocol-mapper-types','oidc-address-mapper'),('3331a2a1-6caf-4d89-8ac8-2f706b8f0fc0','da57e076-edde-4470-b188-e1ba460cdaff','certificate','MIICnzCCAYcCBgGNhFuf3TANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhhbmltYWxpYTAeFw0yNDAyMDcxNjE1MTNaFw0zNDAyMDcxNjE2NTNaMBMxETAPBgNVBAMMCGFuaW1hbGlhMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlf20zcNq1vlBGnIMD0wrV3Gy02E2CpQCLnWBBJwtCZtcD0se5Ug6wFwiM78cxqTy0i01ZTCwMplyXiDrvK7pvPeX3CR2WIoQUh49aID2H5KUqePiiGC3eCjZxq2et9AuhoKN8H1vUxXoy8KOQBZjXSYCJbV5GZY3lV5SLpYBgMREVbagFFbHSFachWMory0ndu6gvTpaeG5i0soBkSFTCD0+bNAc8F2kj5YFA8xuZePo17LG2hpxYEjjnv+csA0hJ+RqMC1/iCI1RH3wNAMqzfbHwlcZ6MQojj8b4P+a2mctJE6jsEDnLUpwo0Fqg1AjLLrw+ndWfcCN4mQ8/j5HAwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQA1XgqZPlfR+XZOAM7PNd+MJRNTmjfPx3QcOIldqUTF51W8Hqrqr27tM26A2da0R73MDd1CIjJ56Z7zYO7ow/+NV/LRlpzx4Ywno00F5AZ0l9Q2vHltBUwwE4SgP1PEi5/tyY2nZVXuD4LHKYmwAHsx8OSsDn9V2YewD5XE9Ds+/aN+ik079qOmpp/CNjMP7HAFHPHBer/ZnSPGFUKUa7WDI7BgbzqmWgILP5oBTuKiGIHqarzyeRdLvtLh7BqyOybuDAv8fEl1umJcN6h1TfL+u51jB0n5+ZWPnB+tCEKvviYBAw/tZ3a0Yy9HWH8cheVsMlhtfUymWlZSVHqXFurT'),('3507f57a-795e-4cb8-ba81-9e042be1e431','33302529-09b8-460c-a65b-4b7358699228','allowed-protocol-mapper-types','oidc-address-mapper'),('3f59398e-18ae-4aa3-a19b-792100e80148','4a8a2573-1022-431b-9ee2-628227cba901','certificate','MIICmzCCAYMCBgGNhFl6ADANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwMjA3MTYxMjUyWhcNMzQwMjA3MTYxNDMyWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCDGBB4+8oQZLx+JeuUH2Rz24fXQVzPUlYolwvwO9HaUtQZr2fDLe51qirc08Zco2CUsc9VYenaRmYR9KmiuS04S8G6rpCd5vfxjAPkMiQw0MWvRP1Ys0vAerTvo80FEr6+qOOXYyoEkfweuQdY4DYPJApi1xZ/uRGk/jv0w4v2fzTiALPXWOesAL1VvQhYp2aqWbTKs2O8CKHWZUGi6BHpyJj4OxUYF6/WWuKFoU4N8qzoBKFWDvcn/ScZtquww7fCEK038sX2MnF2Igu6smj8Uehrft2WjcuogMdwOKCa2xHP4EGa4Hc3tXs4bWicY9roWhX2ZGxOG63niaArOO6RAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGdU+2u4J2dwtj0FDs25P3RV43rB8hy7dEW7WlnTK+qRhInnJPpiHRvGOJGV1N604WjlbrISjKRbVOxPIB36PXbujClG0RU8JVryU0UNrDQP+gT72zXX+Vf5eaYDoX7gsjvGRKfPhP/c7SZmsw4EOS9aQq+2lDR6tcWcTmxuv0DtBCGE33Jb+6MglrP7I5k6FP4CjfcGsGVBkB5jKzsQZgDRtl+kmlFm8UvS9H986e4FxJ+Bbkjj9bzCWTEzSds+L9NaFJ1+2r8AMwYSkBQzt5IT/hjKV4i8QQm6reW1TRxQrbd7Qzn6Q8Vbigq0TLvAdLew7ocCuPWkfX7xbnVIE8o='),('42cea0c5-7ef4-44f7-a66a-22311bfe3d07','963e2cea-e425-4f06-9f34-06646daf368f','allowed-protocol-mapper-types','oidc-address-mapper'),('43e7e7f2-02ef-4a14-b7ff-12795501ce04','b7d964f2-9637-49b9-a5b2-f313465260ee','allowed-protocol-mapper-types','oidc-full-name-mapper'),('45a5a02e-730e-43d7-a1f4-af2d0d99e45a','963e2cea-e425-4f06-9f34-06646daf368f','allowed-protocol-mapper-types','saml-user-property-mapper'),('46b8200e-9ad1-4fc0-8450-c7d16459bf42','4a8a2573-1022-431b-9ee2-628227cba901','priority','100'),('486f1e29-0f88-421f-ab49-919732adeeba','963e2cea-e425-4f06-9f34-06646daf368f','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('519cbd32-3bba-4b37-9669-7658bbcaa0a5','4a8a2573-1022-431b-9ee2-628227cba901','algorithm','RSA-OAEP'),('5a2d4b49-c329-4721-9f58-0235f2e672d3','325c3781-1f60-453b-a84f-dd93d0f6e713','priority','100'),('5d794a8a-d1a0-41a8-8b2b-2124edd43dfe','b7d964f2-9637-49b9-a5b2-f313465260ee','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('5d8d13a3-4f0b-4e1d-876b-975980acee5c','963e2cea-e425-4f06-9f34-06646daf368f','allowed-protocol-mapper-types','oidc-full-name-mapper'),('5e8a95c0-ee68-4bb0-afbe-955b5ece6381','33302529-09b8-460c-a65b-4b7358699228','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('5f758b3a-57ae-4ffe-ab34-b0c291da5d3f','6d278802-ec31-439d-b53c-02163bf700e6','kid','c0157c86-4c52-460f-b4c3-35e5c2677e0a'),('69c387d5-d21c-4fff-b1fd-37bbcdfcbaa5','c6a931a2-6b3f-42c3-80ad-2823d1eb5773','max-clients','200'),('6beac255-8504-41af-b093-572ec36629ee','3bc0b86c-336a-47c0-8254-799ffdff41f8','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('6dc8a4ef-6267-431c-915a-45922a70f0e3','da57e076-edde-4470-b188-e1ba460cdaff','privateKey','MIIEpAIBAAKCAQEAlf20zcNq1vlBGnIMD0wrV3Gy02E2CpQCLnWBBJwtCZtcD0se5Ug6wFwiM78cxqTy0i01ZTCwMplyXiDrvK7pvPeX3CR2WIoQUh49aID2H5KUqePiiGC3eCjZxq2et9AuhoKN8H1vUxXoy8KOQBZjXSYCJbV5GZY3lV5SLpYBgMREVbagFFbHSFachWMory0ndu6gvTpaeG5i0soBkSFTCD0+bNAc8F2kj5YFA8xuZePo17LG2hpxYEjjnv+csA0hJ+RqMC1/iCI1RH3wNAMqzfbHwlcZ6MQojj8b4P+a2mctJE6jsEDnLUpwo0Fqg1AjLLrw+ndWfcCN4mQ8/j5HAwIDAQABAoIBAEUx5+lND8rg7nHez0V3ZD9RCqiNnjq/EUqRltWjnvthmtTLWRN5gPEhD/5DWmkhy4u+o3VtQrv1IlfeZCKFpvswVfSPNbGe7+ySWs4NQH5MRx0hLm6v/7QFVIJdsm0mM3CGZijeFS+FWgI2XR2ftnNQh4kR8S4mqLnV65/mQAdAzUhT+nyoNwglP+RHfDS5xUlcSVu1/BnudF7W4XrrlxvLycvrTd0+Ez06FavyM3AVrcjM6g/jEnzw7KuFVhBn9dt008C+ci0E927lsEcItynjaTFv1O4llPhwVHRUrJ0qI8EmRxCLqCsH4OoziOm3EeaZWRjknEA3kq+rf6LovmECgYEA5CXC0oyGMYbP79IRE6SGvr8zDOjMqa7uBpEdWfRvjEQov3vzh/4N2AXWo5JEjhe0qeMxE0GF90qXEtAnq1VHktpPju5KS12vApsQGg/fVdxcs0r8pRuzE2MY2qgmwuZbhjKK5phSLPhszZ9puoqJmuM0pmokRSyqJ6fhFXd8drsCgYEAqE1XEQJqSSy8iw4yZLvjND6rydE3arZpU6jlowqbkzA7zfFx7gA3LAm+rcAbuGNgj33swTAM2D2qSHbESQbtq/GJR6jDbT1oNBo4hDj2Cf6i+nbnhKbopoA8E2zk9fIgIptQNYrLLPdgPJgRK7xru4ALGEQau8pF16VVhYbbAFkCgYEAvRv7wDCQ7y6S33Pdic2fjy7HLxUsyB3i2PiiPrUZXUgGCqrAs2HHsd8tCgqs3qcRrpxOSmrOk6t1TDfUGfWnTTe+KHimhpASB/PmReQQOIhfIpKulmE+b3x91oj5ECaHiNYOQpPR0crdzRctOV2qMAPS2XoztE8Qf6xtKzEOrw8CgYBCpLVoT9uEdEmIiqubxeaXBoYB2W2nPOoCLawY3pdyNjRIPWZOxxkRwB4YMS0I25kd2NBKQ1uiuPBX12esPykX4AHrNUGFXT6I+yUL/n42wPUKVtEgbvNLExY23vTfCux8p6GgQgBoIuChvdl2xxql2XMLPdSULelwFdECmb7YqQKBgQDKO1gs8mPtVqMQLSAgh8+2UJyAsNrJ2spdjZD9GalUSLu5wt37i5pFummBEfSmgrxoaAgbNuBkows/mp/R5IdHgDBsI+8oCsL2CcdeFd2xF01/ZKKtfiqr35dRnn7Iphxh3dghcM28GKHwBmjQjG9cfCr4q2pmy7/qYddb04zZMw=='),('6e26bc4c-6936-42ab-8408-3b0d7d368f70','33302529-09b8-460c-a65b-4b7358699228','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('731fbec0-f2c1-4bd5-9585-acb51df0e2b9','3bc0b86c-336a-47c0-8254-799ffdff41f8','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('7498f45a-cf5e-4f2f-9576-cbfa9be21094','f2002fa1-8bf6-449b-98e3-d3536f0e19cd','allow-default-scopes','true'),('7ad0b8b6-39e8-4f59-af46-1b91af5dff70','b7d964f2-9637-49b9-a5b2-f313465260ee','allowed-protocol-mapper-types','saml-user-property-mapper'),('7b2c5ffd-434a-4550-bf7b-d0d1e510e945','cf5aa684-a2c5-401e-8890-a5289e23e497','host-sending-registration-request-must-match','true'),('7ba6a15e-21df-4b70-a3b7-3c01b8878e6a','33302529-09b8-460c-a65b-4b7358699228','allowed-protocol-mapper-types','oidc-full-name-mapper'),('7f65752e-f0f9-40f2-a03e-937e319e0cf3','963e2cea-e425-4f06-9f34-06646daf368f','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('870c8b6c-71b6-4a37-9ce7-6185fdd59293','33302529-09b8-460c-a65b-4b7358699228','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('874a33ab-f426-4a0e-be06-ccad1aa561d3','5566a59c-a9c4-47f1-a12a-9a991cad1a7f','secret','k8LR6JmBMkiD-2o_4BvdnA'),('88dd4eb1-0933-428c-ad4e-c8157f472008','da57e076-edde-4470-b188-e1ba460cdaff','priority','100'),('9016248a-0069-4726-84ed-120de280cc42','7ccf17a8-45db-43cd-ac02-f6d9d494bed9','priority','100'),('94c4be0c-b9e9-4b9b-8d2f-cff475083cd6','da57e076-edde-4470-b188-e1ba460cdaff','algorithm','RSA-OAEP'),('991fd276-c951-4b63-9b13-48128ae2613d','963e2cea-e425-4f06-9f34-06646daf368f','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('99bb14a8-fb23-4bf7-8e70-49f173fb9a3b','7ccf17a8-45db-43cd-ac02-f6d9d494bed9','kid','0e02cd43-9ae5-4eab-8692-49c2527aef5d'),('9a4e5aa7-3fe5-4883-acb5-6193cf43393c','5566a59c-a9c4-47f1-a12a-9a991cad1a7f','kid','48138b6e-d2e1-48f6-ad85-7d00eb8ddf82'),('9a7d000b-039b-4ce2-bdfb-779d27fec110','5566a59c-a9c4-47f1-a12a-9a991cad1a7f','priority','100'),('9afe37c8-b5d1-48ed-acee-246612a9b02c','47b2aa2c-4d42-4390-9385-8d222e145d46','priority','100'),('9d7eb696-1638-40aa-bacd-7282c377dd78','47b2aa2c-4d42-4390-9385-8d222e145d46','certificate','MIICnzCCAYcCBgGNhFufbDANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhhbmltYWxpYTAeFw0yNDAyMDcxNjE1MTNaFw0zNDAyMDcxNjE2NTNaMBMxETAPBgNVBAMMCGFuaW1hbGlhMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiNZSRuFPxcb+ljXtRDiBdKsou8xHqXeMwhBSBlbjfRLY05dHiUbyF1kCLkcy7YSI/hNk9Qcbb9UVmMWjsAUkbrz+lC0KolyhcEUH1YmCuvxmoZ9BhLUNiUYlT0ooqzgAG7sEfjXcsAwb6rXwIishvXCLqC7bSU7Of0lp2aaFHfdbB1SVS50yc3Rz8ywu1QQk47XGD0GYIv3hSYLLw+VaedIx/3+GQgE3wGZKSqD6ks07lJkH1qzSCPL/LVv0avZ1TNwGO+mrGmyTa2vur15Xm+j4IA+Cg2WVG/cOoyJpCVhzl1FZMlO0g9F55l8q/aqpE5+AYVIggtw4ijYxDTGtmQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAAA6ZegT+2iU1KwgEBWLs63AAYLyt6m6wJFIMAuFTYwggXedxBDwlPwhPBjquA2mL2HKxF8j1Nr1YsirA1U9WcBcfbPg5jSIz8epL+GU4XL2g4UK9VaF5/ty4ke2nMPm4f2KXp5okKhKLFDX+4p3FIiI/qfdxNIG8raO4Akmu8YzhwERbx8wqvJJg7sujPdTCeTBAfDnaJmlyMuNe0cOCLMFQC8HljhAudDqhHrE28JkXsPXT0+GTc1uzfvVH5Ul5MwkK0brtqn2g05Q/afG6wqvXgM8qAt1C9ZHLu5dsGkgRnRNiTog596pTGLsWwR76Hzk1UeVjT1vjscCgfvhJ8'),('a90c6358-a69f-4808-82e9-d69fd0c4c704','33302529-09b8-460c-a65b-4b7358699228','allowed-protocol-mapper-types','saml-user-property-mapper'),('aa03eb2c-690e-490c-a269-1c74c1558ca1','88baf686-1621-4838-aeeb-f17303b856da','host-sending-registration-request-must-match','true'),('adc91e80-b1b0-439f-a1fc-d9b72601aba3','7ccf17a8-45db-43cd-ac02-f6d9d494bed9','secret','a0Iv4fg6wYfrv-K2PVRbzUBebzDhigl57fIAKKFiQbL_RKSH6bQ5lrvVk4cBspg_baXPJ5DajHGSK2Hw0FhB3A'),('b1568aff-902d-4213-906d-c670a2049236','47b2aa2c-4d42-4390-9385-8d222e145d46','keyUse','SIG'),('b8ff9937-2d73-4b99-8bdf-09a64d23714f','88e8cb62-b630-4d6f-b590-d14f5ba0ffba','kid','c03d8430-e77b-4baa-a919-56cae73f7f77'),('ba19c967-1a62-4df6-b85f-7c9b13d29544','33302529-09b8-460c-a65b-4b7358699228','allowed-protocol-mapper-types','saml-role-list-mapper'),('bae625f2-eee7-4905-8eb4-3724e52d1732','6d278802-ec31-439d-b53c-02163bf700e6','priority','100'),('bb90185f-4d6c-4fb7-91b0-9a886f5eae44','3bc0b86c-336a-47c0-8254-799ffdff41f8','allowed-protocol-mapper-types','saml-user-property-mapper'),('c1fb8bb1-2214-4d0c-bd11-c6fc4b06d201','7ccf17a8-45db-43cd-ac02-f6d9d494bed9','algorithm','HS256'),('c25b5539-7bc2-4313-893c-a651f937cc10','6d278802-ec31-439d-b53c-02163bf700e6','algorithm','HS256'),('cb3b9228-eb06-4d3b-8c05-29397adf2b63','6298b695-1beb-45c1-bac9-0cb4fa9dc7b9','allow-default-scopes','true'),('ce121c64-8b26-430d-951d-a9115c56cea5','3bc0b86c-336a-47c0-8254-799ffdff41f8','allowed-protocol-mapper-types','oidc-full-name-mapper'),('cf0faa2b-df72-4b95-a39e-a8c3e4eb8f06','33302529-09b8-460c-a65b-4b7358699228','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('d5bfd5e1-8338-417b-8017-7c8a00fe79c5','4a8a2573-1022-431b-9ee2-628227cba901','keyUse','ENC'),('dbe02a97-dfc7-4aa4-a5ef-d5695998800e','6d278802-ec31-439d-b53c-02163bf700e6','secret','b-z8R67DA80APisZd54SWut0A6KQQOhtOaC1mI_FQ6KRwKFv3eiUrtp6ILMxRvdrNc7mdyGEKl4h-rjHpVIaxw'),('f3bfb2fc-102d-4f71-89b2-d1174c2112b0','b7d964f2-9637-49b9-a5b2-f313465260ee','allowed-protocol-mapper-types','oidc-address-mapper'),('f48ad415-164f-4821-b12a-ab3f16863310','47b2aa2c-4d42-4390-9385-8d222e145d46','privateKey','MIIEowIBAAKCAQEAiNZSRuFPxcb+ljXtRDiBdKsou8xHqXeMwhBSBlbjfRLY05dHiUbyF1kCLkcy7YSI/hNk9Qcbb9UVmMWjsAUkbrz+lC0KolyhcEUH1YmCuvxmoZ9BhLUNiUYlT0ooqzgAG7sEfjXcsAwb6rXwIishvXCLqC7bSU7Of0lp2aaFHfdbB1SVS50yc3Rz8ywu1QQk47XGD0GYIv3hSYLLw+VaedIx/3+GQgE3wGZKSqD6ks07lJkH1qzSCPL/LVv0avZ1TNwGO+mrGmyTa2vur15Xm+j4IA+Cg2WVG/cOoyJpCVhzl1FZMlO0g9F55l8q/aqpE5+AYVIggtw4ijYxDTGtmQIDAQABAoIBAD0OvPnJsanDiHgIKg3l1MX1VaCun09b+9/gHmmbvbhif4OyngYANSf73IA/3tai6+nLR6IaAMEe6JsZnVd+g+oxxLrjejpGcPbCpqM+z6mV1EnL4RVRIHAfb6h4o7r6qvm0smWKrSWU0aQieLsWWeDI5lguSETmuDeNz4CB0CY1PNa5fIazvgLwMIr4FDep3BwR4t9feEPUZaFh8JejyUfO6kYTfXkizcANHa/surMBEMm/HxYAfRyjniax5TZNqkVlKDqp71UucIQleCsklO5jD9rmo5XjjF+byjoJVslSR0r1ePOlMWwN+0YPjTG8KFlAkx0hHmMxH8tvIkF1JrECgYEA6777ccWV/ufBdCexgdGAx9AFf2gCgzg/QWufSCJKp9SW7FeNN230Sirs9SfNcrbAh2aTNGXCz0uobq2cCKvMM3zfW35BCadENktHkPLb5olpV+jB1OhVH4ug+h61bo1k/o/pGE+LLvRpEqIfXmm14GdMXchsAYDQa7elJ7L7rhUCgYEAlJfuGTxVKQjfzJTJPBPfxnYB5Gb8w0f4rbNLXai6F1lSZmoZlVaS3CxIxm7V7ISfiBhZGz4A0r9iygvuSLuBwmTiSzLgXm9ncwy+KGH5t6qqJts/lF8UQZsnsWLJd+0x9zqB+6FPIowzQyeviTGyE25CBrM6x13dYGNB0nwEJnUCgYAOlTPMp+JNcFyhKMtsMl96/L06Ul7FazdOfq/NsIFZvGbRm+DaauzPobQiviGRVQi313qHpTvVwuJaZlbemnH5RWIzsK2pQTWQ/jshFkTQD/P6QiWrW+vYFbURg9DJU+nJbXGH1XPQpcHSK0Exf+yGQx2QN5OmzCcYYrXOrN2wuQKBgQCR+YdAZ1LJ0xv4oJnoWSXWk4tcVAgv135nNeHuCpl14pveXJDxcnEntqFvvuaNSeRnEHRJHOo2HynvjzTxYrMgw3bDpSFh5FNeZMBSb52gXxp0vaKCIb2GjeO6kW+WTwBs/Z9AEcHqEI0zhcMeJiHokMJwTpaJ0J5v2FKLcqWpGQKBgAXCBXGfvrcwpk4VAW97ToxUNZszOt7abofgV+B0ZycDAWfF4cD8ydriw4Rj3Hah1cwFazPRZ8fpNUXYEuJHK0tkGtI3GXxNJyd8SxXWJJLmmNxkDooO56SmpV/a4xa9ttrXGWjtzn3IoMJS3ReW23EFjKt9TRxLeZhgOHEdVFaL'),('f79619fa-eaec-4523-b00b-00abc4ca399d','cf5aa684-a2c5-401e-8890-a5289e23e497','client-uris-must-match','true'),('fab7152e-014f-451f-a20d-6217ac776d92','5b193819-226b-4070-a38b-d21f990c3d40','allow-default-scopes','true'),('fb081b9a-d1c7-41bf-85dd-d6e3d3d2321e','3bc0b86c-336a-47c0-8254-799ffdff41f8','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('fbb12ce8-7ffd-4aa1-878b-cd4e04762813','325c3781-1f60-453b-a84f-dd93d0f6e713','keyUse','SIG'),('ff1e96e8-af8d-40be-a97f-8e6e664523d9','88e8cb62-b630-4d6f-b590-d14f5ba0ffba','priority','100');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('1f236a85-58d2-43f1-a291-9b8aaed1472a','f21cea14-faf8-4cf7-bdad-0a30c4475794'),('3483e015-779c-41a7-8da7-ea628b6635cc','99f85bb7-30fd-48bc-82dc-e82b25d67021'),('3483e015-779c-41a7-8da7-ea628b6635cc','cb8cb534-cef6-4514-8635-b543ff5afd80'),('51f8bb88-a868-45b0-b72f-1ee719e81e72','4fa10a3d-f453-4db8-862d-52128ccb29c7'),('5284faef-53fc-47ea-b23d-d7e8e990543d','56401b24-4dca-455b-be35-7a0cb9e7c8ce'),('5baf5662-b950-40dc-8242-9f63a683e02f','4aeb0d9d-f3d5-4f02-82d6-1167d0a4bdc5'),('5baf5662-b950-40dc-8242-9f63a683e02f','993c42e8-d084-4abc-9d8b-5895a69825c3'),('5f1a11cd-83cc-4a6e-a369-082023da9380','f94355ff-7662-46c7-afa5-1a4f3a2b1422'),('6acff805-3def-4c3a-b8f5-524091bd6b96','036de26f-ef2f-422f-857a-e53b581d87bf'),('6acff805-3def-4c3a-b8f5-524091bd6b96','083c155d-754f-486c-bbb0-35a4ec58bd60'),('6acff805-3def-4c3a-b8f5-524091bd6b96','1cab3ada-8e02-47a3-a9ce-6c980b9a0c09'),('6acff805-3def-4c3a-b8f5-524091bd6b96','2575c895-3a00-4495-9715-150f8e290bd7'),('6acff805-3def-4c3a-b8f5-524091bd6b96','44fa1b3d-64bb-4755-aacf-4c8c9d13ff20'),('6acff805-3def-4c3a-b8f5-524091bd6b96','5284faef-53fc-47ea-b23d-d7e8e990543d'),('6acff805-3def-4c3a-b8f5-524091bd6b96','56401b24-4dca-455b-be35-7a0cb9e7c8ce'),('6acff805-3def-4c3a-b8f5-524091bd6b96','7aaf7233-42e2-43df-9086-6303f85b5cc2'),('6acff805-3def-4c3a-b8f5-524091bd6b96','7d791a48-07b5-4062-921b-b75d56d7518a'),('6acff805-3def-4c3a-b8f5-524091bd6b96','891b26be-8a17-40bf-8cab-379468dbdea6'),('6acff805-3def-4c3a-b8f5-524091bd6b96','8b1646d5-85d8-4df0-9aec-2b199c34c9d8'),('6acff805-3def-4c3a-b8f5-524091bd6b96','a47739e5-d91d-4d42-b543-6200a16e8e86'),('6acff805-3def-4c3a-b8f5-524091bd6b96','b3ffcb16-c0ff-4594-ac7d-4ca0fd621802'),('6acff805-3def-4c3a-b8f5-524091bd6b96','c7326e24-9cee-409b-a79c-b5d29438e792'),('6acff805-3def-4c3a-b8f5-524091bd6b96','d360a02f-3b86-4f2f-ac95-e76450e6afd4'),('6acff805-3def-4c3a-b8f5-524091bd6b96','d7659fcf-5426-4afd-8a99-fd224daab3ad'),('6acff805-3def-4c3a-b8f5-524091bd6b96','ed56a4dc-d428-4d89-8272-ab1bba9a2efd'),('6acff805-3def-4c3a-b8f5-524091bd6b96','fd8a4b88-f6dc-4317-83bb-59fe2c2bfff7'),('9e47a039-16c3-42a9-a3cb-5235dd539422','5544b993-798b-4d0c-8265-27a76cdc673d'),('a1f7bf75-ce72-480b-a053-459e87f405e5','312a7fb8-566e-46ec-90c9-786d6e4a7897'),('ae7d36be-f72f-46f0-9f3d-0c03832e6c01','710651e5-0ebf-4afc-a282-a6a7bc5743f9'),('ae7d36be-f72f-46f0-9f3d-0c03832e6c01','7b736364-1431-46bf-979c-8c0896d62f35'),('ae7d36be-f72f-46f0-9f3d-0c03832e6c01','9e47a039-16c3-42a9-a3cb-5235dd539422'),('ae7d36be-f72f-46f0-9f3d-0c03832e6c01','ff2199d2-7e7c-4437-a07c-57f704d36928'),('bfcd4ea9-9e1b-4abb-943d-979205267d6b','8a8764f5-4a3c-4727-82c8-d22f7a461e7b'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','01c60668-581b-4227-bdd0-09dccb5d49ab'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','04d153bc-0297-493b-ba52-0cab5c347ae5'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','1424cb9e-3cfa-4368-a801-9d59cdafa8c8'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','14bf1332-770f-45ee-9dc0-17ea8b197050'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','1f236a85-58d2-43f1-a291-9b8aaed1472a'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','272673c8-7d20-4da3-8733-12d8e5f2606d'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','2dc056c9-8e39-4074-9cef-f06b71faf342'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','2f99fe4f-1313-46da-9c9c-d26f209672a1'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','312a7fb8-566e-46ec-90c9-786d6e4a7897'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','3483e015-779c-41a7-8da7-ea628b6635cc'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','38e2533b-ed4d-435e-97a7-e733e32d2f7b'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','3f762cd8-db75-4bde-9407-6a509c40fd8b'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','4aeb0d9d-f3d5-4f02-82d6-1167d0a4bdc5'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','5baf5662-b950-40dc-8242-9f63a683e02f'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','7161166e-79b4-4fd9-8f8e-9d56a8359033'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','731b9d49-023e-44a8-a575-18ef3a399ff0'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','7487b9b5-d308-411f-a8e6-7e555ccc21b6'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','7b6a0538-70c6-4127-937a-1c74af232c40'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','868cb9b6-84eb-40bc-928c-fe830801e7a7'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','86ec4a6f-f513-4e04-8873-25b16aaff8bc'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','98638da6-422b-4a4b-a8da-f0fb8195f2b2'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','993c42e8-d084-4abc-9d8b-5895a69825c3'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','99f85bb7-30fd-48bc-82dc-e82b25d67021'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','a0c23e13-e08a-487b-a235-f4538c2080b6'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','a1f7bf75-ce72-480b-a053-459e87f405e5'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','a54e539f-995f-4e73-8a04-f62a35fb530e'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','b86e8c53-4599-4b1e-acf4-f76665555293'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','c15060ab-d650-4c49-b6f2-d5cfc2556915'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','c9734743-24ff-471a-9dfa-a77695d6a868'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','cb8cb534-cef6-4514-8635-b543ff5afd80'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','de0ed4e0-bfca-4879-b1e4-d6e95dc54b91'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','e5c4ef9a-ab67-4b06-bd71-0e8b95a6ae58'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','e8f63c67-d0cd-476c-bc0c-226169bbcf59'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','ee6f99ee-ce73-49d5-8f77-fc4b5e67b7c3'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','f21cea14-faf8-4cf7-bdad-0a30c4475794'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','fe8c47de-ae74-4478-a66e-0db6a8a28752'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','ff130c54-8963-45dd-88ce-9186ec4be37a'),('cfac6186-5660-4918-9223-cf66e96240d8','a4dc1ed2-d890-47bd-83f2-61a7312f6145'),('cfac6186-5660-4918-9223-cf66e96240d8','bfcd4ea9-9e1b-4abb-943d-979205267d6b'),('cfac6186-5660-4918-9223-cf66e96240d8','e61e1aa4-2aa7-4c6c-b8ac-b7bf0dc9208e'),('cfac6186-5660-4918-9223-cf66e96240d8','e87bb37c-5692-4625-9d94-ef386dd28978'),('d7659fcf-5426-4afd-8a99-fd224daab3ad','44fa1b3d-64bb-4755-aacf-4c8c9d13ff20'),('d7659fcf-5426-4afd-8a99-fd224daab3ad','b3ffcb16-c0ff-4594-ac7d-4ca0fd621802');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultas`
--

DROP TABLE IF EXISTS `consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultas` (
  `idConsulta` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `descripcion` longtext,
  `foto` longblob,
  `paciente_id` int DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `foto2` longblob,
  `pdflink` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idConsulta`),
  KEY `fk_paciente` (`paciente_id`),
  CONSTRAINT `fk_paciente` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`idPaciente`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas`
--

LOCK TABLES `consultas` WRITE;
/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;
INSERT INTO `consultas` VALUES (39,'2024-02-08 15:26:06','Una descripcion de la consulta/ficha',NULL,46,'Ficha medica','2024-02-08 15:26:06',NULL,'Link al estudio pdf/ opcional');
/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('0110cf5b-48ab-497e-a68b-322e096adac3',NULL,'password','b41878f8-823e-4658-bae2-6b067ed28dfc',1707416563934,NULL,'{\"value\":\"koYPlCzApLX+Tur2ZdfF4TLaOcGPe8ZhSw56BaqkrHUjQR+JL/gQJzDVmhpn3zV7TGVx8/T286p+C+UQWxLuFQ==\",\"salt\":\"33gMRD26P3CtGB5wc1+rqg==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('c1140767-5574-4f0c-8384-08d266fe0107',NULL,'password','b92734e2-a5e2-4422-8bd0-0183ba47d91f',1707322473762,NULL,'{\"value\":\"BpBoRhm0vBMKQ7K/0xAxvRhswnVhNaqksHMlkyNx6TD5q/ZC2qv/nIIgFSjC+w2jMLH4FKS2POkqgbKE1jvizQ==\",\"salt\":\"bgxu5bDuYJQHyeSK5CwR2w==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2024-02-07 16:13:10',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2024-02-07 16:13:10',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2024-02-07 16:13:11',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2024-02-07 16:13:11',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2024-02-07 16:13:16',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2024-02-07 16:13:16',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2024-02-07 16:13:20',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2024-02-07 16:13:20',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2024-02-07 16:13:20',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2024-02-07 16:13:26',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2024-02-07 16:13:27',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2024-02-07 16:13:27',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2024-02-07 16:13:28',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-02-07 16:13:28',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-02-07 16:13:28',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-02-07 16:13:28',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-02-07 16:13:28',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2024-02-07 16:13:31',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2024-02-07 16:13:41',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2024-02-07 16:13:42',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2024-02-07 16:13:42',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2024-02-07 16:13:42',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2024-02-07 16:13:43',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2024-02-07 16:13:43',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2024-02-07 16:13:43',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7322380393'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2024-02-07 16:13:44',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2024-02-07 16:13:47',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2024-02-07 16:13:47',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'7322380393'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2024-02-07 16:13:49',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2024-02-07 16:13:50',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2024-02-07 16:13:51',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2024-02-07 16:13:51',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'7322380393'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-02-07 16:13:51',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'7322380393'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-02-07 16:13:51',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-02-07 16:13:54',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2024-02-07 16:13:54',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7322380393'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-02-07 16:13:54',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'7322380393'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2024-02-07 16:13:54',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'7322380393'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2024-02-07 16:13:54',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'7322380393'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-02-07 16:13:54',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'7322380393'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-02-07 16:13:54',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'7322380393'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2024-02-07 16:13:54',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'7322380393'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-02-07 16:13:58',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2024-02-07 16:13:58',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'7322380393'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-02-07 16:13:58',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'7322380393'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-02-07 16:13:58',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'7322380393'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-02-07 16:13:59',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'7322380393'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-02-07 16:14:03',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-02-07 16:14:04',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7322380393'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2024-02-07 16:14:08',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2024-02-07 16:14:08',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2024-02-07 16:14:08',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'7322380393'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2024-02-07 16:14:08',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7322380393'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2024-02-07 16:14:08',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'7322380393'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-02-07 16:14:09',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'7322380393'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-02-07 16:14:09',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'7322380393'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-02-07 16:14:10',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-02-07 16:14:16',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2024-02-07 16:14:17',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2024-02-07 16:14:18',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'7322380393'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-02-07 16:14:18',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-02-07 16:14:18',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'7322380393'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2024-02-07 16:14:18',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'7322380393'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2024-02-07 16:14:18',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'7322380393'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2024-02-07 16:14:18',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'7322380393'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2024-02-07 16:14:19',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2024-02-07 16:14:19',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'7322380393'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2024-02-07 16:14:19',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7322380393'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2024-02-07 16:14:19',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2024-02-07 16:14:20',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7322380393'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2024-02-07 16:14:20',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'7322380393'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-02-07 16:14:20',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7322380393'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-02-07 16:14:20',73,'EXECUTED','7:3979a0ae07ac465e920ca696532fc736','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7322380393'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-02-07 16:14:20',74,'MARK_RAN','7:5abfde4c259119d143bd2fbf49ac2bca','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7322380393'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-02-07 16:14:21',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-02-07 16:14:21',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'7322380393'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-02-07 16:14:21',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'7322380393'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-02-07 16:14:21',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-02-07 16:14:23',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-02-07 16:14:23',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-02-07 16:14:23',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'7322380393'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-02-07 16:14:23',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'7322380393'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-02-07 16:14:23',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'7322380393'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-02-07 16:14:23',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'7322380393'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-02-07 16:14:24',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'7322380393'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2024-02-07 16:14:24',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'7322380393'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-02-07 16:14:24',87,'EXECUTED','7:578d0b92077eaf2ab95ad0ec087aa903','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-02-07 16:14:24',88,'EXECUTED','7:c95abe90d962c57a09ecaee57972835d','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'3.5.4',NULL,NULL,'7322380393'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-02-07 16:14:24',89,'EXECUTED','7:f1313bcc2994a5c4dc1062ed6d8282d3','addColumn tableName=REALM; customChange','',NULL,'3.5.4',NULL,NULL,'7322380393'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-02-07 16:14:24',90,'EXECUTED','7:90d763b52eaffebefbcbde55f269508b','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'3.5.4',NULL,NULL,'7322380393'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-02-07 16:14:24',91,'EXECUTED','7:d554f0cb92b764470dccfa5e0014a7dd','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'7322380393'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-02-07 16:14:25',92,'EXECUTED','7:73193e3ab3c35cf0f37ccea3bf783764','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-02-07 16:14:25',93,'MARK_RAN','7:90a1e74f92e9cbaa0c5eab80b8a037f3','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'7322380393'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-02-07 16:14:25',94,'EXECUTED','7:5b9248f29cd047c200083cc6d8388b16','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'7322380393'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-02-07 16:14:25',95,'MARK_RAN','7:64db59e44c374f13955489e8990d17a1','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'3.5.4',NULL,NULL,'7322380393'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-02-07 16:14:25',96,'EXECUTED','7:329a578cdb43262fff975f0a7f6cda60','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'7322380393'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-02-07 16:14:26',97,'EXECUTED','7:fae0de241ac0fd0bbc2b380b85e4f567','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'7322380393'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-02-07 16:14:26',98,'MARK_RAN','7:075d54e9180f49bb0c64ca4218936e81','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'7322380393'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-02-07 16:14:26',99,'MARK_RAN','7:06499836520f4f6b3d05e35a59324910','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'7322380393'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-02-07 16:14:26',100,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'7322380393'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-02-07 16:14:26',101,'MARK_RAN','7:3d2b23076e59c6f70bae703aa01be35b','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'7322380393'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-02-07 16:14:26',102,'EXECUTED','7:1a7f28ff8d9e53aeb879d76ea3d9341a','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'7322380393'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-02-07 16:14:26',103,'EXECUTED','7:2fd554456fed4a82c698c555c5b751b6','customChange','',NULL,'3.5.4',NULL,NULL,'7322380393'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2024-02-07 16:14:26',104,'EXECUTED','7:b06356d66c2790ecc2ae54ba0458397a','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'3.5.4',NULL,NULL,'7322380393');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('animalia','05770ea4-1bd5-4987-a024-2dfc6a00c2a9',_binary '\0'),('animalia','0ea03a8a-790b-446b-a2a8-218126ea2173',_binary ''),('animalia','1d6df13c-1ddb-46b9-8e94-a46b24f6f734',_binary '\0'),('animalia','1f61c8b7-b44c-452d-9e1e-b149497a4f81',_binary '\0'),('animalia','57a47430-5051-4d13-8a5f-ffa4cd948e03',_binary '\0'),('animalia','720ef35b-9640-4549-8cc5-effef481bc80',_binary ''),('animalia','782ddfc4-2284-4fd8-9f02-405aa63d24d2',_binary ''),('animalia','b1c1b93a-b05d-40cf-8cc2-ee2d87751fd3',_binary ''),('animalia','dc51d139-a633-4316-9fa7-470e066e3970',_binary ''),('master','1460475d-4ec4-45ab-8833-b3122214d499',_binary ''),('master','420ddaab-3a63-4699-b9f4-8908005b4d2f',_binary ''),('master','4377f50e-33a5-4fab-b9b9-52bb98f3d380',_binary ''),('master','4a269588-bd90-4609-a2d4-ebdc434a900c',_binary ''),('master','87f6652f-369b-414e-9875-a3eca71e5e43',_binary ''),('master','9ba43097-a075-47a6-ab4c-e001d0596740',_binary '\0'),('master','d25fefbb-d4b3-4b9d-ae35-6b87d829e60c',_binary '\0'),('master','e907b080-e7c8-4362-9b38-c56483fd53fc',_binary '\0'),('master','f315d53e-ffc1-493f-b8f6-d5c4fc686904',_binary '\0');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('01c60668-581b-4227-bdd0-09dccb5d49ab','b7350a97-6be1-4c6a-aa01-1b040916ce0d',_binary '','${role_manage-users}','manage-users','master','b7350a97-6be1-4c6a-aa01-1b040916ce0d',NULL),('036de26f-ef2f-422f-857a-e53b581d87bf','23478395-cce4-4706-9ce3-ea5f4fda8889',_binary '','${role_manage-authorization}','manage-authorization','animalia','23478395-cce4-4706-9ce3-ea5f4fda8889',NULL),('04d153bc-0297-493b-ba52-0cab5c347ae5','b7350a97-6be1-4c6a-aa01-1b040916ce0d',_binary '','${role_view-authorization}','view-authorization','master','b7350a97-6be1-4c6a-aa01-1b040916ce0d',NULL),('083c155d-754f-486c-bbb0-35a4ec58bd60','23478395-cce4-4706-9ce3-ea5f4fda8889',_binary '','${role_manage-realm}','manage-realm','animalia','23478395-cce4-4706-9ce3-ea5f4fda8889',NULL),('0adec65f-370a-4c3d-ab01-24d90f7c60d7','2b7ebc48-9172-4263-808a-a4b8d7073916',_binary '','${role_delete-account}','delete-account','animalia','2b7ebc48-9172-4263-808a-a4b8d7073916',NULL),('1424cb9e-3cfa-4368-a801-9d59cdafa8c8','9e9d19f9-0037-4599-9ace-92253aee1e52',_binary '','${role_manage-users}','manage-users','master','9e9d19f9-0037-4599-9ace-92253aee1e52',NULL),('14bf1332-770f-45ee-9dc0-17ea8b197050','b7350a97-6be1-4c6a-aa01-1b040916ce0d',_binary '','${role_manage-clients}','manage-clients','master','b7350a97-6be1-4c6a-aa01-1b040916ce0d',NULL),('16dc491e-39e2-4b39-9087-96103db773f6','235384dd-3046-41c7-aea8-a4c31f40608b',_binary '','${role_view-applications}','view-applications','master','235384dd-3046-41c7-aea8-a4c31f40608b',NULL),('1cab3ada-8e02-47a3-a9ce-6c980b9a0c09','23478395-cce4-4706-9ce3-ea5f4fda8889',_binary '','${role_query-realms}','query-realms','animalia','23478395-cce4-4706-9ce3-ea5f4fda8889',NULL),('1f236a85-58d2-43f1-a291-9b8aaed1472a','9e9d19f9-0037-4599-9ace-92253aee1e52',_binary '','${role_view-clients}','view-clients','master','9e9d19f9-0037-4599-9ace-92253aee1e52',NULL),('2575c895-3a00-4495-9715-150f8e290bd7','23478395-cce4-4706-9ce3-ea5f4fda8889',_binary '','${role_view-identity-providers}','view-identity-providers','animalia','23478395-cce4-4706-9ce3-ea5f4fda8889',NULL),('27240128-2be2-4b1d-be1d-70cfb5f8db16','2b7ebc48-9172-4263-808a-a4b8d7073916',_binary '','${role_view-applications}','view-applications','animalia','2b7ebc48-9172-4263-808a-a4b8d7073916',NULL),('272673c8-7d20-4da3-8733-12d8e5f2606d','9e9d19f9-0037-4599-9ace-92253aee1e52',_binary '','${role_manage-realm}','manage-realm','master','9e9d19f9-0037-4599-9ace-92253aee1e52',NULL),('2dc056c9-8e39-4074-9cef-f06b71faf342','b7350a97-6be1-4c6a-aa01-1b040916ce0d',_binary '','${role_query-realms}','query-realms','master','b7350a97-6be1-4c6a-aa01-1b040916ce0d',NULL),('2f99fe4f-1313-46da-9c9c-d26f209672a1','9e9d19f9-0037-4599-9ace-92253aee1e52',_binary '','${role_manage-authorization}','manage-authorization','master','9e9d19f9-0037-4599-9ace-92253aee1e52',NULL),('312a7fb8-566e-46ec-90c9-786d6e4a7897','b7350a97-6be1-4c6a-aa01-1b040916ce0d',_binary '','${role_query-clients}','query-clients','master','b7350a97-6be1-4c6a-aa01-1b040916ce0d',NULL),('3483e015-779c-41a7-8da7-ea628b6635cc','b7350a97-6be1-4c6a-aa01-1b040916ce0d',_binary '','${role_view-users}','view-users','master','b7350a97-6be1-4c6a-aa01-1b040916ce0d',NULL),('38e2533b-ed4d-435e-97a7-e733e32d2f7b','9e9d19f9-0037-4599-9ace-92253aee1e52',_binary '','${role_manage-events}','manage-events','master','9e9d19f9-0037-4599-9ace-92253aee1e52',NULL),('3f762cd8-db75-4bde-9407-6a509c40fd8b','9e9d19f9-0037-4599-9ace-92253aee1e52',_binary '','${role_view-realm}','view-realm','master','9e9d19f9-0037-4599-9ace-92253aee1e52',NULL),('44fa1b3d-64bb-4755-aacf-4c8c9d13ff20','23478395-cce4-4706-9ce3-ea5f4fda8889',_binary '','${role_query-groups}','query-groups','animalia','23478395-cce4-4706-9ce3-ea5f4fda8889',NULL),('4aeb0d9d-f3d5-4f02-82d6-1167d0a4bdc5','9e9d19f9-0037-4599-9ace-92253aee1e52',_binary '','${role_query-groups}','query-groups','master','9e9d19f9-0037-4599-9ace-92253aee1e52',NULL),('4fa10a3d-f453-4db8-862d-52128ccb29c7','2b7ebc48-9172-4263-808a-a4b8d7073916',_binary '','${role_view-consent}','view-consent','animalia','2b7ebc48-9172-4263-808a-a4b8d7073916',NULL),('51f8bb88-a868-45b0-b72f-1ee719e81e72','2b7ebc48-9172-4263-808a-a4b8d7073916',_binary '','${role_manage-consent}','manage-consent','animalia','2b7ebc48-9172-4263-808a-a4b8d7073916',NULL),('5284faef-53fc-47ea-b23d-d7e8e990543d','23478395-cce4-4706-9ce3-ea5f4fda8889',_binary '','${role_view-clients}','view-clients','animalia','23478395-cce4-4706-9ce3-ea5f4fda8889',NULL),('5544b993-798b-4d0c-8265-27a76cdc673d','2b7ebc48-9172-4263-808a-a4b8d7073916',_binary '','${role_manage-account-links}','manage-account-links','animalia','2b7ebc48-9172-4263-808a-a4b8d7073916',NULL),('56401b24-4dca-455b-be35-7a0cb9e7c8ce','23478395-cce4-4706-9ce3-ea5f4fda8889',_binary '','${role_query-clients}','query-clients','animalia','23478395-cce4-4706-9ce3-ea5f4fda8889',NULL),('5baf5662-b950-40dc-8242-9f63a683e02f','9e9d19f9-0037-4599-9ace-92253aee1e52',_binary '','${role_view-users}','view-users','master','9e9d19f9-0037-4599-9ace-92253aee1e52',NULL),('5f1a11cd-83cc-4a6e-a369-082023da9380','235384dd-3046-41c7-aea8-a4c31f40608b',_binary '','${role_manage-consent}','manage-consent','master','235384dd-3046-41c7-aea8-a4c31f40608b',NULL),('6acff805-3def-4c3a-b8f5-524091bd6b96','23478395-cce4-4706-9ce3-ea5f4fda8889',_binary '','${role_realm-admin}','realm-admin','animalia','23478395-cce4-4706-9ce3-ea5f4fda8889',NULL),('710651e5-0ebf-4afc-a282-a6a7bc5743f9','animalia',_binary '\0','${role_offline-access}','offline_access','animalia',NULL,NULL),('7161166e-79b4-4fd9-8f8e-9d56a8359033','9e9d19f9-0037-4599-9ace-92253aee1e52',_binary '','${role_create-client}','create-client','master','9e9d19f9-0037-4599-9ace-92253aee1e52',NULL),('731b9d49-023e-44a8-a575-18ef3a399ff0','b7350a97-6be1-4c6a-aa01-1b040916ce0d',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','b7350a97-6be1-4c6a-aa01-1b040916ce0d',NULL),('7487b9b5-d308-411f-a8e6-7e555ccc21b6','b7350a97-6be1-4c6a-aa01-1b040916ce0d',_binary '','${role_view-realm}','view-realm','master','b7350a97-6be1-4c6a-aa01-1b040916ce0d',NULL),('7aaf7233-42e2-43df-9086-6303f85b5cc2','23478395-cce4-4706-9ce3-ea5f4fda8889',_binary '','${role_manage-clients}','manage-clients','animalia','23478395-cce4-4706-9ce3-ea5f4fda8889',NULL),('7b6a0538-70c6-4127-937a-1c74af232c40','b7350a97-6be1-4c6a-aa01-1b040916ce0d',_binary '','${role_manage-authorization}','manage-authorization','master','b7350a97-6be1-4c6a-aa01-1b040916ce0d',NULL),('7b736364-1431-46bf-979c-8c0896d62f35','animalia',_binary '\0','${role_uma_authorization}','uma_authorization','animalia',NULL,NULL),('7d791a48-07b5-4062-921b-b75d56d7518a','23478395-cce4-4706-9ce3-ea5f4fda8889',_binary '','${role_manage-users}','manage-users','animalia','23478395-cce4-4706-9ce3-ea5f4fda8889',NULL),('868cb9b6-84eb-40bc-928c-fe830801e7a7','b7350a97-6be1-4c6a-aa01-1b040916ce0d',_binary '','${role_create-client}','create-client','master','b7350a97-6be1-4c6a-aa01-1b040916ce0d',NULL),('86ec4a6f-f513-4e04-8873-25b16aaff8bc','9e9d19f9-0037-4599-9ace-92253aee1e52',_binary '','${role_impersonation}','impersonation','master','9e9d19f9-0037-4599-9ace-92253aee1e52',NULL),('891b26be-8a17-40bf-8cab-379468dbdea6','23478395-cce4-4706-9ce3-ea5f4fda8889',_binary '','${role_impersonation}','impersonation','animalia','23478395-cce4-4706-9ce3-ea5f4fda8889',NULL),('8a8764f5-4a3c-4727-82c8-d22f7a461e7b','235384dd-3046-41c7-aea8-a4c31f40608b',_binary '','${role_manage-account-links}','manage-account-links','master','235384dd-3046-41c7-aea8-a4c31f40608b',NULL),('8b1646d5-85d8-4df0-9aec-2b199c34c9d8','23478395-cce4-4706-9ce3-ea5f4fda8889',_binary '','${role_view-events}','view-events','animalia','23478395-cce4-4706-9ce3-ea5f4fda8889',NULL),('98638da6-422b-4a4b-a8da-f0fb8195f2b2','b7350a97-6be1-4c6a-aa01-1b040916ce0d',_binary '','${role_manage-realm}','manage-realm','master','b7350a97-6be1-4c6a-aa01-1b040916ce0d',NULL),('993c42e8-d084-4abc-9d8b-5895a69825c3','9e9d19f9-0037-4599-9ace-92253aee1e52',_binary '','${role_query-users}','query-users','master','9e9d19f9-0037-4599-9ace-92253aee1e52',NULL),('99f85bb7-30fd-48bc-82dc-e82b25d67021','b7350a97-6be1-4c6a-aa01-1b040916ce0d',_binary '','${role_query-groups}','query-groups','master','b7350a97-6be1-4c6a-aa01-1b040916ce0d',NULL),('9e47a039-16c3-42a9-a3cb-5235dd539422','2b7ebc48-9172-4263-808a-a4b8d7073916',_binary '','${role_manage-account}','manage-account','animalia','2b7ebc48-9172-4263-808a-a4b8d7073916',NULL),('a0c23e13-e08a-487b-a235-f4538c2080b6','9e9d19f9-0037-4599-9ace-92253aee1e52',_binary '','${role_view-events}','view-events','master','9e9d19f9-0037-4599-9ace-92253aee1e52',NULL),('a1f7bf75-ce72-480b-a053-459e87f405e5','b7350a97-6be1-4c6a-aa01-1b040916ce0d',_binary '','${role_view-clients}','view-clients','master','b7350a97-6be1-4c6a-aa01-1b040916ce0d',NULL),('a3380339-01b6-45ce-b916-1b04924ef13e','235384dd-3046-41c7-aea8-a4c31f40608b',_binary '','${role_delete-account}','delete-account','master','235384dd-3046-41c7-aea8-a4c31f40608b',NULL),('a47739e5-d91d-4d42-b543-6200a16e8e86','23478395-cce4-4706-9ce3-ea5f4fda8889',_binary '','${role_view-realm}','view-realm','animalia','23478395-cce4-4706-9ce3-ea5f4fda8889',NULL),('a4dc1ed2-d890-47bd-83f2-61a7312f6145','235384dd-3046-41c7-aea8-a4c31f40608b',_binary '','${role_view-profile}','view-profile','master','235384dd-3046-41c7-aea8-a4c31f40608b',NULL),('a54e539f-995f-4e73-8a04-f62a35fb530e','9e9d19f9-0037-4599-9ace-92253aee1e52',_binary '','${role_view-authorization}','view-authorization','master','9e9d19f9-0037-4599-9ace-92253aee1e52',NULL),('ae7d36be-f72f-46f0-9f3d-0c03832e6c01','animalia',_binary '\0','${role_default-roles}','default-roles-animalia','animalia',NULL,NULL),('b3ffcb16-c0ff-4594-ac7d-4ca0fd621802','23478395-cce4-4706-9ce3-ea5f4fda8889',_binary '','${role_query-users}','query-users','animalia','23478395-cce4-4706-9ce3-ea5f4fda8889',NULL),('b86e8c53-4599-4b1e-acf4-f76665555293','9e9d19f9-0037-4599-9ace-92253aee1e52',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','9e9d19f9-0037-4599-9ace-92253aee1e52',NULL),('bfcd4ea9-9e1b-4abb-943d-979205267d6b','235384dd-3046-41c7-aea8-a4c31f40608b',_binary '','${role_manage-account}','manage-account','master','235384dd-3046-41c7-aea8-a4c31f40608b',NULL),('c15060ab-d650-4c49-b6f2-d5cfc2556915','9e9d19f9-0037-4599-9ace-92253aee1e52',_binary '','${role_query-realms}','query-realms','master','9e9d19f9-0037-4599-9ace-92253aee1e52',NULL),('c7326e24-9cee-409b-a79c-b5d29438e792','23478395-cce4-4706-9ce3-ea5f4fda8889',_binary '','${role_view-authorization}','view-authorization','animalia','23478395-cce4-4706-9ce3-ea5f4fda8889',NULL),('c9734743-24ff-471a-9dfa-a77695d6a868','b7350a97-6be1-4c6a-aa01-1b040916ce0d',_binary '','${role_manage-events}','manage-events','master','b7350a97-6be1-4c6a-aa01-1b040916ce0d',NULL),('cb8cb534-cef6-4514-8635-b543ff5afd80','b7350a97-6be1-4c6a-aa01-1b040916ce0d',_binary '','${role_query-users}','query-users','master','b7350a97-6be1-4c6a-aa01-1b040916ce0d',NULL),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','master',_binary '\0','${role_admin}','admin','master',NULL,NULL),('cfac6186-5660-4918-9223-cf66e96240d8','master',_binary '\0','${role_default-roles}','default-roles-master','master',NULL,NULL),('d17b5489-0af8-41c4-8e35-ede13277f6d5','aa375dd6-5f93-44f1-963a-da1e3cdb732e',_binary '','${role_read-token}','read-token','animalia','aa375dd6-5f93-44f1-963a-da1e3cdb732e',NULL),('d360a02f-3b86-4f2f-ac95-e76450e6afd4','23478395-cce4-4706-9ce3-ea5f4fda8889',_binary '','${role_manage-events}','manage-events','animalia','23478395-cce4-4706-9ce3-ea5f4fda8889',NULL),('d7659fcf-5426-4afd-8a99-fd224daab3ad','23478395-cce4-4706-9ce3-ea5f4fda8889',_binary '','${role_view-users}','view-users','animalia','23478395-cce4-4706-9ce3-ea5f4fda8889',NULL),('de0ed4e0-bfca-4879-b1e4-d6e95dc54b91','b7350a97-6be1-4c6a-aa01-1b040916ce0d',_binary '','${role_view-identity-providers}','view-identity-providers','master','b7350a97-6be1-4c6a-aa01-1b040916ce0d',NULL),('e5c4ef9a-ab67-4b06-bd71-0e8b95a6ae58','b7350a97-6be1-4c6a-aa01-1b040916ce0d',_binary '','${role_view-events}','view-events','master','b7350a97-6be1-4c6a-aa01-1b040916ce0d',NULL),('e61e1aa4-2aa7-4c6c-b8ac-b7bf0dc9208e','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,NULL),('e87bb37c-5692-4625-9d94-ef386dd28978','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,NULL),('e8f63c67-d0cd-476c-bc0c-226169bbcf59','b7350a97-6be1-4c6a-aa01-1b040916ce0d',_binary '','${role_impersonation}','impersonation','master','b7350a97-6be1-4c6a-aa01-1b040916ce0d',NULL),('ed56a4dc-d428-4d89-8272-ab1bba9a2efd','23478395-cce4-4706-9ce3-ea5f4fda8889',_binary '','${role_manage-identity-providers}','manage-identity-providers','animalia','23478395-cce4-4706-9ce3-ea5f4fda8889',NULL),('ee6f99ee-ce73-49d5-8f77-fc4b5e67b7c3','9e9d19f9-0037-4599-9ace-92253aee1e52',_binary '','${role_view-identity-providers}','view-identity-providers','master','9e9d19f9-0037-4599-9ace-92253aee1e52',NULL),('f21cea14-faf8-4cf7-bdad-0a30c4475794','9e9d19f9-0037-4599-9ace-92253aee1e52',_binary '','${role_query-clients}','query-clients','master','9e9d19f9-0037-4599-9ace-92253aee1e52',NULL),('f57b570b-b3e3-4094-a7ec-892ad601e035','7dc046b3-5bea-4b84-b28a-1e7a34ddcde1',_binary '','${role_read-token}','read-token','master','7dc046b3-5bea-4b84-b28a-1e7a34ddcde1',NULL),('f94355ff-7662-46c7-afa5-1a4f3a2b1422','235384dd-3046-41c7-aea8-a4c31f40608b',_binary '','${role_view-consent}','view-consent','master','235384dd-3046-41c7-aea8-a4c31f40608b',NULL),('fd8a4b88-f6dc-4317-83bb-59fe2c2bfff7','23478395-cce4-4706-9ce3-ea5f4fda8889',_binary '','${role_create-client}','create-client','animalia','23478395-cce4-4706-9ce3-ea5f4fda8889',NULL),('fe8c47de-ae74-4478-a66e-0db6a8a28752','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,NULL),('ff130c54-8963-45dd-88ce-9186ec4be37a','9e9d19f9-0037-4599-9ace-92253aee1e52',_binary '','${role_manage-clients}','manage-clients','master','9e9d19f9-0037-4599-9ace-92253aee1e52',NULL),('ff2199d2-7e7c-4437-a07c-57f704d36928','2b7ebc48-9172-4263-808a-a4b8d7073916',_binary '','${role_view-profile}','view-profile','animalia','2b7ebc48-9172-4263-808a-a4b8d7073916',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('pv6nu','16.1.1',1707322470);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `idPaciente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `peso` double DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `fechaNacimiento` varchar(55) DEFAULT NULL,
  `esterilizado` tinyint(1) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `foto` longblob,
  `responsable_id` int DEFAULT NULL,
  `especie` varchar(55) DEFAULT NULL,
  `raza` varchar(100) DEFAULT NULL,
  `fechaUltVisita` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idPaciente`),
  KEY `responsableFk` (`responsable_id`),
  CONSTRAINT `responsableFk` FOREIGN KEY (`responsable_id`) REFERENCES `responsables` (`idResponsable`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES (46,'Zlatan',NULL,'Macho','2018-07-11',0,'Es un perro muy sociable!',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(�\�\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((�\�\0�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\�\�㭞�����\�/\�\�t�\���ȡ�<ק\��\�\�\�\�ը���\�;�\�M�鉎^i\�\�&c�=\�\�!\�\����\�3<u\\\��#lW�!U\'8�XX\�;G��v�{\�\�\�w>�U\���kS\�y_F���Vz<U\�S�\�-�S|hB\�$ƾyn|\�\�\�;���%�-���wBS\�#�(\0��dAC`\n>{\����WW�\�\�\�aѺ�-�a�\�V�߈\�uO�\�\�;Z��К�����T\�5\�5\�\����i9�\�~C=/Q��\�H��1�Fq\�14�f �(\�Lt#���\�\�\�H��x>H¥\�\�\�u|ކ���G�\�Ze���av\�z9\�*�\�\"��Kb\��\Z�x�\�\�\�2�u�w��\�\�u�k�\Z{\�[Q琌}u^){���[\�\�\�g�/����x^��\���\"{��.l`�!�|�[W���z[w\'Zm\�/4ǠEܴ�IiZ*6�K_6_�\�s�7������\�)�eXɣ(\�]=0R��Ay�fԦ��\��#�-goapz\�Y\�3Zb\�>���TX\"�rm�\�\�f�;Br�՚Sq����\�9�\�\�5Z�\r}P_D\�kF3\�\�6�>��֝\�xj!.�,UC\\auL\��G0�J�\r6#���\�tO}\�\�(\0�|\�=d�zr�֮ܩܮ��PmJ\�S�\�\�E:�%�\�N�u\�ݥ�\�_�X\�\�Ķ�E 5攏-��\�\nZ�oY6�P3�\�\�5\�c92�y\�xG\��2��y\�1�VF���\�\����\��\Zj�n�\�\�2\ri��\�\�̩\�T\�./]h�\�!RKؽLpM���Z`\�	X��\ZHm\'\Z>�5Vyr�j,fɬ�\�B1��\�.Z\�T�(\�V�\�Wr��\�\�fC��s��\�}uβ\�\�F����\�>���ET��LA�\�A\���>Y�a\�\�\��V�\����\��6\�m|هD)�\� �Q߅Gsn�t\�x}�\�|�\�\'-g^֪\�\�Q��I&\�b��<n��\�K�\�+\���#�\����\�4X\�|Z-\rm}G�K\�|�!`ʠn��D�R\"2\\k\�\�ʣt\�u����4/V\�l��4�Mԉ�\��,M|\��|��\�>[�\n��ZHM\�N�\0lW�wIE�*\�\��\�}h�\�\�{\�\�\�v�Ű)��A\�Q<0+��8Ql\"�8�\�\�;d6\�+ai��N/Y\�6\�6\�J\\\�e\�?�\��1�.s��B#c\�\�\��\�\�z�B��\�Sk\�ֽ\�\n\�\�UQX<����̰Q4U�#\�\��~k$9�@\�$C\�1\�\�N�\�\�^\�\�/{W�~)\�\�\�O?��Ѹ�\�64�s�\�}�\�\�Z��]QT\r��hEL\�i\�\�v�0�S�\�\�\�`\�\�޻\�>\�ORr�ikf���\0y�wH\�HȢ\"y\�(F5J\�tz9\�ob�\Z\�G\�!}j+�\�Ѭ\�Ǟ��\\�\�+\�05\�\�\�\�\�,\�\�\�\�d=6��\�gOso2�\�k\�\�\�\�\�1(����A�$!\�\�ZQ\�\��\�\�\�\�\�T�)|cQ\�ɽ6n\�*˃R����Q㼇\��^�c�\\\�5\�\�hS�U�\�z`)\�̢]M\�l8��Ti��`/�Gr��\�\�\0�\n!` fe�\r>���	ŴZ\�O�=<��]�\�ڧst%��\�\�ӥ�\�\�e\�V\�^AomEϊ�\�i5ᾐ֔�:���������鎍+YOHCK��D� f%DL\" \�\�\r\�\�\�\'\�ه��\�}\�����k\�z<�Lt֝�\�\�~_\\\�>+\�\��j&���\�4�yg\�K.�n~\�\�\�H\n���莕0\�a1�\0u\�$ep\�R���\0�\�\0,\0\0\0\0\0\0\0!\"012 #@A34B�\�\0\0�m@�c����U\�*2\�\�O\�\�\��D\��K6����ⶃ4a\�\��\�o�A\�;�ɋ�o&#�>\�o��Yo\�M�u&\�1��Ҏ��Z)Q++��D6\�����Щ�\0q+叉������\�zOՍ\�\n\�\�W�ko$\n�U�+��d���\�m\�į\�ԅJF�i�ՠ\�\�\�Zv\�\r\�ܷC\�S\�`\'�s\�םd�����`�ۡt\�8�\�\�l\�!b\�7Y�o}��xN�\�e\�\�\���m\�-\�;\�\�fS9�����\0���\�\"c��w[�����\����zj\��l�N�c\�\�-Ĩؽ[y!�<�\�~xw�<Ʒ\�ۍ�v?��1mѽ�\�O\�Q\�q�KWg�x��s�ȏ�\�@�r��nɮ�vkXmZ�YM�.R\\ew[QmZS��!�9���<\�\�<\�<\�\�2Ab���\�\�\��,1\\��\�\�;�\�D�>�u�\�\��WfGM|�}(YU���j#\�cw^��<�?P!ɖ\�\Z�	[	?\�\�n�+O1�a1r{�/�{�B�G^\�ͮ,%\�,s��>N�\�V��|�����j\��-\�\�A��^]�\�&\�A\�\0�\��hʎ��֘\�B\�\��\r\�ma�|�~!�&ޢ씶�+\�\�z���\�?{�Ҧ�Z/\�r%��\0Ҫ~H\r��J\\p\�S�6Mۖ�\0-\�\�\�\�\�1\�Vṃ�\�,u\�U\�3�\�c�F��3��b1\�Y\�y\���\�5\"\�O\�\�XB@;�d\�6�<f\�0\�\�<����ܥ���=A�J�V�b\�rXz���\�I�cMM\�\�B5<O\�TYx��:Ԯ�e�lH���Ղ�q	��\0�\�]�a\�[\��3k���\�DN�\���\�J\�\���毐R1�\�6�[7(5�q�7\�~\�{\r�\�\�[\�\�f��\�\�et\�[�\�=\�\�\n�˨���U��)\�=�(�듐\�\�A\0��&��m\��BY_\�R?J�RSO��\�\�Y\�0\��ܸ\�_d�+�%\�4\�\�c�<\�\��\�\�L\�\\z]&���\�X�\'x�D\�&ũ�c�\�^ʆ�iZ|\�7B\rkl\�A\�č\�\�v|��H��\�[�0}ț�\��;mWY%\\�\�	2�1��lЀ׉��\�\�r�m>Ɔ�4Fܽ�%�7\�r\�֠@;F��\�zn�x\01_�{4	bKp7Z#\�-7��\�7\�sv�ߨ\�\�z�N!6\�VTu�\�R�\�ը\�Lq\�G�7p�\�\�+\�\�ӢD=\�@��B>[\� ��چ\�\�P��\�m\�{��\0@�u<�F6�t\�,W\�x\�V\0�_\�*,\��\�\�\�VujXw;X/񥖳Lm��~\�n\�S�:\�\��\�x\�8\�1�\�\�.��\�X�\\�߰\�@\'BX�\0���4k5�Uh6\\�\�\�~I�\�н��5A%��\"u\�H8�1��7\Z{�~:]\"�q\�\�-\�N5�\�Λ)�K\�RƄ�\�=\�q�\�N\�m\�tܪԠY�T�&\0\\�}|V�\�\\0�\�no\�Ĩ���UN\�X\�-}xӈ\��U\0\�X�_\n\�\�\�1�\�c\�륶\�\�o}\�\�\�\���h�\�9���<~f�xv\�\�>\�b\�߽#r����\�8\�\�SP\�.\�}\r\�`a���\�\�\�\�\�\�n6�-�m@��\�lM\�n��w�2t³*\�v���1�ҏ� �\n/*L�E�v�8�D?e�e�QD֋4u:\�Q�\�]\�5p\n\�U�8x*�7�Vc�S\�0nHP�\�ƶ\�O��5z]\Z���p?�\�6\�(\�*EfX/\�?T\�6\�S�;\��\�\��[\�-����i�Llg���US�\0\�\�*~�\�)\rڕٸ>R\�up�P�\0HKs�QkS�\�\�o\�<�T\�\\h��QH�w�̻\�\�\�0�V���\�>Q��\�o�\�j�\�\�c9ǭ\�\Z�<\�|\\h�\�1���Fhz�\�\���� \0!\�!/,Pg�D.ev\� �@>\�)\�V�߸��g\�\�`�V\�\�kS�n%��\�nǔ\�!\�\�\�LV[�޹\"be\'K,\�]`d/ʫ��P2����_�\�O\�)\�-\�,��6��e\�pI<���v$\��V]�߾�x\�W�\�ܪ�ֱ��Fh\�\�,\�[\nT\�\�\�e�j\�\�z����|J޼��jkG�*��K\��ߒ{-��:\�7�ZL\0	ٚ�y^\�ͦq\�B���3�y�\�ߌw\�%e�-\�\'ؒb\�$\�\�be>,_P���eKE�X��/�(��R����I\�\�-W�\�Zq\"5<�u䕇�U\�\�\�3/\�.\�\��F\�GDM\�\�\�\�\�\�; N\"oS��۩����\�c�����\�SE�!\�c�}����ee.Z�JQb�f\�ǨK\\K�33��\�\�\�zSњ�\�l� �x\�$�q\�⨣�\r*\��,�\0�S\r\�M|KZ\�0؉I�\�p/݅Qx\�\�\�\�N\Z+�eJ\�\�1UT�{m���`w�1Yc�\�]-\�b�g(6�\'\�4k\n\�(֣W\�\�|`�#���KV\�$�U\�b!����)S\�\�_(ȧ��}\�\�E/s�\0\�\��]��\��b�U�M�1�\�\�*i�\"j#uR1�\�s\���\�\n˖�RΥ.ȸ�+/�J?\�qQE��\"\�|�\�Ѻ>:\�d+��z�\�Us��<C~#\�\�\�\��\�N�\\Jm~\�\�\�\�xؕ��(�\0�A��\�؁yLtx퍑��6/\�\�R\'G\�\�\��\0Pq\�Y\�s�y\�N\�\��:\�⏊�)\��Q1\�\��ՊA�g\�;�܄\�zx\�-¼�P�\�aZo�4���SH�\��7[B��=1�{�uW.L	�{�C_U���\�$~\��[�\�\��\�\�\�$є>�V\��\0�\�~2���:(8��@!F\�K\�[\'\�U��\�[\�\�\�\��\�\0!\0\0\0\0\0\0\0\0\0 !01AQ�\�\0?K�架z�U��\�D�&D�\�(�\�?\�\�tD�D�\r�XE\�)�H\�ę(��\�F\\4(\�\�-\�.>\�1H�\�?3\��\n+t^\"��ݲ\�Z^\��\�&%��\�\�z��	���$�Yxo�\�b�%�\�\�})a\�А�K\r\�\�\�\�+I)�H\�C\�R]U��+�P��|#>y%O\Z�\�g��\�tP�P\�\�\�	\���۟fE�>	�9\�<\�V�o{�B��c\�CZYkK\�B��ưƊ(H�\�\�}DO�/J?���\�\0#\0\0\0\0\0\0\0\0\0\0 !01Q\"�\�\0?g\�aT9�\�J�)��\�xbȢE�ɋS�I){d�i�xC\�\�0D��+U\�{(Lr�\�c\�0\�4m��/\�G�\'�\'\�\��X�\0I�3��\�\�N\�\�(�\0%�\�+\�Vσw�2(o5ˢo�(ly��\�\�jt�<W%��:��Tt�\�\�,E\�x�\��Y�&6<��Ez���\�e�+\�gq\�f\�z�\�7q�,�:q\�C��hzjG���+^�\�>�;ä�ˮ�\�Y��D|�l�\�\�\�\�M2\�7#SZ\�,W\�oE��$\��\�hryK�{/�XE\�\�\���\�\08\0\0\0\0\0\0!1AQ\"aq 02���#@B��PrRb3�\�\�\�\��\�\0\0?.%VO\"5���!���ɉ+\�*QWA�\�\'���W\�I:�Ӻ1jN\�u\�e\�OC�,[4\�\�O\�/�خ\\�,�2\\�\�\�(��P��Wܳ79�9]˖�ⓔX�&I��)z�jt=˼]ͻ\�vs�M,�\�&�\�ߛ���$�.U\�\'��\�构/q\Z\"2E\�\�xnKUS\�\�]K/\�ߘ�,�\�j1\�/��\�\�\�\�&*\�6��r�.>s\re\�l\�\�fB\�\�C�����\�\�3,f��\�\�qj��˙\�s��9�6Ib	�!�%�IbY\Z=K\�[�\�k����˲\��VD\�\�\�]\�͗e�\�D\�}\�˒\\�.[ӅdLI\�!�\�q\�3\�ń��\�8P��#:H\�WR\�,��\0:2쟱>���~M\�\�s?\�?\�Y\��w�M~\�|\�\�\�/\�O\�\�u\�B\���\�:\�k��*d\���Q\�\���:�\0C�.6\�)��U����K��g��\�\n)ر�4	z\�s��\�c.R��*o\"\�o1\�\�S�Ք\�J\�\�S�mt.\�\�Ijv\"�9�E�\�\�^��\�U<*�ܞi0��+\�I�[A5Q���zn\�	z\�K��S�Y^e�\�\�\�-`ifJW\�	\�>&��]\�~���\�\�R\�\�\ZB�\�#\�u[\�?�xBv9\�.PWEv\�m\rԩ\�\�\�fK�bMu�6e\�+���~GؾhPaP����\�bV�\�L�*\�uޢi�\�\�aҦ:�\���RU%\�)k�5�\�\�Y�R\�5m�9-/A%�S{ؗ\���NH\�\�7�\�fM���\�srjR\�JL\�׍\�koC�%ԫ\��I�\0�z\�D\�\�JS�\�ê�҅UT\�z�\�u:*u���ٔ�,�Ԃ\�3-�!O\nt[�\�o�\�\�,s;\�6[#ed���\�Y!E;��NtŸ�I\�J/�\�\�\�c\�z�v\�z\r��\�/\�CBl��\�(�\r�\�Ó�\�\�ga3>;�\�s/�:�\�._ߡUSmj\�U:mJ\�MUi;�ӫ\�\\Fe4x(iʙ0�w|\�a�=K�	\';�\�,%�\�l�)zp�b�;�dmç����V\\._.�\0�SL\�sU���IDLI��Y.�O2��\�_g-\�.d˯�Kda0\�J��\�Fp7�\�\�ׅ\�\�\��\�E;fO\�=\�۝\�O�.*}>gs?�aN\"͗�\�{�BZ�܊Kߡt�\�\�̗俖\�\�\�\�;\�A\�H�\�\�tؿ�=L�Z{�l�#\�\�FH\�rbVE\�	\��G/�t��\ZrVT:��Es&Z�ɯa\�Y\�\�\�\�t3�\�Y�\Z��2\'\�\�53�d[\�H�\�GrZ\�^�r��ܳO�\�*P�����П�\�Iu����_Ar�\\�z9\�9�\�ʚ~8d�[3+u-\���LhX\��\��\�즨\�V\����x}�<J\�\�\�\�\�Mk���=?)c^\�+=\�\�\�\�˩�-�xu?�\��ȧ\��7�x�Nb\�~�\��Z�}\��&\�Y\�?�\"�>\"�\�°\�\�f*9�Bk�9�_�\�}i�Y�,\�\�=\�\�g=3\�\�\�nHv-\�\�\�#v\�\�\�\�*hs\�1\�F\�\�\n\�\�\��\�hN��etUJ\��fr��-Q�\�dR՚\"�-8*��tY(ܶ:�\�U\�d\�b\�\�\�p����6:�Ŋ��JE~\�k\��b\�	�6\�\��\�ĥXx�9�e�1j\�k�\0r1S�\Z�\�Մ\�oM\�-n\��ֺfs\�\�u\�O��Џ�\'\�Rrr��Ȝ�j��\�$ՒV|{i&$\�\n��%\�R�\�XqC܉L�\�Ⱥ��\�B�\�<��i��=uՊ�\��:V~�S$8d\�Rh�v؊�G�f���R\�bb�9a�R3H\�˷�3S3w\�\�\�<i\�\�/\�\���\�e\�㢿�\�RqP\��\�*T�t����\�R��9�<5u\"�b\�MQ؆rGɂ9�v]_\�֞l��Ʈ�Ԫ\�\�5�\�\��\�W?�c\�Ɩ(�:��Z\�v�e\�ښv�\�MI��T�w\�H\�Mņ�s�[\Z[bpc��%\�_4��\�Qԕ��\��\0o=�\�\�\"k�T��\�gk��\�\�b�E�^�cxL3�\�ރ^\�I\�\�S\�\�q{$as\��©!Y����D*�grsn\�D5\�T�t\�/Z!4˺P\�g���18�\�{\�(W\�\����rB�\�\�~\�5V�\�5dtܾdQʷc�Q�\\r:s�\�\\��R��D\n%�l�v<>\�\�P��1r��)�3a*4\�v�\nR��G%jt$�=\�CDVYX\�DG\��sdj\�,KIW����\�\�T�Q^���kbiln��tՖxP�\�v�\"K7��W�d/�*��\�x��\�ܹ�\0R2u\�T�ɋ�7��!\�23Ծ\�G���\�\0)\0\0\0\0\0\0!1AQaq����� \�0\�\�\�@�\�\0\0?!5\�j\�ys�y6�#�F��W̡̼�\�\�\�\�4[ķ\�\Zsa\�\�8e�\�\�\n%��?\�R�J\��cи���*T�\�[�\�7\�3!�y&\�6��)$\�\�>�> �m�ɛJ]�ў\"K̊ʻ\'\�1I�nP�\n_\�W��u\�X�+ҢD��\�GG\�՟�\�:Mˬ\�\�g4�\�	e\�`\��\���zDS@sP$Ґ��5�Rl��ȄJ\�\����\�c_�ߴ\�\�ԩ�\�M\�U,\�\��\0��\��\�\��\�&]�R�e��q���Ӹ�F\\~\�J�M�ցȩ�(\Z)\0\rؽ�E\���\�ޗ���\0��I(\���\�>\�I�ܹE3|�\�1\�\�	]���}{F\��~3�a��3e�n`\�\�nVL�4Gۃ�n��\rq5�c2\��p@\�\�i�Xw\�#��9a�\�\��\0;�s0�5\�y���L1A�l\�q\�d�\0D�sXd#GM�3�#�\�viXt\�woD��\�7u\�\�\��^s>ge\�,)�G\"o���&\�}g<?�wi�O\�jyy\\{MӒ\�E�����t��O�&�33b�D\�Ox���f\�A.tjT\�%\�1N\�\�3h\\w2UG\�+쳻�mc�\�!^\r\�\�����\n��e�u(\�����ġmԯ@ld=\"\���44�͔�\�\�{#^\�\�\��փ��\rM;{`�\�5\0hs/V僘\�Ns14W2�\���UbEML�/Y\�cZ]x�p^\"\�P\�\�\���j�q3��<�\�W\r\�2>���D�F�\�2\rF\�}\�\�]\�Q\��\�\��8i�,i\�\�\�2\��k8T�S9\�*\�򥈙}c6Z\��!-MO�()1\�[�\���J\r̂{\�\�A�\�<J\")ܭ\�\Zg\�_IET-ȧS�\�ccv�\n�\�y��ݼ\�7�̀w\�bR\��?ܶs�=_�1Z�RFݨz\�yX\�v��iĲS�_���@xT���+\"���[\\\�, Xt��\�s\"pN���r\�\�#��WCL�Z��\0sqt18�g\��0�\0H\�n\�9x�s\�\�+\��+Z\0�\�|N\��� H)\��\�9q��a�e5�\�5���Cp�u�\�J9�\�8\�3j\�*\0Z��9��\�y\�\�K\rP�J�\�\�?\�\�B`�^\�pZ�K�W2\�Ҷ��i�+\�~�42�jR�\��u�Kc�F�X5�\Zr���tO��J�W�:�\�*acD�8튅�W;\���\�λ�\�Dlp\�]M��ܺk@�\'.\�\r\�XtoV��ayb�\�b�8��x\��;�z\�:�w\�Y�0m%\�]\�x\�p6g=\��ǧq\�L\�¿�(^y\�D+gSgDH�\�\�\�Y�1\�\�\�*�Q�����\�B�\�\�\�<u#yz?�Ĉݐ\�ɂ⥪x.�i\�\�C��,ʀ\�m�F�\�\�)^�\�\n7�\�Q �\�\�\n���:\���\�(r\�-+\�D�4WZ7\�[�K:u\�P���\�\�\�8��𗚔\�Z�<\�\�\�:J>\�8�E\��9�+\�[Y�\�\�w~v�eڮǙ[��\�\�y��4�+~r\�BڭBr�\0�\�\nWI �X�\r\�\�)z>��̑�B\�A\��e�\�g\�\\��W�*}⛢\���\n��#0ª��ڱ��%6ڿܨ��\�\�K2��?��9\�3�D\�+�3[��$�8�㫀l\'��x\�1�\�\�-v�_���Wuo��\�\n���&$=\�IUPd\�Y]�)��gP��\\\�L�\Z\�s�j��sS>�/#x%\�D=V,�qc�q2\��Y\���`��/��\�Z\���\�\�#S�`\rdc�hf\�τQ�(F9\��h\�m<\\�/���\\\�\�f	��\�a�Gn\�J\�\�i\�`�면}�P��)\��\�\�a`�\0��*ok���9P0pyH^m��\��\�;_s �\�\���z�O\'�\�%{�/�m\���\�W\�\\q��qf7��g@\��e��Dm���\n���� o\�L\�X�\�R\�\�*eeD8\�\�pZ\���̢\�=���3\�\��Vm�I}�*\�c� �a�\�@���\�)��j�j\�9�Oi,\�Z9�c��\\�V\�\�3ka���\�\�pS��\��\��oQ� �n\�L�\��0,\�\�\'y\�\�ҕ+\�\�K�\���.>��\"�k��~���\�\���y��\�_r\�6\�ƈ��i(:�*e�\�\�S�h繋\�o�P��\0��L\�|B�D��\�8\�\ne\��4{b\"YI�s2\�)5\�Tc(;x��9[�,\�\�\�^X\�\�Q��H�k}\�\�N]{�480��\�s\�(%�\�߉Z\0\�y���y\�{\��\�m��p\�\�\�pe\�>��lQ���\��=|O��^\'\�qyE\���\\�bV\� ˇ|�xa\�s�\�Q0R\�g\�,<w� ��_5�jަu[��\�=\�\�b-\�\�\�W\�Ԗ��\\\�\r��{\��	f��\�^\�g؂9s�B\"P9\�\�\�\r�G\�\�%ECxC\�\�\�l��!A*Ls\�/\�\�d�p��~�\�K\�L]O��;�WQm(f\�~���\�\���y\�\�\rg>X\�7�Fo�3\�ʼ\��\0bm\�2Z�>\�\n\�\\)\�\�;\�_<����\�T+r\�k�r�.18ʞQ`\Z\�\�O\�\��%�\�k\�^>�X\�\�jZMٷ\���\�\0\�6\�(�\'\�+#bjXߴV��_\�_�\�˅\�?axL2��#��j&��\�Ճ\�\�M�\���R\�=�JL\��s�Z\��q�\'\�31&B\�,�\�EN\�G̫sl�ĿM�\�4N\������1���R�{~9�h����B�q�\�*�f\�\�~&�א\�e\�\�[�E�h\�\�\��Q��\�*\�ji\��2?\�j ~P0\�\���㚗�F+\�,m\�/�f�o� ��x��x`���\�\�LE�}��|��\�K>&��|\�<\�C���I�������-\\yW�Gp�\�u�\�f�Z�r4��\�\���\�\\v�z:�H��}��N\�0\'�>\�\rٽ\�k1\�z\�/��I�ʗ^\�\�\�e>s5\�j\�/�\�\�ppK&\��\�\0�q\�\"#57;\�S��%��\��u\�{+�L\����g\�\�M�{q�t\�ItB�:��m\�)\�\�[\���[r�\���SRn�\�0\�c\�$�^�/�,z�ؿ���\�+\�[\�\��X\�,@\�\�g&\�	y!ї\�\'y�`���ٵwz\�+��\Z�Չ\\M\�\�s+N�V��\�F6�@T�+\�\�\��v\�N�\���\��K	(\�^\�\�#U\r��i3ĸ\�\�#�)\0�)\�K��YɌ}*T�&e\�>#�>h�\"�\�ʖ^��\�g�0X��[O\�	�\�J2\�5�\�%��5g�\�	\n\�o�򁾿P;vo���\�\�ǎ\�|\�\���Lm̍��_mZ|\�*a�<�e\�\�co\'�lbey�hDu\�\�G\�;�O|0�\�N`̴��7\Z\�׮\�\�K$J|\�\�E\�?\�K\�YA�/*Լ�c\'�Sd\r\�<>c\'�.,\�F\�8�efϬ`\�q���\�@�\�T\�\\��D�E�1�o���N\�\"\�/0\��B�V�o	��\��pns\�_�9�\�Y�N\�)�#歇�(V\�Ea60�}\�jl\�-/��bQ�\�\�U\����.��b�\0.�ıt��K\0?�\�\�\����ۼ\�-�\��\�Oc��ߐ\�\��\n:~�NS\���\���\�W\�p�,^��u\Z1�@9Y\�\�&	\�P�n3\�EN6�\�\�*�����)�\�\�Q9N�d��\�I4�\0��\�5�\�z�^�l\n\�\�m�S�W��\�\�\�?�����\�S��U\�\��˖\ZI�cv7\n:�4�/\�-�C�Ь�\0\��M��iM�p�\������\�FaU\�3FW\�`�&+�ȁ�J��\�,7]��x2n\�\�.Z\�\�8&5\�G�NFF���Q\�\�6A���.A�\��8s3�BE\���6�\�2�\�D\�\�i\�ah�\�\�\�e\�\r\�k9�T\�\�̬D�/\�Yr\�yĪ\�P��\�`\���<�\���l�R�s�\�\�!�a\�G<f~��\Zx�7\�q(<EfQ\�Nc�\0s��*�\�y�z�C~ \�\���~e~\�\�1�@]:�\�\�\�2utc\"�/\'�)����R�\��\\�\�EJ\�7Zh����lv�\�}\�}N\Z��\0S01Y%�W�h��Vq2\�\r[�\�p\�\�\'d�7\�}LB]��b\�y@�!\�pC\�|\�\n5\��\�˶o4y[b\�\�ß1\�\�2��Ʀ+P\�\�}7B�]�WS�J\�\�iʣ\��\�\��\�j�\�ێ\�\�Af:��n2皀���\��}_\�\�ժz��\�f�0;�X\���\�B�uk�D3@��\�fʦ׸w8�p_O�?Vd�\�1hC��e_�\�\�j8��L&�\\@	�B+e\�\�Qf[�V\�L\�{\�z?\�R��ъl��\�\�Y\� ǈt2�{\��U6Q�x\�j\r\Z�~\rm\�\� �@\�uF\�$�����\��W\�>�� ��\\\\D5�\�\�\�:�\�6���\�#H^|\�d/0fu��	g\��\0S�v�>C�Ĺխ�����F��Zj3��Gy�\�\��\'�ٱ,&?D-\�R\�\�uO\�Y�w��K4\�5:VI����2�ﴰQ����\0�[��\�\���\�*2�zR\��Jz\\&H\�\��ǴV\�\�eQ�X�\�+�0)}~H\�I\�uX�P����\�_�5L4\�B׳�QB\�\\�\�\�\�\�`-*�\�É5\�6<A�8\�1�\�%��5Im�\n��*O�Q\�n\�e\"\��\Z\"��V\n�`\�\�Uk�1\�}^�\�\�\�H\�%�`�V��٩X��?\�l�l\�O��~q˖��\�Ah�b+9��^�\�a\�b��ṕV��I�\�Ǎ=\�M{\�|\�\�SU�|��W���ɜ\�X\�8�@��%C�\�\�f��*?\�gl\�4Kر���b��Mr���@\�\�(�>�\�\�?�E�?h\�\0���\�u��\�-nRH\��mV|�,a��\�Z\�y�ӗ+p�u�G\�1L.���\�=�\�%��(�\�\��\'9��\�\����F1\��\�p�\�\�\�𩏵\0�``�ZB�?\�\nj�D\�͟��\�A\��\�\�b~(�9\�8e��a\r\��@7mB�\�ǔ\�\�W��\�N=\'�\����\�\0\0\0\0\0\08i.S�`!V�R�ycQ=�>\�1�%\�}�\�\�\��\Z�p�n\�9�����\�t\�Q�\0�rN[f{�U:\�$�\�\�H|�}J\�\����h��g\�)3��\�\�\�@@T�tǚ8>�e���k���W8���2Xٞ~J�VM`�3�cE��Acyt\�ƍF���\�\�u�\'3l�G \�Qh\�7�\�\�_re00ڱ\�1m\�|�vd��\Z\�$ĳ\�\�\�\�̀\�\�	ۋ\�/\�Y�8��\�����\�H�\�~C\���=\�5{н\�\�3���a�\�\�(x�\�\�Ē�\nҼ6���\�$0D\��\� Z?#��\�\�\�٢;9�x��R9�P9�(=\'ʥZ\��\�\0\0\0\0\0\0\0\0\0\0\0\0!1 AQ0qa�\�\0?SF=kBF\�x[\Z�h�n)JR�+�D&��\�]`\�,�x��Ҍ�\�`jr%�	\�@�J���AKa�s\\\��h�t\��?�D�\�C\�CTp[�[c{\Z�\�p5H�Ą1G\���!2Ah|\Z�CTD��?�::\�\�b�x5�\"�&�8�%7�\�\�,h)K��O\�\�\�\�!�\�\�6&z7e\�\�\�\�pl\�67�\r$<\�&\"�\�\�ѻ\�\�[\�hƳ�Ѣ���\�]D�*#\�\�El�\�	�B|C���\"���\�W��u\�\�%\�+wB�xҋo1GO\�0\�xbp�\rj������k\�1)\��f\�M�z\n:5��o�(LcQ�\��A*�<R~�G̹)��K��,\"ᰬ\�e8h�(��Co��<d\�o�5Q��Hs�KxB?�\�\0\0\0\0\0\0\0\0\0\0!1A Qa�\�\0?X\�m!�>\�\�L�$X\�\��6ǎ\�\�Y\��\�⸶�>\�/�\��[\r�o\�/-�\�]	V\�\�z-H/��,H�\rܛi�o}]\�\rǳ\�\��d�l�o������\�:A��ۣgre\� \�{\�N�\�-�-��J{eIdÑq/�.�\�-\�\�\�\�@\�?\�Id�J\�[\�_v9\r��\�\�{\�\�q�NbͿԶ\�xs?W\�~\�.-���5,j\���\0Y�\�\�C��vݷ�\�3�]�	�7Dw�P�)ּ�\�:\�\�\�y\�CۿD\�D/�<0�&\�\�,�^O\"\�\�pm�|�u�,������I\�d:a\�*yg;\�\�t^�$�  \�\�\��3�	\�P웕\�xl\�J�=�$˄xl��\�p$\�\�m�/�\\{�\�1�ehr�$\�\�\�x\r�~�B\�\'���Q�,�\�xV1{\�M��^3#��d�-�a�\�vX\�3\�Ρ\�\�r���0�e�\�\�\�\�f/�\�\0\'\0\0\0\0\0\0!1AQaq�����\�\�\�\� �\�\0\0?-���\�LP�2\Z`i\�GD.m\�v@&�\�1<�\�\\��0Z\��B\�9\�1ݕ\�	nP�nۉ�0Ǜ�\�J�ɚ\�1rr�b�\�-�\�/_A��\0\�S\�\��#\rSL~��\�\�\�\���3�\�o	\�\�*>C��Pǎȋ*\�\�ī\r�\�\�\�b	U�~\�a#�{�#\�wܺ4\�F7��Ī��\0�$3�|\�Iw\�1I\�-���Kk �\��J&G�pQ�\0��\0\�>�\�$����?C|�\�\�b�\�`���ZG�Iz�\�\�\�+y\�P��p�Y�\�޿������@��\�$�\0:���\�]�\n�-�\0f�\�Q�-�da99L4A�NK�V\�\r$KE,�(q�$\0*\�s\�wA���j�-Uጹr\�2\�}�9�r���To\�\\����#\ny�\0\� �\�`� \�\�J\�\�W�Pv\�U\��\�U��a\"8(T1��̄S\�l\�\'�g\�R\\u@\���Go>�\�\�G�\�\�\��F ��\��0٫D!���\�\�,X\�.d\�\���\rB/��f0�.1�eJ�q&H\�2輢aM\�\�\� X���\�\�\�9x\�ox\�u\�\�P\�q\�\�ƻ\�\�e\�\�C*غ�\�\�k<ҿR֞�\�%\�P�\�T\�\���\�,Yـ>\�\�\�\���*\�K�\n\�8\�\�#\�\\��\\pk\�\�\�\�\�6\��遒~c\�i��)]\�g��*B�O�\�3��1�`�H���2R\�?\�\�<e��t\�Vfز�j��<�4\� Z\�\�r�\��y��ׄ:�T��.�\�K���\�P�k\�z\���`r\�\�/\�\�l^\�W\�\'\�\�7�r��?�%��v�p\��\�j)�M�q���叔�L�ћ\�Z_\�\��I-D��}7\�u?O�\�\�\�?E\�\'I��P\�C��R��\�[@Q}�F�\"\�\�\�L.�m\r$lA�q�&�GOs�MP~А*Y��Ȳ�DZ@e\����\�\�c�V�Cè;a�\�\�\�u߇p\�\�F1~�W��a깚\�\� \�0��E|>aw��ǻ\n�\��#)�6xez��f�̺�$ {\�\�ۈ�f���\�,�fވ\�fi�\�\Z��j�\\�As}�\�W�+#\'\�\Z������#�jTs\�Te�OR��(\�K��\�\"\�I\�]�Yh\Z�0G\�\�`!��\�\�*B�\�L\�X�<�\0\�J���\�\�5k�\��QNn\�\��\0�L�i\�/R�X\�P�\�\Z��*��\�\�#\�\\\�\�\�2\�-_\�uĬ�Q��&y.��\�^Ի���`5�\�Q!��_0E}WO�\�h۴$a\r�;KنP�\�5�[�Y\n#Y3\�J�J��\��0\�\�[|=\�uk��ȕ%�\�S)v\�\�Z\�\��ù\0Z����k<<D�*TH#\�kY�Qf\�1V\�9�\�:�\�*[�h\�7:j�q^Y-�8��\nw��\�\Z\�\�J\0a�T\�|\�f2�Gw\�\�\r\"˷�EfCx\�˳%\�:�e,\�U~\�r\Z�S\�\�\�ʣW\�C�\���c\�-{\"��m�\�÷�\�q�5\�Ge|�\�y�\�\�\�@�\�_#\�\rs�\�\�\r^6\�\���{{%�^�\�)N���PG�W\�,��l�\0R\�?$\�M\�iݯB�H�о;�A!�&-&�\0eW~\0|\�\�墧\�bbk	[�\n�\�\�\�%b8C\����ps\�0r�\�a\ZN�]*}\��\r\�)*\\��GrA�Q�MlR��_�8�\�\�ƪk\�T\�\�\�7\�U�5}\�ëC�ݾ�\�7\n\��FpAW�\�fX�8��\�\���\�ld�~\�Q� ��LN�K�\�\'\�6 hh\�\�p=}�@%k�\�hJ\�4u.�p���o1\�|�Z�AT\�!k#P�\�+Z��Sy�\�.���~\���y	Nw\��\�f��b\"X\�//R�0+s\�b���\�U\�c2��\rj�{_��bs��b�\�\��	����q*�$:X. \r\�0\�\�h\�8�F �v?\nE\�n�n\�9\�\�\�\�A�`ͽW0\�(脝,̕�@���ʺ|Lc7\�\�S*[D	N\�v\r�\n\\��������J�2Q\�+u0�]F[:�����7�\�t\�\�E�)N,]0>d��Ko��\�\�4	\�O\�2R�E\��\0�78�{!�u�C\n\�H�\�\n�Fz\�\�fX�8ۯN\�8���~ؖ\�P)m����!t��\�7\��n\���VaC�J��./��\�sG�\���$���@POP^T߈\�\�m\�<G��8��\�/\�+\��`=\�e�G�A\�#mrx��墘�#ōx\��S	,��_\�\�5��\�\�=Lp|\rE��D>\�,\�O1?(\�ݣz\�6ZW�Qf4\�`�\�w\�!	Z��!`�sW�\�9�\�\�\�fU\r��K9p\�\�1A��n\�Qb��\�\�\�\Z�)�\�1\�;\���֠\"�a�\�\�$���o�m\�*֥J\�s}A[KAG��= ]��ߩ\��RX�}��\0P\n,\�w���8:2{[��.\�\�?R�\�r�\�G�{�g\�e�be�\�9쵵((A�A��#j�2��\�\�\n\�6pW\�1V\�w3SԪ7u�~\�-��\�R�}�?\�3k�h�+��\07\�ra&����\�0�X�⒏�h\'!a_\�].ث��f%@�\�6|\�/*V|��<\�W��\��\��@NY�\�_̠+QW�n&��\�خ��\�\�Y8�b\�s\�3�\�-�s�m^\��\��	�)Ȧ\"��D(o\�׸X\Z�\�}ˈs\�Orʐ��\\v|\�\0j\�e҇zs.����c@���唔1\���b��\0��\�.~�\�\�m\�/��\�\"�]\�\�e\�(E\r�\0luc�ۿ�\0j��eg`X>m\�\�3k?��\0\�\�\�e.�\�F\�\�\�\�LN-�\'�R�ox\�\�쬊�v�\�u\0\�\��\�\��l�h_�}zt��`EN�q�\�񇣶\�8\�\�\�ų�0�y�{#\�u\�RRL��<���\�\�\�W]��\���\�Mv\�\�>�N�#\Z\�\�X���,5V\�b�f\'q*��N�/��ӡC<���ʣ2�\��qٵ��Тݞ=\�i:;C�G\�	Z�6\�\��e-`^�r�K#!\�o��\�O�\�Z�2M\"�/q\�1�̥,\�/�����٨\�3\�\�\�?%�a/\"\�\Z7�\�\�\nbhV\�\�F0�\�\�k\�{y��Ҿ}Et{\�tx�\'\�ϿP%6Qv\�}���\��Y\�\�0�5\�QQ�+\��\�`a\r�\�(�vK�\03(UX>\�\�V��U�8 킈\�e|<\�O@XpĮ\���\������J/-�A\�k\�\�\�9dq��7ؚ�pG-{,\�.\�\�(\�\\�_�(a8\r;~�oY\�zJ\�dص�\�\�\�%�շo\�\�\r�\�\�\�\�\�(V�idu�0�\0\�v�/qq��FHCq�/��lrʎG�FTW���\�]_�4\\h�*�++\�\��\0�7DYr\�\�+|ELOW���Ø�t,l��R�5\�~絁\Z҅09�3r\�+��QFĲ��\��\�I]�h\�.�(2]\�v�2s@:\�X֞���Z\�ڿ\��\�\\\"\�:<�Z<v\�Rq\��&!\�\�,Ew�=px�\�\�Z>˾H���W�X\�o\��,D��[\�j׃y�4/\0`�Z\�\�Y2�\0\n<�ډ��\�#���go/3�-\��n	!\�\�R�>\�#U�\���	�����\�BeЙ\�\�\�\�)h�=z�a·�L-]\0n0_zl\�>]ASU�\�2�p8��ճ��\�h_\�p�?\�Ì\��\0�ga\�\�5�\���\���P0[W�X\�ŷ\�x\"aP>\�\�W�&oQa�~aAڢ\�6B\�\��\�9��\�\"�^\�#\r�/\���ݝ����\�L��\0u\�Y\�R��\�\�\�\����^W��_\�p*E\�\'��\�z*0���\�kv`q�Kxk\���:j\�\���\�w\�S�y\�b�\niä�UYϙw��g�#\�\�\�3�X\�ǘ�eD\�PŰU1SZ�m\"\�k/Z��\0�#�._ml0\�\�R�k1��\�1��7{@ԭRf\�<\��l\n�\�\����E�9�eF\�\�*	�g�\r��\�V�Q�c?\�\�\�\�i\�4\��J`�\�\���kﴬ\�gE�a\�\"^Qi�9�{�\�	���\�\'p��\�\0a��\"-�Q��\�Ö��������&�><�\�PK�-G�e��×�����\�\�\'˰�S��c\�0j��\��\�h\�\�\�\�3b)P���̠�WPK<P`�/�\�\��\\EWr\�G�\���|F\�Je\�s\�\n\�\�Wu\�0\�\"\���\�U�1�XQ\�ev(\r7|=\�#K\�\�\�\�� -�~	u�	\��\�\�Suv�\�\��h\�S\02�\�/Ms\�K\�(Q��\�(_g,$̴8��F6\�|NFǅ@��\�8\�T\�G��\0�S2`B8�J ՠ\�X<�\�{�-*\�\�s38U(\�\�|J8(��\�A�\�.x�\�̨Ƴ	\�e�%͏v\�\�,0��,�\���{B�a Zh\�\��\�:\��+�\r}����\n<V�>\�B_u�0�40Jؽ��\0��\��\0ȉI\�\��̽�l\�7B\��&6\�/�\� �Kg|\�-��G|#�Ɉ���7�`�r���\�k�o1KE�\�\�XcA�!�W�\�L�*Q0}�\�PfZ?��CZ\"\�\"1��\�%0<�\0��\�񵚟��&P.l�C3��\�\�4\�e���\�Qx�\�\�\�3E~!G6B\���\�\�3Y��j)���ீ\�\�\��(9\�>8���(k\���+\Z�K\�\�YE��\�ُ�\� >\n_\�\�\���\�\�x\�U�A�\0�}��dej��\�DUtc�������\Z[�!2�6\�zss4.\�\� gj�����\�n\��\�\�\�\nhk\�Oe12ќ0`\�H\�6��\�\�ԱZl\������jz��%T\�P\�O��Y�A\�\�︗(\����\�\�\�\�\�q�\�Pp\�yj�c\�-�G� |\�ŭ(��\�\�At\�q3���\�q\�\"�\��\0@B\�zHkV]�\ri�q\���BM\�#\'/�\�U�vK�k\��b\\\�)nC����ӯ.�]Ƙ-�cX�\r%\�\0\�s0�;�\�\�\�<x\��\�\�\�\�Y\0	s/@�Ү�\�V�\0�^<r:�m\�\�\�4�Q\�+X� Dj;:�lh\\0T6��\�\�c�\��GT\r�)�\�\�OW�FL9ؾ\�\�\�~��l�D\nk@�s.\�yw\�\�TN\����[@�\�\\nʩM_^_\�\�Z�5\��\\\\f�TkS^0u\�\�3\�JP\����\�9�X�\�23\�-�TV�U�����{�Z�r���\0u\r\�\��N\�spP4\�5\�u\'	��D׆���4\�kdJ\�Qd.{лKә�\�aT\�\�̝\��f<*t�\�\�=\�<E\�ű�\�^gZ����4��09�\�\�s\��P�t�}\�`U5�\�\�Nk��0Z�XB�\0pf�\�Cn��q��p�AO\"ʦQ��{\�\�3#\�3�^�b\0����O?�p \�d`U;F�\�ƺ2�c��+KQ\�5()�Q��{,\�\�\�hn�5\�\�Gu\rF\����vF\��	^ ��\�r�\�%�\\�\�\�ge���\�6\�Q�\��j\��\�\���L.���<Le�\�ybBmU�\�i�s�:�}<�\'\�\�Ԡ`�gn\�\�L\�\r>���\0�.\�\�Ymk\��\0\�0\r��`�UlRG(W�\"\�ġ\0�ơ\�>\�׺\�\�_\�5��2�䌂p\�\�Z����\0(���xܻ�4lu\�\�u(�E�,\�;z��L:8\�T%��\�\�\�T;u��\�P\�`tg\�nZJ�\0�x\�vu\�JI��\0�-\�\���a5gp��C\�BԞN<1�w�Ǒ�a��3\�\�S	J�\�D�LM�e����8\�\�)r�e#Mۄ�\���5�\�`\�)\�C7\�÷pc0�A/\�\����\�\�t{�\�\�>bDڶ9b0\�\�\�\Z\\hRE+{\�\�:\�bV\�e?\�$\"��V,�\�Ck�Ԯ4�_� @n����Z\'�O\�>\�A\�x��+&�	\�u7�&1��׉R�z�>a\�9��\�\�~7\Zs[#iƿ�p���\�y�Z��t\��\0\\\��\�wX�P�rb}ű�\�\�l�^\�8Q`e�wHs\"9�\�h�Q \0)|�\0�5<�\�rx����w\�̩l����\� �\Zp��W.\�\�O�ˎs;�\�b�\�e\�_2�⪷�\�\���\\\�ԱvVJ��3C�\0�\�:��h\�)�\�\rr)��C\�\�\�?h\�l��\�\�4��1\�Ϧ�X��\����)T��\�	w\�\\�Xb\�Ζ\��R(�b\�y�~冨p\�\�ZY02x�Q��K*�_�\n\rB0��\�NP��\�9�H�\��3�J�Ľ���ȫ��\�<4.�\���/��<Ċ�&,п1͠~�bm��B��\0�R\�]���A��O?Vd��\�7`\��+�S\�\�!3W\�\�\�\�\�\�Ur�ץ\�F\�0@Z��\�א�:�\r�� 	U+(Hܡ��tK9s����� )�\��\�\"R\�\�y\�2e\\*\�\�\�L,Py\�\�\�\�d�\0���WK�C\�\0m\�\�F}G3\r�o\�\�h\���T-��\�H,wDHY:s�¡\��\�K�\�\�\��[=~w\r~�\��\�7ɗ�\��u\n3Ŷ~\rv\�\�[!jľ�_v�\0��cș�M}��\�\���\��\�\�\�^#�>#^\�9�wFj\�,<ءPvEә�.6l9^%\�\�qS��\�\�\��HO,�b�����Y\���{c\��\0C�\"�Rf|?�xA��\�-)Hp/�\�^E�\�_8���\�c\�8G\�\�堜��\�\�y�s\�dJ\�\'�E\��h!h\�\�ߛ�)�\n�\�֊DT+=y���\�c^��F����.�\�(���.\�=\�\�Ɯ\�AJt|B�Td_�\�Q@戶_3\��͋\��3\�|\�}D�\�N�:�\�80W\�\�\�֨���:Tt\�\�{�C��C�J��\� \�dR&\�\�\'\"s\�k�4E��\r�ĩߠN\�Ͳ���y\�\0X�+���BC\�\'~\�֮_\�p�\�5�[�����aT>?�K\�cǯP$X\��aL��R�E����#�6n�ź*0[0\�ڷ\�\"9r�\� ��B��:��\��(\"\�\�}B�\�8\Z\� \0�ty}KQ\�\0\�\����*\�W\�ݿrʄ�/�\�\��\�\��?\�L\�95j\��2R\����\�����P�\�B�\�{�\�^2\�\nxe\\�\�r:�@\���k�qR�\�ƭ�?\�@V\�b�K4t:^\�Q�O\�?����@Ua��G�\�\0k�]\�^��f�\�kLW9v���%��rѢ|�&E6�\�U�\n\�\�\�-R�G1w\�^e�.\�s�S�pg���,\��K��~`ղ\�/X�M\�1S\��1\�1�\�\�\�\�].1ˆ��o��\'\�:�EZ8\�c\�\n���L�@�\�\�\�\�t8|�\�\�V`,�U\�\�\0�\0��\�V���T���]�n�\�\�*^�\�\�E��\�=�]Z)G�����N\'E}���c��H;u@��\�\��\�D��\�\�qn-\�	�\0!\��R`�\�\�07\n�g\�VV�\�?r|J&`�\�\�N\�J��\�9ev\�#KIX�\�)\�\�$X\�\�ˌ�ĝ�\�}8���\�\"v\�\���G\�%M�k\�\Z\�W\�\�\�T5�M?֞\�q�Jݰ~e;��\����Z\���\�C���rE\�lb:�\�∔�9��f�m��q��t@}Q\�l�W\��ܬ�ïPa1�S9�k2\"\n�\�j\�\n=\�(\�m�\�\\�A\�R��b�k$(.0Z\�\�Gў!�Ŗ,\�\�\�/1u,�k;@\�7Y~\��r棻\�Ň;1\�\�Ø\�\�m�\�)ˈs�\�\rJ\�\�����Za2h�1߸�u�P>�y��4\�\�\�K\�KwE\�\0�\��\�]\�\�rN%��\0�hf���*𻈚\�\�u\��12.N\�$Yb\�6k\�p2J\�њǘ;�����\�',5,'Canino','Ovejero Aleman','2024/02/08 15:26:06');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('003ccf5c-039d-4a7f-b6d2-dfcdec4545eb','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'420ddaab-3a63-4699-b9f4-8908005b4d2f'),('065914a2-e1ad-471c-99c9-61c54b589d02','email','openid-connect','oidc-usermodel-property-mapper',NULL,'87f6652f-369b-414e-9875-a3eca71e5e43'),('11c34177-0d4c-4d9d-837c-7dae6b73f612','address','openid-connect','oidc-address-mapper',NULL,'05770ea4-1bd5-4987-a024-2dfc6a00c2a9'),('1f714251-0b5c-42d2-9722-453f24bf5900','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'dc51d139-a633-4316-9fa7-470e066e3970'),('2c6047f2-9a10-4ea3-ad9e-427566d2cd2c','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'57a47430-5051-4d13-8a5f-ffa4cd948e03'),('2dcbcca1-443e-4479-8566-5645aa40eaf3','username','openid-connect','oidc-usermodel-property-mapper',NULL,'420ddaab-3a63-4699-b9f4-8908005b4d2f'),('30624f5b-17c0-4084-a6d9-40c8adb72980','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'782ddfc4-2284-4fd8-9f02-405aa63d24d2'),('324a1bc3-3e39-4616-b135-6e7984d354a3','audience resolve','openid-connect','oidc-audience-resolve-mapper','cac694e9-3144-4988-890c-9d0702b1496c',NULL),('37291530-bdc6-420b-bd79-a76234ba829b','locale','openid-connect','oidc-usermodel-attribute-mapper','e885bd35-65c4-4a6e-a1f5-ea7f157de58d',NULL),('3b087064-cfd3-47a3-a451-9361381e8413','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'782ddfc4-2284-4fd8-9f02-405aa63d24d2'),('3d9097be-1ba9-49ca-a20a-2c6ede63a59a','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'420ddaab-3a63-4699-b9f4-8908005b4d2f'),('482a5188-49b9-4e64-96ce-63a0b1ecc5ca','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'782ddfc4-2284-4fd8-9f02-405aa63d24d2'),('498abc39-fcdf-47fa-a458-8e7de74192ab','email','openid-connect','oidc-usermodel-property-mapper',NULL,'dc51d139-a633-4316-9fa7-470e066e3970'),('5176467f-029b-4052-8edb-611aab5b5cab','full name','openid-connect','oidc-full-name-mapper',NULL,'782ddfc4-2284-4fd8-9f02-405aa63d24d2'),('55fcd7a2-7721-48ad-84be-a8a0fda019b7','address','openid-connect','oidc-address-mapper',NULL,'f315d53e-ffc1-493f-b8f6-d5c4fc686904'),('5733241e-a4e7-4c4a-bb24-2d371aa3bf48','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'782ddfc4-2284-4fd8-9f02-405aa63d24d2'),('5adf6ed5-30c6-4e08-81f4-a2dcad181f60','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'782ddfc4-2284-4fd8-9f02-405aa63d24d2'),('5af47fad-508e-4d4f-b984-ebd32ab88747','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'b1c1b93a-b05d-40cf-8cc2-ee2d87751fd3'),('5c7cc594-c33c-4f4a-8a44-577bde28b8df','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'b1c1b93a-b05d-40cf-8cc2-ee2d87751fd3'),('5f400dc2-8321-40e0-90f8-dcd8eb027e35','full name','openid-connect','oidc-full-name-mapper',NULL,'420ddaab-3a63-4699-b9f4-8908005b4d2f'),('6374194f-21ed-4ba1-96a2-7e2098792cd9','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'4a269588-bd90-4609-a2d4-ebdc434a900c'),('63bf65fa-9abb-4e2d-8ca7-b5e250fe39f8','locale','openid-connect','oidc-usermodel-attribute-mapper','921e042b-0a48-44c5-aaee-a99354134698',NULL),('64ba1bdf-2d83-4e48-844f-388301e2ce47','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'b1c1b93a-b05d-40cf-8cc2-ee2d87751fd3'),('695a2063-6e65-46e4-b922-b99c450739e0','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'782ddfc4-2284-4fd8-9f02-405aa63d24d2'),('695e38b7-83bb-4227-bbce-b6d21100da6e','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'9ba43097-a075-47a6-ab4c-e001d0596740'),('6a0ba69b-15e3-4bb0-bf91-729bcd8cd1af','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'1d6df13c-1ddb-46b9-8e94-a46b24f6f734'),('6bf105c8-fee0-4d22-a008-add0f4e5da77','audience resolve','openid-connect','oidc-audience-resolve-mapper','96049ace-2779-4b7b-9108-60f8f945b911',NULL),('6d175aab-65a7-4414-8364-9fca6dd462cc','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'420ddaab-3a63-4699-b9f4-8908005b4d2f'),('73dfdaf8-94fd-44e6-8c62-29fd015a6903','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'420ddaab-3a63-4699-b9f4-8908005b4d2f'),('7d8b530d-eab1-4aae-9c33-58adea98ca5d','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'1d6df13c-1ddb-46b9-8e94-a46b24f6f734'),('933a12dc-bf37-42a4-910c-a9fba2f07a26','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'782ddfc4-2284-4fd8-9f02-405aa63d24d2'),('9ea785a3-6180-4626-b12c-9fa46b1e496d','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'9ba43097-a075-47a6-ab4c-e001d0596740'),('9fbc7507-a647-42ae-a4b5-63a494cf6a25','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'420ddaab-3a63-4699-b9f4-8908005b4d2f'),('a02166b9-8eb0-4b64-8439-0add24ce16d0','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'4a269588-bd90-4609-a2d4-ebdc434a900c'),('ab327c51-fd21-4aba-8513-e62b90033c7a','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'420ddaab-3a63-4699-b9f4-8908005b4d2f'),('abf5824b-e615-498d-a77e-9dc120b4e990','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'420ddaab-3a63-4699-b9f4-8908005b4d2f'),('aeb3a984-4d35-4435-8300-abd4b765d644','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d25fefbb-d4b3-4b9d-ae35-6b87d829e60c'),('b13e2169-8819-42ea-8889-ed1031c49a31','username','openid-connect','oidc-usermodel-property-mapper',NULL,'782ddfc4-2284-4fd8-9f02-405aa63d24d2'),('ba0c8569-d744-4c6f-b157-1d6ec1b29d11','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'420ddaab-3a63-4699-b9f4-8908005b4d2f'),('ba39c13d-11bd-43f0-a0f3-f2538c3c10c9','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'782ddfc4-2284-4fd8-9f02-405aa63d24d2'),('bc77a81b-e292-49c3-877d-515ff1b2879a','role list','saml','saml-role-list-mapper',NULL,'720ef35b-9640-4549-8cc5-effef481bc80'),('c2870749-7495-4792-8fb7-de930160277b','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d25fefbb-d4b3-4b9d-ae35-6b87d829e60c'),('c8e2aba0-501d-4f32-a29b-1acf72e75fec','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'57a47430-5051-4d13-8a5f-ffa4cd948e03'),('c958dcf6-3f3f-44b9-926d-cb4b55debed6','role list','saml','saml-role-list-mapper',NULL,'1460475d-4ec4-45ab-8833-b3122214d499'),('c9f7f3c2-4a76-439f-a1ef-0123c8bde9f4','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'87f6652f-369b-414e-9875-a3eca71e5e43'),('cd0e16be-a1c3-4678-9135-53e70af4e298','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'782ddfc4-2284-4fd8-9f02-405aa63d24d2'),('cd0ffdce-b1c7-4d63-abd1-a9e241fd85c9','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'420ddaab-3a63-4699-b9f4-8908005b4d2f'),('df767198-c44c-46ab-91a8-90f3d84643d5','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'420ddaab-3a63-4699-b9f4-8908005b4d2f'),('e578770d-824b-466c-aadd-e6dccaeb282e','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'782ddfc4-2284-4fd8-9f02-405aa63d24d2'),('e984f18c-c42d-42c2-9063-314390833341','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'782ddfc4-2284-4fd8-9f02-405aa63d24d2'),('ef835194-ed04-4380-ba72-7a6430e43e79','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'420ddaab-3a63-4699-b9f4-8908005b4d2f'),('f75c3809-31e8-47b5-be58-f34ab624d2bf','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'0ea03a8a-790b-446b-a2a8-218126ea2173'),('f7b773cd-5c8a-444b-aeae-dbdfbaf645ae','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'4a269588-bd90-4609-a2d4-ebdc434a900c'),('fa5d9bf0-3790-4227-ab9b-83a92db65882','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'782ddfc4-2284-4fd8-9f02-405aa63d24d2'),('fc630193-fb59-42ec-848e-dd88f314056e','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'4377f50e-33a5-4fab-b9b9-52bb98f3d380'),('fcf31dca-9670-419f-9e4f-90e7729a97ea','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'420ddaab-3a63-4699-b9f4-8908005b4d2f');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('003ccf5c-039d-4a7f-b6d2-dfcdec4545eb','true','access.token.claim'),('003ccf5c-039d-4a7f-b6d2-dfcdec4545eb','nickname','claim.name'),('003ccf5c-039d-4a7f-b6d2-dfcdec4545eb','true','id.token.claim'),('003ccf5c-039d-4a7f-b6d2-dfcdec4545eb','String','jsonType.label'),('003ccf5c-039d-4a7f-b6d2-dfcdec4545eb','nickname','user.attribute'),('003ccf5c-039d-4a7f-b6d2-dfcdec4545eb','true','userinfo.token.claim'),('065914a2-e1ad-471c-99c9-61c54b589d02','true','access.token.claim'),('065914a2-e1ad-471c-99c9-61c54b589d02','email','claim.name'),('065914a2-e1ad-471c-99c9-61c54b589d02','true','id.token.claim'),('065914a2-e1ad-471c-99c9-61c54b589d02','String','jsonType.label'),('065914a2-e1ad-471c-99c9-61c54b589d02','email','user.attribute'),('065914a2-e1ad-471c-99c9-61c54b589d02','true','userinfo.token.claim'),('11c34177-0d4c-4d9d-837c-7dae6b73f612','true','access.token.claim'),('11c34177-0d4c-4d9d-837c-7dae6b73f612','true','id.token.claim'),('11c34177-0d4c-4d9d-837c-7dae6b73f612','country','user.attribute.country'),('11c34177-0d4c-4d9d-837c-7dae6b73f612','formatted','user.attribute.formatted'),('11c34177-0d4c-4d9d-837c-7dae6b73f612','locality','user.attribute.locality'),('11c34177-0d4c-4d9d-837c-7dae6b73f612','postal_code','user.attribute.postal_code'),('11c34177-0d4c-4d9d-837c-7dae6b73f612','region','user.attribute.region'),('11c34177-0d4c-4d9d-837c-7dae6b73f612','street','user.attribute.street'),('11c34177-0d4c-4d9d-837c-7dae6b73f612','true','userinfo.token.claim'),('1f714251-0b5c-42d2-9722-453f24bf5900','true','access.token.claim'),('1f714251-0b5c-42d2-9722-453f24bf5900','email_verified','claim.name'),('1f714251-0b5c-42d2-9722-453f24bf5900','true','id.token.claim'),('1f714251-0b5c-42d2-9722-453f24bf5900','boolean','jsonType.label'),('1f714251-0b5c-42d2-9722-453f24bf5900','emailVerified','user.attribute'),('1f714251-0b5c-42d2-9722-453f24bf5900','true','userinfo.token.claim'),('2c6047f2-9a10-4ea3-ad9e-427566d2cd2c','true','access.token.claim'),('2c6047f2-9a10-4ea3-ad9e-427566d2cd2c','phone_number','claim.name'),('2c6047f2-9a10-4ea3-ad9e-427566d2cd2c','true','id.token.claim'),('2c6047f2-9a10-4ea3-ad9e-427566d2cd2c','String','jsonType.label'),('2c6047f2-9a10-4ea3-ad9e-427566d2cd2c','phoneNumber','user.attribute'),('2c6047f2-9a10-4ea3-ad9e-427566d2cd2c','true','userinfo.token.claim'),('2dcbcca1-443e-4479-8566-5645aa40eaf3','true','access.token.claim'),('2dcbcca1-443e-4479-8566-5645aa40eaf3','preferred_username','claim.name'),('2dcbcca1-443e-4479-8566-5645aa40eaf3','true','id.token.claim'),('2dcbcca1-443e-4479-8566-5645aa40eaf3','String','jsonType.label'),('2dcbcca1-443e-4479-8566-5645aa40eaf3','username','user.attribute'),('2dcbcca1-443e-4479-8566-5645aa40eaf3','true','userinfo.token.claim'),('30624f5b-17c0-4084-a6d9-40c8adb72980','true','access.token.claim'),('30624f5b-17c0-4084-a6d9-40c8adb72980','profile','claim.name'),('30624f5b-17c0-4084-a6d9-40c8adb72980','true','id.token.claim'),('30624f5b-17c0-4084-a6d9-40c8adb72980','String','jsonType.label'),('30624f5b-17c0-4084-a6d9-40c8adb72980','profile','user.attribute'),('30624f5b-17c0-4084-a6d9-40c8adb72980','true','userinfo.token.claim'),('37291530-bdc6-420b-bd79-a76234ba829b','true','access.token.claim'),('37291530-bdc6-420b-bd79-a76234ba829b','locale','claim.name'),('37291530-bdc6-420b-bd79-a76234ba829b','true','id.token.claim'),('37291530-bdc6-420b-bd79-a76234ba829b','String','jsonType.label'),('37291530-bdc6-420b-bd79-a76234ba829b','locale','user.attribute'),('37291530-bdc6-420b-bd79-a76234ba829b','true','userinfo.token.claim'),('3b087064-cfd3-47a3-a451-9361381e8413','true','access.token.claim'),('3b087064-cfd3-47a3-a451-9361381e8413','family_name','claim.name'),('3b087064-cfd3-47a3-a451-9361381e8413','true','id.token.claim'),('3b087064-cfd3-47a3-a451-9361381e8413','String','jsonType.label'),('3b087064-cfd3-47a3-a451-9361381e8413','lastName','user.attribute'),('3b087064-cfd3-47a3-a451-9361381e8413','true','userinfo.token.claim'),('3d9097be-1ba9-49ca-a20a-2c6ede63a59a','true','access.token.claim'),('3d9097be-1ba9-49ca-a20a-2c6ede63a59a','picture','claim.name'),('3d9097be-1ba9-49ca-a20a-2c6ede63a59a','true','id.token.claim'),('3d9097be-1ba9-49ca-a20a-2c6ede63a59a','String','jsonType.label'),('3d9097be-1ba9-49ca-a20a-2c6ede63a59a','picture','user.attribute'),('3d9097be-1ba9-49ca-a20a-2c6ede63a59a','true','userinfo.token.claim'),('482a5188-49b9-4e64-96ce-63a0b1ecc5ca','true','access.token.claim'),('482a5188-49b9-4e64-96ce-63a0b1ecc5ca','locale','claim.name'),('482a5188-49b9-4e64-96ce-63a0b1ecc5ca','true','id.token.claim'),('482a5188-49b9-4e64-96ce-63a0b1ecc5ca','String','jsonType.label'),('482a5188-49b9-4e64-96ce-63a0b1ecc5ca','locale','user.attribute'),('482a5188-49b9-4e64-96ce-63a0b1ecc5ca','true','userinfo.token.claim'),('498abc39-fcdf-47fa-a458-8e7de74192ab','true','access.token.claim'),('498abc39-fcdf-47fa-a458-8e7de74192ab','email','claim.name'),('498abc39-fcdf-47fa-a458-8e7de74192ab','true','id.token.claim'),('498abc39-fcdf-47fa-a458-8e7de74192ab','String','jsonType.label'),('498abc39-fcdf-47fa-a458-8e7de74192ab','email','user.attribute'),('498abc39-fcdf-47fa-a458-8e7de74192ab','true','userinfo.token.claim'),('5176467f-029b-4052-8edb-611aab5b5cab','true','access.token.claim'),('5176467f-029b-4052-8edb-611aab5b5cab','true','id.token.claim'),('5176467f-029b-4052-8edb-611aab5b5cab','true','userinfo.token.claim'),('55fcd7a2-7721-48ad-84be-a8a0fda019b7','true','access.token.claim'),('55fcd7a2-7721-48ad-84be-a8a0fda019b7','true','id.token.claim'),('55fcd7a2-7721-48ad-84be-a8a0fda019b7','country','user.attribute.country'),('55fcd7a2-7721-48ad-84be-a8a0fda019b7','formatted','user.attribute.formatted'),('55fcd7a2-7721-48ad-84be-a8a0fda019b7','locality','user.attribute.locality'),('55fcd7a2-7721-48ad-84be-a8a0fda019b7','postal_code','user.attribute.postal_code'),('55fcd7a2-7721-48ad-84be-a8a0fda019b7','region','user.attribute.region'),('55fcd7a2-7721-48ad-84be-a8a0fda019b7','street','user.attribute.street'),('55fcd7a2-7721-48ad-84be-a8a0fda019b7','true','userinfo.token.claim'),('5733241e-a4e7-4c4a-bb24-2d371aa3bf48','true','access.token.claim'),('5733241e-a4e7-4c4a-bb24-2d371aa3bf48','website','claim.name'),('5733241e-a4e7-4c4a-bb24-2d371aa3bf48','true','id.token.claim'),('5733241e-a4e7-4c4a-bb24-2d371aa3bf48','String','jsonType.label'),('5733241e-a4e7-4c4a-bb24-2d371aa3bf48','website','user.attribute'),('5733241e-a4e7-4c4a-bb24-2d371aa3bf48','true','userinfo.token.claim'),('5adf6ed5-30c6-4e08-81f4-a2dcad181f60','true','access.token.claim'),('5adf6ed5-30c6-4e08-81f4-a2dcad181f60','middle_name','claim.name'),('5adf6ed5-30c6-4e08-81f4-a2dcad181f60','true','id.token.claim'),('5adf6ed5-30c6-4e08-81f4-a2dcad181f60','String','jsonType.label'),('5adf6ed5-30c6-4e08-81f4-a2dcad181f60','middleName','user.attribute'),('5adf6ed5-30c6-4e08-81f4-a2dcad181f60','true','userinfo.token.claim'),('5af47fad-508e-4d4f-b984-ebd32ab88747','true','access.token.claim'),('5af47fad-508e-4d4f-b984-ebd32ab88747','resource_access.${client_id}.roles','claim.name'),('5af47fad-508e-4d4f-b984-ebd32ab88747','String','jsonType.label'),('5af47fad-508e-4d4f-b984-ebd32ab88747','true','multivalued'),('5af47fad-508e-4d4f-b984-ebd32ab88747','foo','user.attribute'),('5c7cc594-c33c-4f4a-8a44-577bde28b8df','true','access.token.claim'),('5c7cc594-c33c-4f4a-8a44-577bde28b8df','realm_access.roles','claim.name'),('5c7cc594-c33c-4f4a-8a44-577bde28b8df','String','jsonType.label'),('5c7cc594-c33c-4f4a-8a44-577bde28b8df','true','multivalued'),('5c7cc594-c33c-4f4a-8a44-577bde28b8df','foo','user.attribute'),('5f400dc2-8321-40e0-90f8-dcd8eb027e35','true','access.token.claim'),('5f400dc2-8321-40e0-90f8-dcd8eb027e35','true','id.token.claim'),('5f400dc2-8321-40e0-90f8-dcd8eb027e35','true','userinfo.token.claim'),('6374194f-21ed-4ba1-96a2-7e2098792cd9','true','access.token.claim'),('6374194f-21ed-4ba1-96a2-7e2098792cd9','resource_access.${client_id}.roles','claim.name'),('6374194f-21ed-4ba1-96a2-7e2098792cd9','String','jsonType.label'),('6374194f-21ed-4ba1-96a2-7e2098792cd9','true','multivalued'),('6374194f-21ed-4ba1-96a2-7e2098792cd9','foo','user.attribute'),('63bf65fa-9abb-4e2d-8ca7-b5e250fe39f8','true','access.token.claim'),('63bf65fa-9abb-4e2d-8ca7-b5e250fe39f8','locale','claim.name'),('63bf65fa-9abb-4e2d-8ca7-b5e250fe39f8','true','id.token.claim'),('63bf65fa-9abb-4e2d-8ca7-b5e250fe39f8','String','jsonType.label'),('63bf65fa-9abb-4e2d-8ca7-b5e250fe39f8','locale','user.attribute'),('63bf65fa-9abb-4e2d-8ca7-b5e250fe39f8','true','userinfo.token.claim'),('695a2063-6e65-46e4-b922-b99c450739e0','true','access.token.claim'),('695a2063-6e65-46e4-b922-b99c450739e0','nickname','claim.name'),('695a2063-6e65-46e4-b922-b99c450739e0','true','id.token.claim'),('695a2063-6e65-46e4-b922-b99c450739e0','String','jsonType.label'),('695a2063-6e65-46e4-b922-b99c450739e0','nickname','user.attribute'),('695a2063-6e65-46e4-b922-b99c450739e0','true','userinfo.token.claim'),('695e38b7-83bb-4227-bbce-b6d21100da6e','true','access.token.claim'),('695e38b7-83bb-4227-bbce-b6d21100da6e','upn','claim.name'),('695e38b7-83bb-4227-bbce-b6d21100da6e','true','id.token.claim'),('695e38b7-83bb-4227-bbce-b6d21100da6e','String','jsonType.label'),('695e38b7-83bb-4227-bbce-b6d21100da6e','username','user.attribute'),('695e38b7-83bb-4227-bbce-b6d21100da6e','true','userinfo.token.claim'),('6a0ba69b-15e3-4bb0-bf91-729bcd8cd1af','true','access.token.claim'),('6a0ba69b-15e3-4bb0-bf91-729bcd8cd1af','groups','claim.name'),('6a0ba69b-15e3-4bb0-bf91-729bcd8cd1af','true','id.token.claim'),('6a0ba69b-15e3-4bb0-bf91-729bcd8cd1af','String','jsonType.label'),('6a0ba69b-15e3-4bb0-bf91-729bcd8cd1af','true','multivalued'),('6a0ba69b-15e3-4bb0-bf91-729bcd8cd1af','foo','user.attribute'),('6d175aab-65a7-4414-8364-9fca6dd462cc','true','access.token.claim'),('6d175aab-65a7-4414-8364-9fca6dd462cc','gender','claim.name'),('6d175aab-65a7-4414-8364-9fca6dd462cc','true','id.token.claim'),('6d175aab-65a7-4414-8364-9fca6dd462cc','String','jsonType.label'),('6d175aab-65a7-4414-8364-9fca6dd462cc','gender','user.attribute'),('6d175aab-65a7-4414-8364-9fca6dd462cc','true','userinfo.token.claim'),('73dfdaf8-94fd-44e6-8c62-29fd015a6903','true','access.token.claim'),('73dfdaf8-94fd-44e6-8c62-29fd015a6903','given_name','claim.name'),('73dfdaf8-94fd-44e6-8c62-29fd015a6903','true','id.token.claim'),('73dfdaf8-94fd-44e6-8c62-29fd015a6903','String','jsonType.label'),('73dfdaf8-94fd-44e6-8c62-29fd015a6903','firstName','user.attribute'),('73dfdaf8-94fd-44e6-8c62-29fd015a6903','true','userinfo.token.claim'),('7d8b530d-eab1-4aae-9c33-58adea98ca5d','true','access.token.claim'),('7d8b530d-eab1-4aae-9c33-58adea98ca5d','upn','claim.name'),('7d8b530d-eab1-4aae-9c33-58adea98ca5d','true','id.token.claim'),('7d8b530d-eab1-4aae-9c33-58adea98ca5d','String','jsonType.label'),('7d8b530d-eab1-4aae-9c33-58adea98ca5d','username','user.attribute'),('7d8b530d-eab1-4aae-9c33-58adea98ca5d','true','userinfo.token.claim'),('933a12dc-bf37-42a4-910c-a9fba2f07a26','true','access.token.claim'),('933a12dc-bf37-42a4-910c-a9fba2f07a26','birthdate','claim.name'),('933a12dc-bf37-42a4-910c-a9fba2f07a26','true','id.token.claim'),('933a12dc-bf37-42a4-910c-a9fba2f07a26','String','jsonType.label'),('933a12dc-bf37-42a4-910c-a9fba2f07a26','birthdate','user.attribute'),('933a12dc-bf37-42a4-910c-a9fba2f07a26','true','userinfo.token.claim'),('9ea785a3-6180-4626-b12c-9fa46b1e496d','true','access.token.claim'),('9ea785a3-6180-4626-b12c-9fa46b1e496d','groups','claim.name'),('9ea785a3-6180-4626-b12c-9fa46b1e496d','true','id.token.claim'),('9ea785a3-6180-4626-b12c-9fa46b1e496d','String','jsonType.label'),('9ea785a3-6180-4626-b12c-9fa46b1e496d','true','multivalued'),('9ea785a3-6180-4626-b12c-9fa46b1e496d','foo','user.attribute'),('9fbc7507-a647-42ae-a4b5-63a494cf6a25','true','access.token.claim'),('9fbc7507-a647-42ae-a4b5-63a494cf6a25','family_name','claim.name'),('9fbc7507-a647-42ae-a4b5-63a494cf6a25','true','id.token.claim'),('9fbc7507-a647-42ae-a4b5-63a494cf6a25','String','jsonType.label'),('9fbc7507-a647-42ae-a4b5-63a494cf6a25','lastName','user.attribute'),('9fbc7507-a647-42ae-a4b5-63a494cf6a25','true','userinfo.token.claim'),('ab327c51-fd21-4aba-8513-e62b90033c7a','true','access.token.claim'),('ab327c51-fd21-4aba-8513-e62b90033c7a','locale','claim.name'),('ab327c51-fd21-4aba-8513-e62b90033c7a','true','id.token.claim'),('ab327c51-fd21-4aba-8513-e62b90033c7a','String','jsonType.label'),('ab327c51-fd21-4aba-8513-e62b90033c7a','locale','user.attribute'),('ab327c51-fd21-4aba-8513-e62b90033c7a','true','userinfo.token.claim'),('abf5824b-e615-498d-a77e-9dc120b4e990','true','access.token.claim'),('abf5824b-e615-498d-a77e-9dc120b4e990','website','claim.name'),('abf5824b-e615-498d-a77e-9dc120b4e990','true','id.token.claim'),('abf5824b-e615-498d-a77e-9dc120b4e990','String','jsonType.label'),('abf5824b-e615-498d-a77e-9dc120b4e990','website','user.attribute'),('abf5824b-e615-498d-a77e-9dc120b4e990','true','userinfo.token.claim'),('aeb3a984-4d35-4435-8300-abd4b765d644','true','access.token.claim'),('aeb3a984-4d35-4435-8300-abd4b765d644','phone_number_verified','claim.name'),('aeb3a984-4d35-4435-8300-abd4b765d644','true','id.token.claim'),('aeb3a984-4d35-4435-8300-abd4b765d644','boolean','jsonType.label'),('aeb3a984-4d35-4435-8300-abd4b765d644','phoneNumberVerified','user.attribute'),('aeb3a984-4d35-4435-8300-abd4b765d644','true','userinfo.token.claim'),('b13e2169-8819-42ea-8889-ed1031c49a31','true','access.token.claim'),('b13e2169-8819-42ea-8889-ed1031c49a31','preferred_username','claim.name'),('b13e2169-8819-42ea-8889-ed1031c49a31','true','id.token.claim'),('b13e2169-8819-42ea-8889-ed1031c49a31','String','jsonType.label'),('b13e2169-8819-42ea-8889-ed1031c49a31','username','user.attribute'),('b13e2169-8819-42ea-8889-ed1031c49a31','true','userinfo.token.claim'),('ba0c8569-d744-4c6f-b157-1d6ec1b29d11','true','access.token.claim'),('ba0c8569-d744-4c6f-b157-1d6ec1b29d11','birthdate','claim.name'),('ba0c8569-d744-4c6f-b157-1d6ec1b29d11','true','id.token.claim'),('ba0c8569-d744-4c6f-b157-1d6ec1b29d11','String','jsonType.label'),('ba0c8569-d744-4c6f-b157-1d6ec1b29d11','birthdate','user.attribute'),('ba0c8569-d744-4c6f-b157-1d6ec1b29d11','true','userinfo.token.claim'),('ba39c13d-11bd-43f0-a0f3-f2538c3c10c9','true','access.token.claim'),('ba39c13d-11bd-43f0-a0f3-f2538c3c10c9','zoneinfo','claim.name'),('ba39c13d-11bd-43f0-a0f3-f2538c3c10c9','true','id.token.claim'),('ba39c13d-11bd-43f0-a0f3-f2538c3c10c9','String','jsonType.label'),('ba39c13d-11bd-43f0-a0f3-f2538c3c10c9','zoneinfo','user.attribute'),('ba39c13d-11bd-43f0-a0f3-f2538c3c10c9','true','userinfo.token.claim'),('bc77a81b-e292-49c3-877d-515ff1b2879a','Role','attribute.name'),('bc77a81b-e292-49c3-877d-515ff1b2879a','Basic','attribute.nameformat'),('bc77a81b-e292-49c3-877d-515ff1b2879a','false','single'),('c2870749-7495-4792-8fb7-de930160277b','true','access.token.claim'),('c2870749-7495-4792-8fb7-de930160277b','phone_number','claim.name'),('c2870749-7495-4792-8fb7-de930160277b','true','id.token.claim'),('c2870749-7495-4792-8fb7-de930160277b','String','jsonType.label'),('c2870749-7495-4792-8fb7-de930160277b','phoneNumber','user.attribute'),('c2870749-7495-4792-8fb7-de930160277b','true','userinfo.token.claim'),('c8e2aba0-501d-4f32-a29b-1acf72e75fec','true','access.token.claim'),('c8e2aba0-501d-4f32-a29b-1acf72e75fec','phone_number_verified','claim.name'),('c8e2aba0-501d-4f32-a29b-1acf72e75fec','true','id.token.claim'),('c8e2aba0-501d-4f32-a29b-1acf72e75fec','boolean','jsonType.label'),('c8e2aba0-501d-4f32-a29b-1acf72e75fec','phoneNumberVerified','user.attribute'),('c8e2aba0-501d-4f32-a29b-1acf72e75fec','true','userinfo.token.claim'),('c958dcf6-3f3f-44b9-926d-cb4b55debed6','Role','attribute.name'),('c958dcf6-3f3f-44b9-926d-cb4b55debed6','Basic','attribute.nameformat'),('c958dcf6-3f3f-44b9-926d-cb4b55debed6','false','single'),('c9f7f3c2-4a76-439f-a1ef-0123c8bde9f4','true','access.token.claim'),('c9f7f3c2-4a76-439f-a1ef-0123c8bde9f4','email_verified','claim.name'),('c9f7f3c2-4a76-439f-a1ef-0123c8bde9f4','true','id.token.claim'),('c9f7f3c2-4a76-439f-a1ef-0123c8bde9f4','boolean','jsonType.label'),('c9f7f3c2-4a76-439f-a1ef-0123c8bde9f4','emailVerified','user.attribute'),('c9f7f3c2-4a76-439f-a1ef-0123c8bde9f4','true','userinfo.token.claim'),('cd0e16be-a1c3-4678-9135-53e70af4e298','true','access.token.claim'),('cd0e16be-a1c3-4678-9135-53e70af4e298','picture','claim.name'),('cd0e16be-a1c3-4678-9135-53e70af4e298','true','id.token.claim'),('cd0e16be-a1c3-4678-9135-53e70af4e298','String','jsonType.label'),('cd0e16be-a1c3-4678-9135-53e70af4e298','picture','user.attribute'),('cd0e16be-a1c3-4678-9135-53e70af4e298','true','userinfo.token.claim'),('cd0ffdce-b1c7-4d63-abd1-a9e241fd85c9','true','access.token.claim'),('cd0ffdce-b1c7-4d63-abd1-a9e241fd85c9','middle_name','claim.name'),('cd0ffdce-b1c7-4d63-abd1-a9e241fd85c9','true','id.token.claim'),('cd0ffdce-b1c7-4d63-abd1-a9e241fd85c9','String','jsonType.label'),('cd0ffdce-b1c7-4d63-abd1-a9e241fd85c9','middleName','user.attribute'),('cd0ffdce-b1c7-4d63-abd1-a9e241fd85c9','true','userinfo.token.claim'),('df767198-c44c-46ab-91a8-90f3d84643d5','true','access.token.claim'),('df767198-c44c-46ab-91a8-90f3d84643d5','profile','claim.name'),('df767198-c44c-46ab-91a8-90f3d84643d5','true','id.token.claim'),('df767198-c44c-46ab-91a8-90f3d84643d5','String','jsonType.label'),('df767198-c44c-46ab-91a8-90f3d84643d5','profile','user.attribute'),('df767198-c44c-46ab-91a8-90f3d84643d5','true','userinfo.token.claim'),('e578770d-824b-466c-aadd-e6dccaeb282e','true','access.token.claim'),('e578770d-824b-466c-aadd-e6dccaeb282e','given_name','claim.name'),('e578770d-824b-466c-aadd-e6dccaeb282e','true','id.token.claim'),('e578770d-824b-466c-aadd-e6dccaeb282e','String','jsonType.label'),('e578770d-824b-466c-aadd-e6dccaeb282e','firstName','user.attribute'),('e578770d-824b-466c-aadd-e6dccaeb282e','true','userinfo.token.claim'),('e984f18c-c42d-42c2-9063-314390833341','true','access.token.claim'),('e984f18c-c42d-42c2-9063-314390833341','gender','claim.name'),('e984f18c-c42d-42c2-9063-314390833341','true','id.token.claim'),('e984f18c-c42d-42c2-9063-314390833341','String','jsonType.label'),('e984f18c-c42d-42c2-9063-314390833341','gender','user.attribute'),('e984f18c-c42d-42c2-9063-314390833341','true','userinfo.token.claim'),('ef835194-ed04-4380-ba72-7a6430e43e79','true','access.token.claim'),('ef835194-ed04-4380-ba72-7a6430e43e79','updated_at','claim.name'),('ef835194-ed04-4380-ba72-7a6430e43e79','true','id.token.claim'),('ef835194-ed04-4380-ba72-7a6430e43e79','String','jsonType.label'),('ef835194-ed04-4380-ba72-7a6430e43e79','updatedAt','user.attribute'),('ef835194-ed04-4380-ba72-7a6430e43e79','true','userinfo.token.claim'),('f7b773cd-5c8a-444b-aeae-dbdfbaf645ae','true','access.token.claim'),('f7b773cd-5c8a-444b-aeae-dbdfbaf645ae','realm_access.roles','claim.name'),('f7b773cd-5c8a-444b-aeae-dbdfbaf645ae','String','jsonType.label'),('f7b773cd-5c8a-444b-aeae-dbdfbaf645ae','true','multivalued'),('f7b773cd-5c8a-444b-aeae-dbdfbaf645ae','foo','user.attribute'),('fa5d9bf0-3790-4227-ab9b-83a92db65882','true','access.token.claim'),('fa5d9bf0-3790-4227-ab9b-83a92db65882','updated_at','claim.name'),('fa5d9bf0-3790-4227-ab9b-83a92db65882','true','id.token.claim'),('fa5d9bf0-3790-4227-ab9b-83a92db65882','String','jsonType.label'),('fa5d9bf0-3790-4227-ab9b-83a92db65882','updatedAt','user.attribute'),('fa5d9bf0-3790-4227-ab9b-83a92db65882','true','userinfo.token.claim'),('fcf31dca-9670-419f-9e4f-90e7729a97ea','true','access.token.claim'),('fcf31dca-9670-419f-9e4f-90e7729a97ea','zoneinfo','claim.name'),('fcf31dca-9670-419f-9e4f-90e7729a97ea','true','id.token.claim'),('fcf31dca-9670-419f-9e4f-90e7729a97ea','String','jsonType.label'),('fcf31dca-9670-419f-9e4f-90e7729a97ea','zoneinfo','user.attribute'),('fcf31dca-9670-419f-9e4f-90e7729a97ea','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('animalia',60,300,7200,NULL,NULL,NULL,_binary '',_binary '\0',0,'keywind','animalia',0,NULL,_binary '\0',_binary '',_binary '\0',_binary '\0','EXTERNAL',7200,36000,_binary '\0',_binary '\0','9e9d19f9-0037-4599-9ace-92253aee1e52',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','cd6975ee-80c0-49da-9321-5ff5d01a18f3','d1aac0fa-033b-4b20-971a-526c4cff3adf','60f158e0-7d46-4c95-99f9-13bddad789a2','3e2fffe9-3e91-4ecc-8704-49ea71e04def','cfa1fc87-dec3-49b4-aee4-8a80d2a8a77b',2592000,_binary '\0',900,_binary '',_binary '\0','e4127d6e-98d7-4866-b812-55e53568ed89',0,_binary '\0',0,0,'ae7d36be-f72f-46f0-9f3d-0c03832e6c01'),('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','b7350a97-6be1-4c6a-aa01-1b040916ce0d',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','cca95a72-6257-4d06-9a85-7ffed902b6ce','807bae13-3c27-4d62-9458-5c5a6e2d9fc7','d2742d20-ce87-44f8-9710-2471ae07a594','f271262e-3f64-4496-8dea-f55de065f841','02dc6b1e-c677-477c-a39b-b0e06812641d',2592000,_binary '\0',900,_binary '',_binary '\0','9f5e8042-9125-4b51-aed0-089ee032b2d3',0,_binary '\0',0,0,'cfac6186-5660-4918-9223-cf66e96240d8');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','animalia','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','master','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','animalia',''),('_browser_header.contentSecurityPolicyReportOnly','master',''),('_browser_header.strictTransportSecurity','animalia','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','master','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','animalia','nosniff'),('_browser_header.xContentTypeOptions','master','nosniff'),('_browser_header.xFrameOptions','animalia','SAMEORIGIN'),('_browser_header.xFrameOptions','master','SAMEORIGIN'),('_browser_header.xRobotsTag','animalia','none'),('_browser_header.xRobotsTag','master','none'),('_browser_header.xXSSProtection','animalia','1; mode=block'),('_browser_header.xXSSProtection','master','1; mode=block'),('actionTokenGeneratedByAdminLifespan','animalia','43200'),('actionTokenGeneratedByAdminLifespan','master','43200'),('actionTokenGeneratedByUserLifespan','animalia','300'),('actionTokenGeneratedByUserLifespan','master','300'),('bruteForceProtected','animalia','false'),('bruteForceProtected','master','false'),('cibaAuthRequestedUserHint','animalia','login_hint'),('cibaAuthRequestedUserHint','master','login_hint'),('cibaBackchannelTokenDeliveryMode','animalia','poll'),('cibaBackchannelTokenDeliveryMode','master','poll'),('cibaExpiresIn','animalia','120'),('cibaExpiresIn','master','120'),('cibaInterval','animalia','5'),('cibaInterval','master','5'),('client-policies.policies','animalia','{\"policies\":[]}'),('client-policies.policies','master','{\"policies\":[]}'),('client-policies.profiles','animalia','{\"profiles\":[]}'),('client-policies.profiles','master','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','animalia','0'),('clientOfflineSessionIdleTimeout','master','0'),('clientOfflineSessionMaxLifespan','animalia','0'),('clientOfflineSessionMaxLifespan','master','0'),('clientSessionIdleTimeout','animalia','0'),('clientSessionIdleTimeout','master','0'),('clientSessionMaxLifespan','animalia','0'),('clientSessionMaxLifespan','master','0'),('defaultSignatureAlgorithm','animalia','RS256'),('defaultSignatureAlgorithm','master','RS256'),('displayName','master','Keycloak'),('displayNameHtml','master','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','animalia','30'),('failureFactor','master','30'),('maxDeltaTimeSeconds','animalia','43200'),('maxDeltaTimeSeconds','master','43200'),('maxFailureWaitSeconds','animalia','900'),('maxFailureWaitSeconds','master','900'),('minimumQuickLoginWaitSeconds','animalia','60'),('minimumQuickLoginWaitSeconds','master','60'),('oauth2DeviceCodeLifespan','animalia','600'),('oauth2DeviceCodeLifespan','master','600'),('oauth2DevicePollingInterval','animalia','5'),('oauth2DevicePollingInterval','master','600'),('offlineSessionMaxLifespan','animalia','5184000'),('offlineSessionMaxLifespan','master','5184000'),('offlineSessionMaxLifespanEnabled','animalia','false'),('offlineSessionMaxLifespanEnabled','master','false'),('parRequestUriLifespan','animalia','60'),('parRequestUriLifespan','master','60'),('permanentLockout','animalia','false'),('permanentLockout','master','false'),('quickLoginCheckMilliSeconds','animalia','1000'),('quickLoginCheckMilliSeconds','master','1000'),('waitIncrementSeconds','animalia','60'),('waitIncrementSeconds','master','60'),('webAuthnPolicyAttestationConveyancePreference','animalia','not specified'),('webAuthnPolicyAttestationConveyancePreference','master','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','animalia','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','master','not specified'),('webAuthnPolicyAuthenticatorAttachment','animalia','not specified'),('webAuthnPolicyAuthenticatorAttachment','master','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','animalia','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','master','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','animalia','false'),('webAuthnPolicyAvoidSameAuthenticatorRegister','master','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','animalia','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','master','false'),('webAuthnPolicyCreateTimeout','animalia','0'),('webAuthnPolicyCreateTimeout','master','0'),('webAuthnPolicyCreateTimeoutPasswordless','animalia','0'),('webAuthnPolicyCreateTimeoutPasswordless','master','0'),('webAuthnPolicyRequireResidentKey','animalia','not specified'),('webAuthnPolicyRequireResidentKey','master','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','animalia','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','master','not specified'),('webAuthnPolicyRpEntityName','animalia','keycloak'),('webAuthnPolicyRpEntityName','master','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','animalia','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','master','keycloak'),('webAuthnPolicyRpId','animalia',''),('webAuthnPolicyRpId','master',''),('webAuthnPolicyRpIdPasswordless','animalia',''),('webAuthnPolicyRpIdPasswordless','master',''),('webAuthnPolicySignatureAlgorithms','animalia','ES256'),('webAuthnPolicySignatureAlgorithms','master','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','animalia','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','master','ES256'),('webAuthnPolicyUserVerificationRequirement','animalia','not specified'),('webAuthnPolicyUserVerificationRequirement','master','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','animalia','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','master','not specified');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('animalia','jboss-logging'),('master','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','animalia'),('password','password',_binary '',_binary '','master');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
INSERT INTO `REALM_SUPPORTED_LOCALES` VALUES ('animalia','');
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('235384dd-3046-41c7-aea8-a4c31f40608b','/realms/master/account/*'),('2b7ebc48-9172-4263-808a-a4b8d7073916','/realms/animalia/account/*'),('921e042b-0a48-44c5-aaee-a99354134698','/admin/master/console/*'),('96049ace-2779-4b7b-9108-60f8f945b911','/realms/animalia/account/*'),('cac694e9-3144-4988-890c-9d0702b1496c','/realms/master/account/*'),('e885bd35-65c4-4a6e-a1f5-ea7f157de58d','/admin/animalia/console/*'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','http://localhost:4173/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('0306ffe7-ff8c-465c-884b-c81154443dec','UPDATE_PASSWORD','Update Password','animalia',_binary '',_binary '\0','UPDATE_PASSWORD',30),('4f42b11e-02ce-4e50-80fb-554d8f7d213f','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10),('702c2654-b476-4b41-b84f-0f4b0cc9ea17','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40),('800e948c-4698-4786-8654-71ecf463762b','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50),('80208502-37ed-4972-a79e-241cd20435dd','UPDATE_PROFILE','Update Profile','animalia',_binary '',_binary '\0','UPDATE_PROFILE',40),('85333630-6070-45fe-a5d6-0f2788586b5a','terms_and_conditions','Terms and Conditions','animalia',_binary '\0',_binary '\0','terms_and_conditions',20),('8e21c0ca-4da0-4748-bf2d-653e6337acab','update_user_locale','Update User Locale','animalia',_binary '',_binary '\0','update_user_locale',1000),('99ec8ae5-5429-4255-8e31-395509093804','VERIFY_EMAIL','Verify Email','animalia',_binary '',_binary '\0','VERIFY_EMAIL',50),('9f12b154-8be9-4913-915e-6aa23890444f','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('adbb71cf-f67a-4ddd-b486-d810c263ac3d','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('b9e6b773-26b6-4041-bece-e51a42a2cf8e','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000),('c812c713-e4f5-48e5-a39a-c1c1f65ec145','delete_account','Delete Account','animalia',_binary '\0',_binary '\0','delete_account',60),('d25a8fae-775f-4f8f-adb6-9dc649339318','CONFIGURE_TOTP','Configure OTP','animalia',_binary '',_binary '\0','CONFIGURE_TOTP',10),('e71dab01-ca68-4214-918c-ae1f08e84915','delete_account','Delete Account','master',_binary '\0',_binary '\0','delete_account',60);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsables`
--

DROP TABLE IF EXISTS `responsables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsables` (
  `idResponsable` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefono` bigint DEFAULT NULL,
  PRIMARY KEY (`idResponsable`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsables`
--

LOCK TABLES `responsables` WRITE;
/*!40000 ALTER TABLE `responsables` DISABLE KEYS */;
INSERT INTO `responsables` VALUES (5,'Lautaro','Gregorat','lautarogregorat@gmail.com',3834616765);
/*!40000 ALTER TABLE `responsables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('96049ace-2779-4b7b-9108-60f8f945b911','9e47a039-16c3-42a9-a3cb-5235dd539422'),('cac694e9-3144-4988-890c-9d0702b1496c','bfcd4ea9-9e1b-4abb-943d-979205267d6b');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('b41878f8-823e-4658-bae2-6b067ed28dfc',NULL,'54a59c0e-99df-4bbe-b622-9bc8bf391822',_binary '\0',_binary '',NULL,NULL,NULL,'animalia','animaliaveterinaria2024',1707416530034,NULL,0),('b92734e2-a5e2-4422-8bd0-0183ba47d91f',NULL,'c486809b-8601-41d2-9009-5ef70032a932',_binary '\0',_binary '',NULL,NULL,NULL,'master','adminveterinaria2024',1707322473712,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('ae7d36be-f72f-46f0-9f3d-0c03832e6c01','b41878f8-823e-4658-bae2-6b067ed28dfc'),('1424cb9e-3cfa-4368-a801-9d59cdafa8c8','b92734e2-a5e2-4422-8bd0-0183ba47d91f'),('1f236a85-58d2-43f1-a291-9b8aaed1472a','b92734e2-a5e2-4422-8bd0-0183ba47d91f'),('272673c8-7d20-4da3-8733-12d8e5f2606d','b92734e2-a5e2-4422-8bd0-0183ba47d91f'),('2f99fe4f-1313-46da-9c9c-d26f209672a1','b92734e2-a5e2-4422-8bd0-0183ba47d91f'),('38e2533b-ed4d-435e-97a7-e733e32d2f7b','b92734e2-a5e2-4422-8bd0-0183ba47d91f'),('3f762cd8-db75-4bde-9407-6a509c40fd8b','b92734e2-a5e2-4422-8bd0-0183ba47d91f'),('4aeb0d9d-f3d5-4f02-82d6-1167d0a4bdc5','b92734e2-a5e2-4422-8bd0-0183ba47d91f'),('5baf5662-b950-40dc-8242-9f63a683e02f','b92734e2-a5e2-4422-8bd0-0183ba47d91f'),('7161166e-79b4-4fd9-8f8e-9d56a8359033','b92734e2-a5e2-4422-8bd0-0183ba47d91f'),('993c42e8-d084-4abc-9d8b-5895a69825c3','b92734e2-a5e2-4422-8bd0-0183ba47d91f'),('a0c23e13-e08a-487b-a235-f4538c2080b6','b92734e2-a5e2-4422-8bd0-0183ba47d91f'),('a54e539f-995f-4e73-8a04-f62a35fb530e','b92734e2-a5e2-4422-8bd0-0183ba47d91f'),('b86e8c53-4599-4b1e-acf4-f76665555293','b92734e2-a5e2-4422-8bd0-0183ba47d91f'),('c15060ab-d650-4c49-b6f2-d5cfc2556915','b92734e2-a5e2-4422-8bd0-0183ba47d91f'),('ce57aab1-5950-4ee2-b0ae-69b402ba7b40','b92734e2-a5e2-4422-8bd0-0183ba47d91f'),('cfac6186-5660-4918-9223-cf66e96240d8','b92734e2-a5e2-4422-8bd0-0183ba47d91f'),('ee6f99ee-ce73-49d5-8f77-fc4b5e67b7c3','b92734e2-a5e2-4422-8bd0-0183ba47d91f'),('f21cea14-faf8-4cf7-bdad-0a30c4475794','b92734e2-a5e2-4422-8bd0-0183ba47d91f'),('ff130c54-8963-45dd-88ce-9186ec4be37a','b92734e2-a5e2-4422-8bd0-0183ba47d91f');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('921e042b-0a48-44c5-aaee-a99354134698','+'),('e885bd35-65c4-4a6e-a1f5-ea7f157de58d','+'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','http://localhost:4173'),('f6ef26c9-a9d6-402c-9a46-d26b6004085c','http://localhost:8080');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-15 16:03:02
