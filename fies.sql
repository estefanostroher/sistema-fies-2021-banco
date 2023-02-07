create table inscricao (
	codigo int primary key,
	sexo char,
	data_nasc text,
	etnia text,
	deficiencia varchar(5)
);

create table proc_seletivo (
	codigo int primary key references inscricao,
	ano int,
	semestre int
);

create table estudante (
	codigo int primary key references inscricao,
	tipo_escola text,
	ano_conclusao int,
	curso_superior varchar(3),
	prof_rede_public varchar(3)
);

create table renda (
	codigo int primary key references inscricao,
	n_membros int,
	mensal_bruta numeric,
	per_capta numeric
);

create table residencia (
	codigo int primary key references inscricao,
	uf varchar(2),
	municipio text
);

create table regiao (
	codigo int references inscricao,
	cod_micro int unique,
	cod_meso int unique,
	grupo_pref text,
	uf text,
	primary key(codigo, cod_micro, cod_meso)
);

create table microrregiao (
	cod_micro int references regiao(cod_micro),
	microrreg text
);

create table mesorregiao (
	cod_meso int primary key references regiao(cod_meso),
	mesorreg text
);

create table insc_grupo_pref (
	codigo int references inscricao,
	cod_grupo_pref int unique,
	conceito_curso int,
	area_conhecimento text,
	opcao_curso int,
	primary key(codigo, cod_grupo_pref)
);

create table grupo_pref (
	cod_grupo_pref int primary key references insc_grupo_pref(cod_grupo_pref),
	subarea_conhecimento text unique
);

create table subarea (
	subarea_conhecimento text primary key references grupo_pref(subarea_conhecimento),
	nota_corte numeric
);

create table mantenedora (
	codigo int references inscricao,
	cnpj bigint,
	nat_juridica text,
	cod_eMEC int unique,
	primary key(codigo, cnpj)
);

create table nome_mant (
	cod_eMEC int primary key references mantenedora(cod_eMEC),
	nome text
);

create table IES (
	codigo int references inscricao,
	cod_eMEC int unique,
	nome text,
	org_academica text,
	municipio text,
	uf varchar(2),
	primary key(codigo, cod_eMEC)
);

create table local_oferta (
	codigo int references inscricao,
	cod_local bigint unique,
	municipio text,
	uf varchar(2),
	primary key(codigo, cod_local)
);

create table curso (
	codigo int references inscricao,
	cod_curso int unique,
	nome text,
	turno text,
	grau text,
	conceito int,
	primary key(codigo, cod_curso)
);

create table enem (
	codigo int references inscricao,
	ano int unique,
	media numeric,
	redacao int,
	matematica numeric,
	linguagens numeric,
	cien_netureza numeric,
	cien_humana numeric,
	primary key(codigo, ano)
);

create table financiamento (
	codigo int references inscricao,
	situacao text unique,
	percentual numeric,
	semestre int,
	quant_semestre int,
	primary key(codigo, situacao) 
);
