CREATE DATABASE hospital;
USE hospital;

CREATE TABLE pacientes(
id_pac VARCHAR(8) NOT NULL PRIMARY KEY,
nome_pac VARCHAR(100) NOT NULL,
CPF_pac VARCHAR(11) NOT NULL,
idade_pac INT NOT NULL, 
dataNasc_pac DATE NOT NULL, 
contato_pac VARCHAR(100) NOT NULL
);

 CREATE TABLE medicos (
 id_med VARCHAR(100) NOT NULL PRIMARY KEY,
CPF_med VARCHAR(11) NOT NULL, 
especializacao_med VARCHAR(100) NOT NULL, 
id_pac_fk VARCHAR(8),
CONSTRAINT medico_paciente_fk FOREIGN KEY (id_pac_fk)
REFERENCES pacientes(id_pac)
);

CREATE TABLE farmaceutico (
id_farm VARCHAR(8) NOT NULL PRIMARY KEY,
nome_farm VARCHAR(100) NOT NULL, 
cpf_farm VARCHAR(11) NOT NULL,
cpf_enferm VARCHAR(11) NOT NULL,
nome_remedio VARCHAR(100) NOT NULL,
CONSTRAINT farm_remedio_fk FOREIGN KEY (nome_remedio) 
REFERENCE remedio (ID_remedio)
);

CREATE TABLE enfermeiro(
id_enferm VARCHAR(100) NOT NULL PRIMARY KEY,
nome_enferm VARCHAR(100) NOT NULL, 
cpf_pac VARCHAR(11) NOT NULL,
cpf_enferm VARCHAR(11) NOT NULL,
cpf_pac_fk VARCHAR (11),
CONSTRAINT enferm_pac_fk FOREIGN KEY (cpf_pac_fk)
REFERENCES pacientes(id_pac)
);

CREATE TABLE remedio (
ID_remedio VARCHAR(8) NOT NULL PRiMARY KEY,
nome_remedio VARCHAR (100) NOT NULL, 
qntd_remedio DECIMAL (4,2) NOT NULL, 
dtv_remedio DATE NOT NULL, 
horario_remedio TIME NOT NULL,
CONSTRAINT remedio_farm_fk FOREIGN KEY (cpf_farm_fk)
REFERENCES farm(id_farm)
);