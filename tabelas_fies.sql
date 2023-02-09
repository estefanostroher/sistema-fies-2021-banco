create table inscricao (
    codigo int primary key,
    sexo char,
    data_nasc varchar(10),
    etnia text,
    deficiencia text
);

create table proc_seletivo (
    cod_inscricao int primary key references inscricao,
    ano int,
    semestre int
);

create table estudante (
    cod_inscricao int primary key references inscricao,
    escola_ensino_medio text,
    ano_de_conclusao int,
    concluiu_curso_superior varchar(3),
    prof_rede_publica varchar(3)
);

create table renda (
    cod_inscricao int primary key references inscricao,
    n_membros int,
	mensal numeric,
	per_capta numeric
);

create table residencia (
	cod_inscricao int primary key references inscricao,
	uf varchar(2),
	municipio text
);

create table microrregiao (
    cod_micro int primary key,
    microrreg text
);

create table mesorregiao (
    cod_meso int primary key,
    mesorreg text
);

create table regiao (
    cod_inscricao int references inscricao,
    micro int references microrregiao,
    meso int references mesorregiao,
    grupo_pref text,
    uf text,
    primary key(cod_inscricao, micro, meso)
);

create table subarea (
    subarea_conhecimento text primary key,
	nota_corte numeric
);

create table grupo_pref (
    cod_grupo_pref int primary key,
	subarea text references subarea
);

create table insc_grupo_pref (
    cod_inscricao int references inscricao,
    cod_grup_pref int references grupo_pref,
    conceit_curso text,
    area_conhecimento text,
    opcao_curso int,
    primary key(cod_inscricao, cod_grup_pref)
);

create table nome_mant (
    codigo_mec int primary key,
	nome text
);

create table mantenedora (
    cod_inscricao int references inscricao(codigo),
    cnpj bigint,
	nat_juridica text,
	cod_eMEC int references nome_mant,
	primary key(cod_inscricao, cnpj)
);

create table IES (
    cod_inscricao int references inscricao(codigo),
	cod_eMEC int,
	nome text,
	org_academica text,
	municipio text,
	uf varchar(2),
	primary key(cod_inscricao, cod_eMEC)
);

create table local_oferta (
    cod_inscricao int references inscricao(codigo),
    cod_local bigint,
	nome text,
	municipio text,
	uf varchar(2),
	primary key(cod_inscricao, cod_local)
);

create table curso (
    cod_inscricao int references inscricao(codigo),
    cod_curso int,
	nome text,
	turno text,
	grau text,
	conceito text,
	primary key(cod_inscricao, cod_curso)
);

create table enem (
    cod_inscricao int references inscricao(codigo),
    ano int,
	media numeric,
	redacao int,
	matematica numeric,
	linguagens numeric,
	cien_netureza numeric,
	cien_humana numeric,
	primary key(cod_inscricao, ano)
);

create table financiamento (
    cod_inscricao int references inscricao(codigo),
    situacao text,
	percentual numeric,
	semestre int,
	quant_semestre int,
	primary key(cod_inscricao, situacao)
);
