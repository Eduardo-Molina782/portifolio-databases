show databases;

create database db_sistema_faculdade;

use db_sistema_faculdade;

show tables;

create table tbl_aluno (
    id int not null primary key auto_increment,
    nome varchar(45) not null,
    idade int not null,
    RA varchar(45) not null,
	cpf varchar(25) not null,
    
    unique index(id)
    );
    
create table tbl_professor (
	id int not null primary key auto_increment,
    nome varchar(45) not null,
    curso varchar(45) not null,
    cpf varchar(45) not null,
    idade int not null,
    
    unique index(id)
    );
    
create table tbl_cursos (
   id int not null primary key auto_increment,
   modalidade varchar(45) not null,
   nivel varchar(45) not null,
   turno varchar(45) not null,
   id_aluno int not null,
   id_professor int not null,
   
   constraint fk_aluno_cursos
   foreign key (id_aluno)
   references tbl_aluno(id),
   
   constraint fk_professor_cursos
   foreign key (id_professor)
   references tbl_professor(id),
   
   unique index (id)
);

create table tbl_materia (
  id int not null primary key auto_increment,
  nome varchar(45) not null,
  semestre varchar(45) not null,
  nota float not null,
  id_aluno int not null,
  id_professor int not null,
  
  constraint fk_aluno_materia
  foreign key (id_aluno)
  references tbl_aluno (id),
  
  constraint fk_professor_materia
  foreign key (id_professor)
  references tbl_professor (id),
  
  unique index (id)
);

create table tbl_cursos_materia (
  id int not null primary key auto_increment,
  nome varchar(45) not null,
  id_cursos int not null,
  id_materia int not null,
  
  constraint fk_cursos_cursos_materia
  foreign key (id_cursos)
  references tbl_cursos (id),
  
  constraint fk_materia_cursos_materia
  foreign key (id_materia)
  references tbl_materia (id),
  
  unique index (id)
);

create table tbl_turma (
id int not null primary key auto_increment,
id_cursos int not null,
id_aluno int not null,
id_professor int not null,

constraint fk_cursos_turma
foreign key (id_cursos)
references tbl_cursos (id),

constraint fk_aluno_turma
foreign key (id_aluno)
references tbl_aluno (id),

constraint fk_professor_turma
foreign key (id_professor)
references tbl_professor (id),

unique index (id)
);

create table tbl_email (
  id int not null primary key auto_increment,
  email varchar(255) not null,
  id_aluno int not null,
  id_professor int not null,
  
  constraint fk_aluno_email
  foreign key (id_aluno)
  references tbl_aluno (id),
  
  constraint fk_professor_email
  foreign key (id_professor)
  references tbl_professor (id),
  
  unique index (id)
);

create table tbl_endereco (
  id int not null primary key auto_increment,
  rua varchar(45) not null,
  bairro varchar(45) not null,
  cidade varchar(45) not null,
  cep varchar (45) not null,
  id_aluno int not null,
  id_professor int not null,
  
  constraint fk_aluno_endereco
  foreign key (id_aluno)
  references tbl_aluno (id),
  
  constraint fk_professor_endereco
  foreign key (id_professor)
  references tbl_professor (id),
  
  unique index (id)
);