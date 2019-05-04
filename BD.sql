SET FEEDBACK OFF
SET LINESIZE 150
SET PAGESIZE 40

REM **************************************************************************
REM Auteur : Zoubaier Derbali
REM ***************************************************************************


PROMPT --> DEBUT DU SCRIPT

REM ** Requ�te SQL de cr�ation des tables **

DROP TABLE Users CASCADE CONSTRAINTS PURGE
/
DROP TABLE Document CASCADE CONSTRAINTS PURGE
/

PROMPT CREATION DES TABLES

CREATE TABLE Users
(
NumU INTEGER CONSTRAINT pk_utilisateur PRIMARY KEY,
login VARCHAR(30) NOT NULL,
password VARCHAR2(30)NOT NULL,
TypeUser int DEFAULT 0,
CONSTRAINT chk_users CHECK (TypeUser = 0 Or TypeUser = 1)
)
/

CREATE TABLE Document
(
NumDoc INTEGER CONSTRAINT pk_document PRIMARY KEY,
TypeDoc INTEGER NOT NULL,
Titre VARCHAR2(25) NOT NULL,
Auteur VARCHAR2(30)NOT NULL,
Emprunte int DEFAULT 0,
CONSTRAINT chk_docs CHECK (Emprunte = 0 Or Emprunte = 1)
)
/


REM ** Ordres SQL de cr�ation de S�quences  **

PROMPT CREATION DES SEQUENCES

DROP SEQUENCE seq_utilisateur
/
DROP SEQUENCE seq_document
/

CREATE SEQUENCE seq_utilisateur start with 1 Minvalue 0 increment by 1
/
CREATE SEQUENCE seq_document start with 1 Minvalue 0 increment by 1
/


PROMPT INSERTION UTILISATEURS

insert into Users (NumU, login, password,TypeUser)
values(seq_utilisateur.NEXTVAL,'admin','admin',0);
insert into Users (NumU, login, password,TypeUser)
values(seq_utilisateur.NEXTVAL,'biblio','1234',1);


PROMPT INSERTION DE DOCUMENTS

insert into Document (NumDoc,TypeDoc, Titre, Auteur,Emprunte)
values(seq_document.NEXTVAL,1,'livreA', 'XXXX',0);
insert into Document (NumDoc,TypeDoc, Titre, Auteur,Emprunte)
values(seq_document.NEXTVAL,2,'LivreB', 'YYYY',0);
insert into Document (NumDoc,TypeDoc, Titre, Auteur,Emprunte)
values(seq_document.NEXTVAL,1,'livreC', 'AAAAA',0);
insert into Document (NumDoc,TypeDoc, Titre, Auteur,Emprunte)
values(seq_document.NEXTVAL,2,'LivreD', 'PPPPP',0);





PROMPT --> SCRIPT COMPLETEMENT TERMINE

commit;

SET FEEDBACK ON
