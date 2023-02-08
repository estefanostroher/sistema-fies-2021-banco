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

create table regiao (
    cod_inscricao int references inscricao(codigo),
    micro int unique,
    meso int unique,
    grupo_pref text,
    uf text,
    primary key(cod_inscricao, micro, meso)
);

create table microrregiao (
    cod_micro int primary key references regiao(micro),
    microrreg text
);

create table mesorregiao (
    cod_meso int primary key references regiao(meso),
    mesorreg text
);

create table insc_grupo_pref (
    cod_inscricao int references inscricao(codigo),
    cod_grup_pref int unique,
    conceit_curso int,
    area_conhecimento text,
    opcao_curso int,
    primary key(cod_inscricao, cod_grup_pref)
);

create table grupo_pref (
    cod_grupo_pref int primary key references insc_grupo_pref(cod_grup_pref),
	subarea text unique
);

create table subarea (
    subarea_conhecimento text primary key references grupo_pref(subarea),
	nota_corte numeric
);

create table mantenedora (
    cod_inscricao int references inscricao(codigo),
    cnpj bigint,
	nat_juridica text,
	cod_eMEC int unique,
	primary key(cod_inscricao, cnpj)
);

create table nome_mant (
    codigo_mec int primary key references mantenedora(cod_eMEC),
	nome text
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
	conceito int,
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

insert into inscricao values('205517284', 'M', '22/12/88', 'PARDA', 'SIM');
insert into inscricao values('205374514', 'F', '09/06/02', 'PARDA', 'NÃO');
insert into inscricao values('205519487', 'F', '21/04/95', 'PARDA', 'NÃO');

insert into proc_seletivo values('205517284', '2021', '1');
insert into proc_seletivo values('205374514', '2021', '1');
insert into proc_seletivo values('205519487', '2021', '1');

insert into estudante values('205517284', 'SIM', '2009', 'SIM', 'NÃO');
insert into estudante values('205374514', 'NÃO', '2019', 'NÃO', 'NÃO');
insert into estudante values('205519487', 'SIM', '2011', 'NÃO', 'NÃO');

insert into renda values('205517284', '1', '2090', '1045');
insert into renda values('205374514', '3', '3848.53', '962.13');
insert into renda values('205519487', '0', null, '3000');

insert into residencia values('205517284', 'PR', 'CURITIBA');
insert into residencia values('205374514', 'BA', 'BOM JESUS DA LAPA');
insert into residencia values('205519487', 'AM', 'PARINTINS');

insert into regiao values('205517284', '41037', '4110', 'SUL', 'PARANÁ');
insert into regiao values('205374514', '26017', '2605', 'NORDESTE', 'PERNAMBUCO');
insert into regiao values('205519487', '41037', '4110', 'SUL', 'PARANÁ'); --Precisa arrumar

insert into microrregiao values('41037', 'CURITIBA');
insert into microrregiao values('26017', 'RECIFE');

insert into mesorregiao values('4110', 'METROPOLITANA DE CURITIBA');
insert into mesorregiao values('2605', 'METROPOLITANA DE RECIFE');

insert into insc_grupo_pref values('205517284', '121325', '4', 'CURSOS DA ÁREA DE LICENCIATURA, PEDAGOGIA E NORMAL SUPERIOR', '1');
insert into insc_grupo_pref values('205374514', '118968', '5', 'CURSOS DA AREA DE SAUDE', '1');
insert into insc_grupo_pref values('205519487', '121325', '4', 'CURSOS DA ÁREA DE LICENCIATURA, PEDAGOGIA E NORMAL SUPERIOR', '1'); --Precisa arrumar

insert into grupo_pref values('121325', 'ARTES, CIÊNCIAS SOCIAIS E CURSOS RELACIONADOS');
insert into grupo_pref values('118968', 'MEDICINA');

insert into subarea values('ARTES, CIÊNCIAS SOCIAIS E CURSOS RELACIONADOS', '450.14');
insert into subarea values('MEDICINA', '758.64');

insert into mantenedora values('205517284', '76659820000151', 'PESSOA JURÍDICA DE DIREITO PRIVADO - SEM FINS LUCRATIVOS - ASSOCIAÇÃO DE UTILIDADE PÚBLICA', '10');
insert into mantenedora values('205374514', '10847705000100', 'PRIVADA SEM FINS LUCRATIVOS', '11');
insert into mantenedora values('205519487', '76659820000151', 'PESSOA JURÍDICA DE DIREITO PRIVADO - SEM FINS LUCRATIVOS - ASSOCIAÇÃO DE UTILIDADE PÚBLICA', '10'); --Precisa arrumar

insert into nome_mant values('10', 'ASSOCIACAO PARANAENSE DE CULTURA - APC');
insert into nome_mant values('11', 'CENTRO DE EDUCACAO TECNICA E CULTURAL');

insert into IES values('205517284', '10', 'PONTIFÍCIA UNIVERSIDADE CATÓLICA DO PARANÁ', 'UNIVERSIDADE', 'CURITIBA', 'PR');
insert into IES values('205374514', '11', 'UNIVERSIDADE CATÓLICA DE PERNAMBUCO', 'UNIVERSIDADE', 'RECIFE', 'PE');
insert into IES values('205519487', '11', 'UNIVERSIDADE CATÓLICA DE PERNAMBUCO', 'UNIVERSIDADE', 'RECIFE', 'PE');

insert into local_oferta values('205517284', '657676', 'PUCPR - CAMPUS CURITIBA', 'CURITIBA', 'PR');
insert into local_oferta values('205374514', '657677', 'POLO NA SEDE', 'RECIFE', 'PE');
insert into local_oferta values('205519487', '657677', 'POLO NA SEDE', 'RECIFE', 'PE');

insert into curso values('205517284', '849', 'FILOSOFIA', 'NOTURNO', 'SEMESTRAL', '4');
insert into curso values('205374514', '1200712', 'MEDICINA', 'INTEGRAL', 'SEMESTRAL', '5');
insert into curso values('205519487', '1200712', 'MEDICINA', 'INTEGRAL', 'SEMESTRAL', '5');

insert into enem values('205517284', '2017', '450.14', '460', '363.5', '489.8', '507', '430.4');
insert into enem values('205374514', '2019', '611.84', '900', '522', '569.2', '484.2', '583.8');
insert into enem values('205519487', '2019', '611.84', '900', '522', '569.2', '484.2', '583.8');

insert into financiamento values('205517284', 'PARTICIPACAO CANCELADA PELO CANDIDATO');
insert into financiamento values('205374514', 'PARTICIPACAO CANCELADA PELO CANDIDATO');
insert into financiamento values('205519487', 'PARTICIPACAO CANCELADA PELO CANDIDATO');
