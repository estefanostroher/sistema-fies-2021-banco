create table inscricao (
    codigo int primary key,
    sexo char,
    data_nasc varchar(10),
    etnia text,
    deficiencia text
);

create table proc_seletivo (
    cod_inscricao int primary key references inscricao(codigo),
    ano int,
    semestre int
);

create table estudante (
    cod_inscricao int primary key references inscricao(codigo),
    escola_ensino_medio text,
    ano_de_conclusao int,
    concluiu_curso_superior varchar(3),
    prof_rede_publica varchar(3)
);

create table renda (
    cod_inscricao int primary key references inscricao(codigo),
    n_membros int,
	mensal numeric,
	per_capta numeric
);

create table residencia (
	cod_inscricao int primary key references inscricao(codigo),
	uf varchar(2),
	municipio text
);

create table regiao ();

create table microrregiao ();

create table mesorregiao ();

create table insc_grupo_pref ();

create table grupo_pref ();

create table subarea ();

create table mantenedora ();

create table nome_mant ();

create table IES ();

create table local_oferta ();

create table curso ();

create table enem ();

create table financiamento ();
