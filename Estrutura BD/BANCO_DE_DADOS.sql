prompt PL/SQL Developer Export User Objects for user ACADEMIATI@NMDES
prompt Created by 1033295 on Thursday, November 11, 2021
set define off
spool dd.log

prompt
prompt Creating table TB_ACAD_PAIS
prompt ===========================
prompt
create table TB_ACAD_PAIS
(
  id_pais NUMBER generated always as identity,
  nome    VARCHAR2(200) not null
)
;
comment on column TB_ACAD_PAIS.id_pais
  is 'Identificador';
comment on column TB_ACAD_PAIS.nome
  is 'NOME PAIS';
alter table TB_ACAD_PAIS
  add constraint PK_PAIS primary key (ID_PAIS);

prompt
prompt Creating table TB_ACAD_ESTADO
prompt =============================
prompt
create table TB_ACAD_ESTADO
(
  id_estado  NUMBER generated always as identity,
  nome       VARCHAR2(200) not null,
  uf         VARCHAR2(4) not null,
  fk_id_pais NUMBER not null
)
;
comment on column TB_ACAD_ESTADO.id_estado
  is 'Identificador';
comment on column TB_ACAD_ESTADO.nome
  is 'NOME ESTADO';
comment on column TB_ACAD_ESTADO.uf
  is 'UF ESTADO';
comment on column TB_ACAD_ESTADO.fk_id_pais
  is 'FK DO PAIS';
alter table TB_ACAD_ESTADO
  add constraint PK_ESTADO primary key (ID_ESTADO);
alter table TB_ACAD_ESTADO
  add constraint FK_ESTADO_PAIS foreign key (FK_ID_PAIS)
  references TB_ACAD_PAIS (ID_PAIS);

prompt
prompt Creating table TB_ACAD_CIDADE
prompt =============================
prompt
create table TB_ACAD_CIDADE
(
  id_cidade    NUMBER generated always as identity,
  nome         VARCHAR2(200) not null,
  fk_id_estado NUMBER not null
)
;
comment on column TB_ACAD_CIDADE.id_cidade
  is 'Identificador';
comment on column TB_ACAD_CIDADE.nome
  is 'NOME CIDADE';
comment on column TB_ACAD_CIDADE.fk_id_estado
  is 'FK DO ESTADO';
alter table TB_ACAD_CIDADE
  add constraint PK_CIDADE primary key (ID_CIDADE);
alter table TB_ACAD_CIDADE
  add constraint FK_CIDADE_ESTADO foreign key (FK_ID_ESTADO)
  references TB_ACAD_ESTADO (ID_ESTADO);

prompt
prompt Creating table TB_ACAD_CLIENTE
prompt ==============================
prompt
create table TB_ACAD_CLIENTE
(
  id_cliente      NUMBER generated always as identity,
  cpf_cnpj        VARCHAR2(14) not null,
  nome            VARCHAR2(200) not null,
  data_nascimento DATE not null,
  estado_civil    NUMBER not null,
  email           VARCHAR2(200) not null,
  telefone        VARCHAR2(12) not null,
  status          NUMBER not null
)
;
comment on column TB_ACAD_CLIENTE.id_cliente
  is 'Identificador';
comment on column TB_ACAD_CLIENTE.cpf_cnpj
  is 'CPF/CNPJ DO FORNECEDOR';
comment on column TB_ACAD_CLIENTE.nome
  is 'NOME DO FORNECEDOR';
comment on column TB_ACAD_CLIENTE.data_nascimento
  is 'DATA DE NASCIMENTO DO CLIENTE';
comment on column TB_ACAD_CLIENTE.estado_civil
  is '1 - Solteiro, 2 - Casado, 3 - Divorciado, 4 - Viuvo';
comment on column TB_ACAD_CLIENTE.email
  is 'E-MAIL DO CLIENTE';
comment on column TB_ACAD_CLIENTE.telefone
  is 'TELEFONE';
comment on column TB_ACAD_CLIENTE.status
  is 'STATUS: 1 - ATIVO / 2 - INATIVO';
alter table TB_ACAD_CLIENTE
  add constraint PK_CLIENTE primary key (ID_CLIENTE);
alter table TB_ACAD_CLIENTE
  add unique (CPF_CNPJ);

prompt
prompt Creating table TB_ACAD_ESTOQUE
prompt ==============================
prompt
create table TB_ACAD_ESTOQUE
(
  id_estoque NUMBER generated always as identity,
  nome       VARCHAR2(200) not null,
  status     NUMBER not null
)
;
comment on column TB_ACAD_ESTOQUE.id_estoque
  is 'Identificador';
comment on column TB_ACAD_ESTOQUE.nome
  is 'NOME ESTOQUE';
comment on column TB_ACAD_ESTOQUE.status
  is 'STATUS: 1 - ATIVO / 2 - INATIVO';
alter table TB_ACAD_ESTOQUE
  add constraint PK_ESTOQUE primary key (ID_ESTOQUE);

prompt
prompt Creating table TB_ACAD_FORNECEDOR
prompt =================================
prompt
create table TB_ACAD_FORNECEDOR
(
  id_fornecedor NUMBER generated always as identity,
  nome          VARCHAR2(200) not null,
  cpf_cnpj      VARCHAR2(14) not null,
  telefone      VARCHAR2(12) not null,
  status        NUMBER not null
)
;
comment on column TB_ACAD_FORNECEDOR.id_fornecedor
  is 'Identificador';
comment on column TB_ACAD_FORNECEDOR.nome
  is 'NOME DO FORNECEDOR';
comment on column TB_ACAD_FORNECEDOR.cpf_cnpj
  is 'CPF/CNPJ DO FORNECEDOR';
comment on column TB_ACAD_FORNECEDOR.telefone
  is 'TELEFONE';
comment on column TB_ACAD_FORNECEDOR.status
  is 'STATUS: 1 - ATIVO / 2 - INATIVO';
alter table TB_ACAD_FORNECEDOR
  add constraint PK_FORNECEDOR primary key (ID_FORNECEDOR);

prompt
prompt Creating table TB_ACAD_ENDERECO
prompt ===============================
prompt
create table TB_ACAD_ENDERECO
(
  id_endereco        NUMBER generated always as identity,
  logradouro         VARCHAR2(100) not null,
  bairro             VARCHAR2(100) not null,
  cep                VARCHAR2(8) not null,
  numero             VARCHAR2(10) not null,
  endereco_principal NUMBER not null,
  fk_id_cliente      NUMBER,
  fk_id_fornecedor   NUMBER,
  fk_id_estoque      NUMBER,
  fk_id_cidade       NUMBER
)
;
comment on column TB_ACAD_ENDERECO.id_endereco
  is 'Identificador';
comment on column TB_ACAD_ENDERECO.logradouro
  is 'LAGRADOURO ENDERECO';
comment on column TB_ACAD_ENDERECO.bairro
  is 'BAIRRO ENDERECO';
comment on column TB_ACAD_ENDERECO.cep
  is 'CEP ENDERECO';
comment on column TB_ACAD_ENDERECO.numero
  is 'NUMERO ENDERECO';
comment on column TB_ACAD_ENDERECO.endereco_principal
  is 'ENDERECO: 1 - PRINCIPAL / 2 - SECUNDARIO';
comment on column TB_ACAD_ENDERECO.fk_id_cliente
  is 'FK CLIENTE';
comment on column TB_ACAD_ENDERECO.fk_id_fornecedor
  is 'FK FORNECEDOR';
comment on column TB_ACAD_ENDERECO.fk_id_estoque
  is 'FK ESTOQUE';
comment on column TB_ACAD_ENDERECO.fk_id_cidade
  is 'FK CIDADE';
alter table TB_ACAD_ENDERECO
  add constraint PK_ENDERECO primary key (ID_ENDERECO);
alter table TB_ACAD_ENDERECO
  add constraint FK_ENDERECO_CIDADE foreign key (FK_ID_CIDADE)
  references TB_ACAD_CIDADE (ID_CIDADE);
alter table TB_ACAD_ENDERECO
  add constraint FK_ENDERECO_CLIENTE foreign key (FK_ID_CLIENTE)
  references TB_ACAD_CLIENTE (ID_CLIENTE);
alter table TB_ACAD_ENDERECO
  add constraint FK_ENDERECO_ESTOQUE foreign key (FK_ID_ESTOQUE)
  references TB_ACAD_ESTOQUE (ID_ESTOQUE);
alter table TB_ACAD_ENDERECO
  add constraint FK_ENDERECO_FORNECEDOR foreign key (FK_ID_FORNECEDOR)
  references TB_ACAD_FORNECEDOR (ID_FORNECEDOR);

prompt
prompt Creating table TB_ACAD_FUNCIONARIO
prompt ==================================
prompt
create table TB_ACAD_FUNCIONARIO
(
  id_funcionario  NUMBER generated always as identity,
  nome            VARCHAR2(200) not null,
  cpf_cnpj        VARCHAR2(14) not null,
  tipo_permissao  NUMBER not null,
  data_nascimento DATE not null,
  senha           VARCHAR2(50) not null,
  status          NUMBER not null
)
;
comment on column TB_ACAD_FUNCIONARIO.id_funcionario
  is 'Identificador';
comment on column TB_ACAD_FUNCIONARIO.nome
  is 'NOME FUNCIONARIO';
comment on column TB_ACAD_FUNCIONARIO.cpf_cnpj
  is 'CPF/CNPJ DO FUNCIONARIO';
comment on column TB_ACAD_FUNCIONARIO.tipo_permissao
  is 'TIPO DE PERMISSAO: 1 - VENDEDOR / 2 - GERENTE';
comment on column TB_ACAD_FUNCIONARIO.data_nascimento
  is 'DATA DE NASCIMENTO DO FUNCIONARIO';
comment on column TB_ACAD_FUNCIONARIO.senha
  is 'SENHA DO FUNCIONARIO';
comment on column TB_ACAD_FUNCIONARIO.status
  is 'STATUS: 1 - ATIVO / 2 - INATIVO';
alter table TB_ACAD_FUNCIONARIO
  add constraint PK_FUNCIONARIO primary key (ID_FUNCIONARIO);
alter table TB_ACAD_FUNCIONARIO
  add unique (CPF_CNPJ);

prompt
prompt Creating table TB_ACAD_PRODUTO
prompt ==============================
prompt
create table TB_ACAD_PRODUTO
(
  id_produto NUMBER generated always as identity,
  nome       VARCHAR2(200) not null,
  descricao  VARCHAR2(500) not null,
  status     NUMBER not null
)
;
comment on column TB_ACAD_PRODUTO.id_produto
  is 'Identificador';
comment on column TB_ACAD_PRODUTO.nome
  is 'NOME PRODUTO';
comment on column TB_ACAD_PRODUTO.descricao
  is 'DESCRICAO DO PRODUTO';
comment on column TB_ACAD_PRODUTO.status
  is 'STATUS: 1 - ATIVO / 2 - INATIVO';
alter table TB_ACAD_PRODUTO
  add constraint PK_PRODUTO primary key (ID_PRODUTO);

prompt
prompt Creating table TB_ACAD_ITEM_ESTOQUE
prompt ===================================
prompt
create table TB_ACAD_ITEM_ESTOQUE
(
  id_item_estoque NUMBER generated always as identity,
  quantidade      NUMBER not null,
  data_cadastro   DATE not null,
  status          NUMBER not null,
  preco_custo     NUMBER(12,2),
  margem_lucro    NUMBER(12,2),
  preco_venda     NUMBER(12,2),
  fk_id_produto   NUMBER not null,
  fk_id_estoque   NUMBER not null
)
;
comment on column TB_ACAD_ITEM_ESTOQUE.id_item_estoque
  is 'Identificador';
comment on column TB_ACAD_ITEM_ESTOQUE.quantidade
  is 'QUANTIDADE ITEM_ESTOQUE';
comment on column TB_ACAD_ITEM_ESTOQUE.data_cadastro
  is 'DATA CADASTRO ITEM_ESTOQUE';
comment on column TB_ACAD_ITEM_ESTOQUE.status
  is 'STATUS: 1 - ATIVO / 2 - INATIVO / 3 - AGUARDANDO';
comment on column TB_ACAD_ITEM_ESTOQUE.preco_custo
  is 'PRECO CUSTO ITEM_ESTOQUE';
comment on column TB_ACAD_ITEM_ESTOQUE.margem_lucro
  is 'MARGEM DE LUCRO ITEM_ESTOQUE';
comment on column TB_ACAD_ITEM_ESTOQUE.preco_venda
  is 'PRECO VENDA ITEM_ESTOQUE';
comment on column TB_ACAD_ITEM_ESTOQUE.fk_id_produto
  is 'FK DE PRODUTO EM ITEM_ESTOQUE';
comment on column TB_ACAD_ITEM_ESTOQUE.fk_id_estoque
  is 'FK DE ESTOQUE EM ITEM_ESTOQUE';
alter table TB_ACAD_ITEM_ESTOQUE
  add constraint PK_ITEM_ESTOQUE primary key (ID_ITEM_ESTOQUE);
alter table TB_ACAD_ITEM_ESTOQUE
  add constraint FK_ITEM_ESTOQUE_ESTOQUE foreign key (FK_ID_ESTOQUE)
  references TB_ACAD_ESTOQUE (ID_ESTOQUE);
alter table TB_ACAD_ITEM_ESTOQUE
  add constraint FK_ITEM_ESTOQUE_PRODUTO foreign key (FK_ID_PRODUTO)
  references TB_ACAD_PRODUTO (ID_PRODUTO);

prompt
prompt Creating table TB_ACAD_PEDIDO
prompt =============================
prompt
create table TB_ACAD_PEDIDO
(
  id_pedido        NUMBER generated always as identity,
  preco_total      NUMBER not null,
  data_pedido      DATE not null,
  status           NUMBER not null,
  fk_id_cliente    NUMBER not null,
  fk_id_funconario NUMBER not null
)
;
comment on column TB_ACAD_PEDIDO.id_pedido
  is 'Identificador';
comment on column TB_ACAD_PEDIDO.preco_total
  is 'PRECO TOTAL';
comment on column TB_ACAD_PEDIDO.data_pedido
  is 'DATA PEDIDO';
comment on column TB_ACAD_PEDIDO.status
  is 'STATUS: 1 - INICIADO | 2 - ABERTO | 3 - FECHADO | 4 - CANCELADO';
comment on column TB_ACAD_PEDIDO.fk_id_cliente
  is 'ID DO CLIENTE TABELA CLIENTE ';
comment on column TB_ACAD_PEDIDO.fk_id_funconario
  is 'ID DO FUNCIONARIO TABELA FUNCIONARIO';
alter table TB_ACAD_PEDIDO
  add constraint PK_PEDIDO primary key (ID_PEDIDO);
alter table TB_ACAD_PEDIDO
  add constraint FK_ID_CLIENTE_CLIENTE foreign key (FK_ID_CLIENTE)
  references TB_ACAD_CLIENTE (ID_CLIENTE);
alter table TB_ACAD_PEDIDO
  add constraint FK_ID_FUNCIONARIO_FUNCIONARIO foreign key (FK_ID_FUNCONARIO)
  references TB_ACAD_FUNCIONARIO (ID_FUNCIONARIO);

prompt
prompt Creating table TB_ACAD_ITEM_PEDIDO
prompt ==================================
prompt
create table TB_ACAD_ITEM_PEDIDO
(
  id_item_pedido     NUMBER generated always as identity,
  subtotal           NUMBER not null,
  quantidade         NUMBER not null,
  fk_id_pedido       NUMBER not null,
  fk_id_item_estoque NUMBER not null
)
;
comment on column TB_ACAD_ITEM_PEDIDO.id_item_pedido
  is 'Identificador';
comment on column TB_ACAD_ITEM_PEDIDO.subtotal
  is 'SUBTOTAL DO ITEM_PEDIDO';
comment on column TB_ACAD_ITEM_PEDIDO.quantidade
  is 'QUANTIDADE DO ITEM_PEDIDO';
comment on column TB_ACAD_ITEM_PEDIDO.fk_id_pedido
  is 'FK DO PEDIDO';
comment on column TB_ACAD_ITEM_PEDIDO.fk_id_item_estoque
  is 'FK DO ITEM_ESTOQUE';
alter table TB_ACAD_ITEM_PEDIDO
  add constraint PK_ITEM_PEDIDO primary key (ID_ITEM_PEDIDO);
alter table TB_ACAD_ITEM_PEDIDO
  add constraint FK_ITEM_PEDIDO_ITEM_ESTOQUE foreign key (FK_ID_ITEM_ESTOQUE)
  references TB_ACAD_ITEM_ESTOQUE (ID_ITEM_ESTOQUE);
alter table TB_ACAD_ITEM_PEDIDO
  add constraint FK_ITEM_PEDIDO_PEDIDO foreign key (FK_ID_PEDIDO)
  references TB_ACAD_PEDIDO (ID_PEDIDO);

prompt
prompt Creating table TB_ACAD_PEDIDO_COMPRA
prompt ====================================
prompt
create table TB_ACAD_PEDIDO_COMPRA
(
  id_pedido_compra  NUMBER generated always as identity,
  data_compra       DATE not null,
  preco_total       NUMBER(12,2) not null,
  status            NUMBER not null,
  fk_id_funcionario NUMBER not null,
  fk_id_fornecedor  NUMBER not null
)
;
comment on column TB_ACAD_PEDIDO_COMPRA.id_pedido_compra
  is 'Identificador';
comment on column TB_ACAD_PEDIDO_COMPRA.data_compra
  is 'DATA COMPRA PEDIDO_COMPRA';
comment on column TB_ACAD_PEDIDO_COMPRA.preco_total
  is 'PRECO TOTAL PEDIDO_COMPRA';
comment on column TB_ACAD_PEDIDO_COMPRA.status
  is 'STATUS: 1 - ATIVO / 2 - INATIVO';
comment on column TB_ACAD_PEDIDO_COMPRA.fk_id_funcionario
  is 'FK DO FUNCIONARIO';
comment on column TB_ACAD_PEDIDO_COMPRA.fk_id_fornecedor
  is 'FK DO FORNECEDOR';
alter table TB_ACAD_PEDIDO_COMPRA
  add constraint PK_PEDIDO_COMPRA primary key (ID_PEDIDO_COMPRA);
alter table TB_ACAD_PEDIDO_COMPRA
  add constraint FK_PEDIDO_COMPRA_FORNECEDOR foreign key (FK_ID_FORNECEDOR)
  references TB_ACAD_FORNECEDOR (ID_FORNECEDOR);
alter table TB_ACAD_PEDIDO_COMPRA
  add constraint FK_PEDIDO_COMPRA_FUNCIONARIO foreign key (FK_ID_FUNCIONARIO)
  references TB_ACAD_FUNCIONARIO (ID_FUNCIONARIO);

prompt
prompt Creating table TB_ACAD_ITEM_PEDIDO_COMPRA
prompt =========================================
prompt
create table TB_ACAD_ITEM_PEDIDO_COMPRA
(
  id_item_pedido_compra NUMBER generated always as identity,
  subtotal              NUMBER(12,2),
  quantidade            NUMBER not null,
  preco_custo           NUMBER(12,2),
  margem_lucro          NUMBER(12,2),
  fk_id_item_estoque    NUMBER not null,
  fk_id_pedido_compra   NUMBER not null
)
;
comment on column TB_ACAD_ITEM_PEDIDO_COMPRA.id_item_pedido_compra
  is 'Identificador';
comment on column TB_ACAD_ITEM_PEDIDO_COMPRA.subtotal
  is 'SUBTOTAL ITEM_PEDIDO_COMPRA';
comment on column TB_ACAD_ITEM_PEDIDO_COMPRA.quantidade
  is 'QUANTIDADE ITEM_PEDIDO_COMPRA';
comment on column TB_ACAD_ITEM_PEDIDO_COMPRA.preco_custo
  is 'PRECO CUSTO ITEM_PEDIDO_COMPRA';
comment on column TB_ACAD_ITEM_PEDIDO_COMPRA.margem_lucro
  is 'MARGEM LUCRO ITEM_PEDIDO_COMPRA';
comment on column TB_ACAD_ITEM_PEDIDO_COMPRA.fk_id_item_estoque
  is 'FK DO ITEM_ESTOQUE';
comment on column TB_ACAD_ITEM_PEDIDO_COMPRA.fk_id_pedido_compra
  is 'FK DO PEDIDO_COMPRA';
alter table TB_ACAD_ITEM_PEDIDO_COMPRA
  add constraint PK_ITEM_PEDIDO_COMPRA primary key (ID_ITEM_PEDIDO_COMPRA);
alter table TB_ACAD_ITEM_PEDIDO_COMPRA
  add constraint FK_ITEM_PEDIDO_COMPRA_ITEM_ESTOQUE foreign key (FK_ID_ITEM_ESTOQUE)
  references TB_ACAD_ITEM_ESTOQUE (ID_ITEM_ESTOQUE);
alter table TB_ACAD_ITEM_PEDIDO_COMPRA
  add constraint FK_ITEM_PEDIDO_COMPRA_PEDIDO_COMPRA foreign key (FK_ID_PEDIDO_COMPRA)
  references TB_ACAD_PEDIDO_COMPRA (ID_PEDIDO_COMPRA);

prompt
prompt Creating table TB_ACAD_SERVICO
prompt ==============================
prompt
create table TB_ACAD_SERVICO
(
  id_servico_produto NUMBER generated always as identity,
  nome               VARCHAR2(200) not null,
  valor              NUMBER not null,
  descricao          VARCHAR2(200) not null,
  tipo               NUMBER not null,
  status             NUMBER not null
)
;
comment on column TB_ACAD_SERVICO.id_servico_produto
  is 'Identificador';
comment on column TB_ACAD_SERVICO.nome
  is 'NOME DO SERVIÇO';
comment on column TB_ACAD_SERVICO.valor
  is 'VALOR DO SERVIÇO';
comment on column TB_ACAD_SERVICO.descricao
  is 'DESCRIÇÃO DO SERVIÇO';
comment on column TB_ACAD_SERVICO.tipo
  is '1 - Pedido, 2 - Produto';
comment on column TB_ACAD_SERVICO.status
  is 'STATUS: 1 - ATIVO / 2 - INATIVO';
alter table TB_ACAD_SERVICO
  add constraint PK_SERVICO primary key (ID_SERVICO_PRODUTO);

prompt
prompt Creating table TB_ACAD_SERVICO_ITEM_PEDIDO
prompt ==========================================
prompt
create table TB_ACAD_SERVICO_ITEM_PEDIDO
(
  fk_id_item_pedido     NUMBER not null,
  fk_id_servico_produto NUMBER not null,
  quantidade            NUMBER not null
)
;
comment on column TB_ACAD_SERVICO_ITEM_PEDIDO.fk_id_item_pedido
  is 'IDENTIFICADOR ITEM DO PEDIDO';
comment on column TB_ACAD_SERVICO_ITEM_PEDIDO.fk_id_servico_produto
  is 'ID SERVICO PRODUTO';
comment on column TB_ACAD_SERVICO_ITEM_PEDIDO.quantidade
  is 'QUANTIDADE';
alter table TB_ACAD_SERVICO_ITEM_PEDIDO
  add constraint FK_ID_ITEM_PEDIDO_ITEM_PEDIDO foreign key (FK_ID_ITEM_PEDIDO)
  references TB_ACAD_ITEM_PEDIDO (ID_ITEM_PEDIDO);
alter table TB_ACAD_SERVICO_ITEM_PEDIDO
  add constraint FK_ID_SERVICO_PRODUTO_PRODUTO_SERVICO foreign key (FK_ID_SERVICO_PRODUTO)
  references TB_ACAD_SERVICO (ID_SERVICO_PRODUTO);

prompt
prompt Creating table TB_ACAD_SERVICO_PEDIDO
prompt =====================================
prompt
create table TB_ACAD_SERVICO_PEDIDO
(
  fk_id_servico_produto NUMBER not null,
  fk_id_pedido          NUMBER not null,
  quantidade            NUMBER not null
)
;
comment on column TB_ACAD_SERVICO_PEDIDO.fk_id_servico_produto
  is 'IDENTIFICADOR DO ID DO SERVICO';
comment on column TB_ACAD_SERVICO_PEDIDO.fk_id_pedido
  is 'ID PEDIDO';
comment on column TB_ACAD_SERVICO_PEDIDO.quantidade
  is 'QUANTIDADE';
alter table TB_ACAD_SERVICO_PEDIDO
  add constraint FK_ID_PEDIDO_PEDIDO foreign key (FK_ID_PEDIDO)
  references TB_ACAD_PEDIDO (ID_PEDIDO);

prompt
prompt Creating view PEDIDO_POSSUI_ITEM_PEDIDO
prompt =======================================
prompt
create or replace force view pedido_possui_item_pedido as
select count(*) as quantidade, p.fk_id_pedido
from tb_acad_item_pedido p group by p.fk_id_pedido;

prompt
prompt Creating view V_ITEM_ESTOQUE
prompt ============================
prompt
create or replace force view v_item_estoque as
select prod.nome, est.quantidade, est.preco_custo, est.margem_lucro, est.preco_venda
from tb_acad_item_estoque est inner join tb_acad_produto prod
     on prod.id_produto = est.fk_id_produto
     order by prod.nome asc;

prompt
prompt Creating view V_ITEM_ESTOQUE_PROD
prompt =================================
prompt
create or replace force view v_item_estoque_prod as
select est.id_item_estoque, prod.nome, est.status
from tb_acad_item_estoque est inner join tb_acad_produto prod
     on prod.id_produto = est.fk_id_produto
     order by prod.nome asc;

prompt
prompt Creating package PACK_CARRINHO
prompt ==============================
prompt
create or replace package PACK_CARRINHO is

  -- Author  : Leonardo V.
  -- Created : 10/18/2021 1:26:18 PM
  -- Purpose : Guardar produtos antes da venda.

 type produtos_venda is record (
                         codigo             tb_acad_produto.id_produto%type,
                         nome               tb_acad_produto.nome%type,
                         preco              tb_acad_item_estoque.preco_venda%type,
                         quantidade         tb_acad_item_estoque.quantidade%type,
                         id_item_estoque    tb_acad_item_estoque.id_item_estoque%type
                         );
                         

  type listar_carrinho is record (
                         nome               tb_acad_produto.nome%type,
                         quantidade         tb_acad_item_estoque.quantidade%type,
                         preco              tb_acad_item_estoque.preco_venda%type,
                         subtotal           tb_acad_item_pedido.subtotal%type,
                         fk_id_item_estoque tb_acad_item_pedido.fk_id_item_estoque%type,
                         id_item_pedido     tb_acad_item_pedido.id_item_pedido%type
                                                  );

  type listar_carrinho_compra is record (
                         id_produto         tb_acad_produto.id_produto%type,
                         nome               tb_acad_produto.nome%type,
                         quantidade         tb_acad_item_pedido_compra.quantidade%type,
                         preco_custo        tb_acad_item_pedido_compra.preco_custo%type,
                         preco_venda        tb_acad_item_pedido_compra.preco_custo%type,
                         margem_lucro       tb_acad_item_pedido_compra.margem_lucro%type,
                         subtotal           tb_acad_item_pedido_compra.subtotal%type,
                         fk_id_item_estoque tb_acad_item_pedido_compra.fk_id_item_estoque%type,
                         id_item_pedido_compra tb_acad_item_pedido_compra.id_item_pedido_compra%type
                         );

 type cur_produtos_venda is ref cursor return produtos_venda;

 type cur_listar_carrinho is ref cursor return listar_carrinho;

 type cur_listar_carrinho_compra is ref cursor return listar_carrinho_compra;

 procedure proc_retorna_produtos ( p_tab in out cur_produtos_venda,
                                   p_tipo in number,
                                   p_palavra_chave in varchar
                                 );

 procedure proc_retorna_item_pedido (p_tab in out cur_listar_carrinho,
                                     p_id_pedido number
                                     );


 procedure proc_insere_item_pedido(
                                   p_subtotal               in tb_acad_item_pedido.subtotal%type,
                                   p_quantidade             in tb_acad_item_pedido.quantidade%type,
                                   p_fk_id_pedido           in tb_acad_item_pedido.fk_id_pedido%type,
                                   p_fk_id_item_estoque     in tb_acad_item_pedido.fk_id_item_estoque%type
                                   );
                                   
procedure proc_insere_item_pedido_compra(
                                   p_id_item_pedido_compra  out tb_acad_item_pedido_compra.id_item_pedido_compra%type,
                                   p_subtotal               in tb_acad_item_pedido_compra.subtotal%type,
                                   p_quantidade             in tb_acad_item_pedido_compra.quantidade%type,
                                   p_fk_id_pedido           in tb_acad_item_pedido_compra.fk_id_pedido_compra%type,
                                   p_fk_id_item_estoque     in tb_acad_item_pedido_compra.fk_id_item_estoque%type,
                                   p_preco_custo            in tb_acad_item_pedido_compra.preco_custo%type,
                                   p_margem_lucro           in tb_acad_item_pedido_compra.margem_lucro%type
                                   );

  procedure proc_altera_item_pedido(
                                   p_id_item_pedido            in  tb_acad_item_pedido.id_item_pedido%type,
                                   p_subtotal               in out tb_acad_item_pedido.subtotal%type,
                                   p_quantidade             in out tb_acad_item_pedido.quantidade%type
                                   );
  
  procedure proc_altera_item_pedido_compr(
                                   p_id_item_pedido_compra  in tb_acad_item_pedido_compra.id_item_pedido_compra%type,
                                   p_subtotal               in tb_acad_item_pedido_compra.subtotal%type,
                                   p_quantidade             in tb_acad_item_pedido_compra.quantidade%type,
                                   p_preco_custo            in tb_acad_item_pedido_compra.preco_custo%type,
                                   p_margem_lucro           in tb_acad_item_pedido_compra.margem_lucro%type
                                   );

  procedure proc_retorna_item_pedido_compr (p_tab in out cur_listar_carrinho_compra,
                                     p_id_pedido_compra number
                                     );

  procedure proc_exclui_item_pedido(
                                   p_id_item_pedido            in  tb_acad_item_pedido.id_item_pedido%type
                                   );
                                   
  procedure proc_exclui_item_pedido_compr(
                                   p_id_item_pedido_compra      in  tb_acad_item_pedido_compra.id_item_pedido_compra%type
                                   );


  -- Retorna se tem registro
  function func_retorna_tem_registro(p_numero_pedido in tb_acad_pedido.id_pedido%type)
                            return number;
                            
function func_tem_registro_compra(p_numero_pedido_compra in tb_acad_pedido_compra.id_pedido_compra%type) 
  return number;
  
procedure proc_retorna_quantidade(     p_id_item_estoque in number,
                                       p_id_item_pedido in number,
                                       p_qtde_estoque out number,
                                       p_qtde_pedido out number);
procedure proc_limpa_carrinho(p_id_pedido number);                                       

end PACK_CARRINHO;
/

prompt
prompt Creating package PACK_CLIENTE
prompt =============================
prompt
create or replace package PACK_CLIENTE is

type clientes is record(
     id_cliente           tb_acad_cliente.id_cliente%type,
     cpf_cnpj             tb_acad_cliente.cpf_cnpj%type,
     nome                 tb_acad_cliente.nome%type,
     data_nascimento      tb_acad_cliente.data_nascimento%type,
     estado_civil         tb_acad_cliente.estado_civil%type,
     email                tb_acad_cliente.email%type,
     telefone             tb_acad_cliente.telefone%type,
     status               tb_acad_cliente.status%type);

type cur_clientes is ref cursor return clientes;

procedure proc_consulta_cliente(p_tab in out cur_clientes,
                                p_tipo_pesquisa in number,
                                p_palavra_chave in varchar2,
                                p_tipo_status in number);

procedure proc_busca_cliente(p_cpf_cnpj in         tb_acad_cliente.cpf_cnpj%type,
                             p_nome out            tb_acad_cliente.nome%type,
                             p_data_nascimento out tb_acad_cliente.data_nascimento%type,
                             p_estado_civil out    tb_acad_cliente.estado_civil%type,
                             p_email out           tb_acad_cliente.email%type,
                             p_telefone out        tb_acad_cliente.telefone%type,
                             p_status out          tb_acad_cliente.status%type);

procedure proc_insere_cliente(p_cpf_cnpj in         tb_acad_cliente.cpf_cnpj%type,
                              p_nome in             tb_acad_cliente.nome%type,
                              p_data_nascimento in  tb_acad_cliente.data_nascimento%type,
                              p_estado_civil in     tb_acad_cliente.estado_civil%type,
                              p_email in            tb_acad_cliente.email%type,
                              p_telefone in         tb_acad_cliente.telefone%type,
                              p_status in           tb_acad_cliente.status%type);

procedure proc_altera_cliente(
                             p_cpf_cnpj in tb_acad_cliente.cpf_cnpj%type,
                             p_nome in tb_acad_cliente.nome%type,
                             p_data_nascimento in tb_acad_cliente.data_nascimento%type,
                             p_estado_civil in tb_acad_cliente.estado_civil%type,
                             p_email in tb_acad_cliente.email%type,
                             p_telefone in tb_acad_cliente.telefone%type,
                             p_status in tb_acad_cliente.status%type
                             );

function func_retorna_id_cliente(p_cpf_cnpj in tb_acad_cliente.cpf_cnpj%type)
                                return tb_acad_cliente.id_cliente%type;

end PACK_CLIENTE;
/

prompt
prompt Creating package PACK_ENDERECO
prompt ==============================
prompt
create or replace package PACK_ENDERECO is

type endereco is record(
     id_endereco          tb_acad_endereco.id_endereco%type,
     logradouro           tb_acad_endereco.logradouro%type,
     bairro               tb_acad_endereco.bairro%type,
     cep                  tb_acad_endereco.cep%type,
     numero               tb_acad_endereco.numero%type,
     endereco_principal   tb_acad_endereco.endereco_principal%type,
     cidade               tb_acad_cidade.id_cidade%type,
     estado               tb_acad_estado.id_estado%type);

type cur_endereco is ref cursor return endereco;

procedure proc_busca_endereco(p_cpf_cnpj in tb_acad_cliente.cpf_cnpj%type,
                              p_endereco_principal in tb_acad_endereco.endereco_principal%type,
                              p_tipo in number,
                               logradouro    out       tb_acad_endereco.logradouro%type,
                               bairro        out       tb_acad_endereco.bairro%type,
                               cep           out       tb_acad_endereco.cep%type,
                               numero        out       tb_acad_endereco.numero%type,
                               cidade        out       tb_acad_cidade.id_cidade%type,
                               estado        out       tb_acad_estado.id_estado%type
                                );

procedure proc_insere_endereco(
                              p_cpf_cnpj in tb_acad_cliente.cpf_cnpj%type,
                              p_endereco_principal in tb_acad_endereco.endereco_principal%type,
                              p_tipo in number,
                              p_logradouro    in       tb_acad_endereco.logradouro%type,
                              p_bairro        in       tb_acad_endereco.bairro%type,
                              p_cep           in       tb_acad_endereco.cep%type,
                              p_numero        in       tb_acad_endereco.numero%type,
                              p_cidade        in       tb_acad_cidade.id_cidade%type
                               );
procedure proc_altera_endereco(
                              p_cpf_cnpj in tb_acad_cliente.cpf_cnpj%type,
                              p_endereco_principal in tb_acad_endereco.endereco_principal%type,
                              p_tipo in number,
                              p_logradouro    in       tb_acad_endereco.logradouro%type,
                              p_bairro        in       tb_acad_endereco.bairro%type,
                              p_cep           in       tb_acad_endereco.cep%type,
                              p_numero        in       tb_acad_endereco.numero%type,
                              p_cidade        in       tb_acad_cidade.id_cidade%type
                               );


end PACK_ENDERECO;
/

prompt
prompt Creating package PACK_FORNECEDOR
prompt ================================
prompt
create or replace package PACK_FORNECEDOR is

type fornecedores is record(
     id_fornecedor           tb_acad_fornecedor.id_fornecedor%type,
     nome                    tb_acad_fornecedor.nome%type,
     cpf_cnpj                tb_acad_fornecedor.cpf_cnpj%type,
     telefone                tb_acad_fornecedor.telefone%type,
     status                  tb_acad_fornecedor.status%type);

type cur_fornecedores is ref cursor return fornecedores;

procedure proc_consulta_fornecedor(p_tab in out cur_fornecedores,
                                   p_tipo_pesquisa in number,
                                   p_palavra_chave in varchar2,
                                   p_tipo_status in number);

procedure proc_busca_fornecedor(p_id_fornecedor in number,
                                P_nome_fornecedor out varchar2,
                                p_cpf_cnpj out varchar2,
                                p_telefone out varchar2,
                                p_status out number);

procedure proc_insere_fornecedor(p_nome in        tb_acad_fornecedor.nome%type,
                                 p_cpf_cnpj in    tb_acad_fornecedor.cpf_cnpj%type,
                                 p_telefone in    tb_acad_fornecedor.telefone%type,
                                 p_status in      tb_acad_fornecedor.status%type);

procedure proc_altera_fornecedor(p_nome in        tb_acad_fornecedor.nome%type,
                                 p_cpf_cnpj in    tb_acad_fornecedor.cpf_cnpj%type,
                                 p_telefone in    tb_acad_fornecedor.telefone%type,
                                 p_status in      tb_acad_fornecedor.status%type);

function func_retorna_id_fornecedor(p_cpf_cnpj in tb_acad_fornecedor.cpf_cnpj%type)
                                return tb_acad_fornecedor.id_fornecedor%type;


end PACK_FORNECEDOR;
/

prompt
prompt Creating package PACK_FUNCIONARIO
prompt =================================
prompt
create or replace package PACK_FUNCIONARIO is

type funcionarios is record(
     id_funcionario      tb_acad_funcionario.id_funcionario%type,
     nome                tb_acad_funcionario.nome%type,
     cpf_cnpj            tb_acad_funcionario.cpf_cnpj%type,
     tipo_permissao      tb_acad_funcionario.tipo_permissao%type,
     data_nascimento     tb_acad_funcionario.data_nascimento%type,
     senha               tb_acad_funcionario.senha%type,
     status              tb_acad_funcionario.status%type);

type cur_funcionarios is ref cursor return funcionarios;

procedure proc_consulta_funcionario(p_tab in out cur_funcionarios,
                                    p_tipo_pesquisa in number,
                                    p_palavra_chave in varchar2,
                                    p_tipo_status in number);

procedure proc_busca_funcionario(     p_id_funcionario in      out   tb_acad_funcionario.id_funcionario%type,
                                      p_nome                   out   tb_acad_funcionario.nome%type,
                                      p_cpf_cnpj               out   tb_acad_funcionario.cpf_cnpj%type,
                                      p_tipo_permissao         out   tb_acad_funcionario.tipo_permissao%type,
                                      p_data_nascimento        out   tb_acad_funcionario.data_nascimento%type,
                                      p_senha                  out   tb_acad_funcionario.senha%type,
                                      p_status                 out   tb_acad_funcionario.status%type);


procedure proc_insere_funcionario(
                                 p_nome in tb_acad_funcionario.nome%type,
                                 p_cpf_cnpj in tb_acad_funcionario.cpf_cnpj%type,
                                 p_tipo_permissao in tb_acad_funcionario.tipo_permissao%type,
                                 p_data_nascimento in tb_acad_funcionario.data_nascimento%type,
                                 p_senha in tb_acad_funcionario.senha%type,
                                 p_status in tb_acad_funcionario.status%type);

procedure proc_altera_funcionario(
                                 p_id_funcionario in tb_acad_funcionario.id_funcionario%type,
                                 p_nome in tb_acad_funcionario.nome%type,
                                 p_cpf_cnpj in tb_acad_funcionario.cpf_cnpj%type,
                                 p_tipo_permissao in tb_acad_funcionario.tipo_permissao%type,
                                 p_data_nascimento in tb_acad_funcionario.data_nascimento%type,
                                 p_senha in tb_acad_funcionario.senha%type,
                                 p_status in tb_acad_funcionario.status%type);


procedure proc_verifica_login(p_re in tb_acad_funcionario.id_funcionario%type,
                              p_senha in tb_acad_funcionario.senha%type,
                              p_nome out tb_acad_funcionario.nome%type,
                              p_permissao out tb_acad_funcionario.tipo_permissao%type);
end PACK_FUNCIONARIO;
/

prompt
prompt Creating package PACK_ITEM_ESTOQUE
prompt ==================================
prompt
CREATE OR REPLACE PACKAGE PACK_ITEM_ESTOQUE IS

type item_estoque is record(
 id_item_estoque              tb_acad_item_estoque.id_item_estoque%type,
 quantidade                   tb_acad_item_estoque.quantidade%type,
 data_cadastro                tb_acad_item_estoque.data_cadastro%type,
 status                       tb_acad_item_estoque.status%type,
 preco_custo                  tb_acad_item_estoque.preco_custo%type,
 margem_lucro                 tb_acad_item_estoque.margem_lucro%type,
 preco_venda                  tb_acad_item_estoque.preco_venda%type,
 fk_id_produto                tb_acad_item_estoque.fk_id_produto%type,
 fk_id_estoque                tb_acad_item_estoque.fk_id_estoque%type

);

type cur_item_estoque is ref cursor return item_estoque;



type item_estoque_tab is record(
 id_item_estoque              tb_acad_item_estoque.id_item_estoque%type,
 nome_produto                 tb_acad_produto.nome%type,
 status                       tb_acad_item_estoque.status%type
);

type cur_item_estoque_tab is ref cursor return item_estoque_tab;


procedure proc_consulta_item_estoque( p_tab in out cur_item_estoque_tab,
                                      p_tipo_pesquisa in number,
                                      p_palavra_chave in varchar2,
                                      p_tipo_status in number);


procedure proc_busca_prod_forn( p_id_item_estoque in tb_acad_item_estoque.id_item_estoque%type,
                                p_prod_nome out tb_acad_produto.nome%type,
                                p_item_estoque_status out tb_acad_item_estoque.status%type,
                                p_item_estoque_quantidade out tb_acad_item_estoque.quantidade%type,
                                p_item_estoque_preco_custo out tb_acad_item_estoque.preco_custo%type,
                                p_item_estoque_margem out tb_acad_item_estoque.margem_lucro%type,
                                p_item_estoque_preco_venda out tb_acad_item_estoque.preco_venda%type,
                                p_forn_nome out tb_acad_fornecedor.nome%type,
                                p_forn_cnpj out tb_acad_fornecedor.cpf_cnpj%type
                                );

procedure proc_altera_margem(
                                p_id_item_estoque in tb_acad_item_estoque.id_item_estoque%type,
                                p_item_estoque_margem in tb_acad_item_estoque.margem_lucro%type,
                                p_item_estoque_preco_venda in tb_acad_item_estoque.preco_venda%type
                             );
                             
procedure insere_item_estoque_aguardando(p_id_item_estoque out tb_acad_item_estoque.id_item_estoque%type,
                                      p_id_produto       in tb_acad_item_estoque.fk_id_produto%type                  
                                      );



end;
/

prompt
prompt Creating package PACK_ITEM_PEDIDO_COMPRA
prompt ========================================
prompt
CREATE OR REPLACE PACKAGE PACK_ITEM_PEDIDO_COMPRA IS

type item_pedido_compra is record(
         id_item_pedido_compra   tb_acad_item_pedido_compra.id_item_pedido_compra%type,
         subtotal                tb_acad_item_pedido_compra.subtotal%type,
         quantidade              tb_acad_item_pedido_compra.quantidade%type,
         fk_id_pedido_compra     tb_acad_item_pedido_compra.fk_id_pedido_compra%type,
         fk_id_item_estoque      tb_acad_item_pedido_compra.fk_id_item_estoque%type,
         --id_item_estoque              tb_acad_item_estoque.id_item_estoque%type,
         --quantidade                   tb_acad_item_estoque.quantidade%type,
         --data_cadastro                tb_acad_item_estoque.data_cadastro%type,
         --status                       tb_acad_item_estoque.status%type,
         preco_custo                  tb_acad_item_estoque.preco_custo%type,
         margem_lucro                 tb_acad_item_estoque.margem_lucro%type,
         preco_venda                  tb_acad_item_estoque.preco_venda%type,
         --fk_id_produto                tb_acad_item_estoque.fk_id_produto%type,
         --fk_id_estoque                tb_acad_item_estoque.fk_id_estoque%type,
         id_produto       tb_acad_produto.id_produto%type,
         nome             tb_acad_produto.nome%type,
         descricao        tb_acad_produto.descricao%type
         --status           tb_acad_produto.status%type
         );

type cur_pedido is ref cursor return item_pedido_compra;

--trazer os dados do itens do pedindo fazendo junção da item_estoque e do produto
procedure proc_consulta_item_pedido_compra(p_tab in out cur_pedido,
                                           p_id_pedido_compra in number);
                                     
--remove do estoque os items acrescentados após o cancelamento do pedido_compra                                          
procedure remove_item_estoque_pd_compra(p_id_pedido in tb_acad_pedido_compra.id_pedido_compra%type,
                               p_cnpj_fornecedor in tb_acad_pedido_compra.fk_id_fornecedor%type);

end;
/

prompt
prompt Creating package PACK_ITEM_PEDIDO_VENDA
prompt =======================================
prompt
CREATE OR REPLACE PACKAGE PACK_ITEM_PEDIDO_VENDA IS

type item_pedido is record(
         id_item_pedido   tb_acad_item_pedido.id_item_pedido%type,
         subtotal         tb_acad_item_pedido.subtotal%type,
         quantidade       tb_acad_item_pedido.quantidade%type,
         fk_id_pedido     tb_acad_item_pedido.fk_id_pedido%type,
         fk_id_item_estoque tb_acad_item_pedido.fk_id_item_estoque%type,
         --id_item_estoque              tb_acad_item_estoque.id_item_estoque%type,
         --quantidade                   tb_acad_item_estoque.quantidade%type,
         --data_cadastro                tb_acad_item_estoque.data_cadastro%type,
         --status                       tb_acad_item_estoque.status%type,
         preco_custo                  tb_acad_item_estoque.preco_custo%type,
         margem_lucro                 tb_acad_item_estoque.margem_lucro%type,
         preco_venda                  tb_acad_item_estoque.preco_venda%type,
         --fk_id_produto                tb_acad_item_estoque.fk_id_produto%type,
         --fk_id_estoque                tb_acad_item_estoque.fk_id_estoque%type,
         id_produto       tb_acad_produto.id_produto%type,
         nome             tb_acad_produto.nome%type,
         descricao        tb_acad_produto.descricao%type
         --status           tb_acad_produto.status%type
         );

type cur_pedido is ref cursor return item_pedido;

--trazer os dados do itens do pedindo fazendo junção da item_estoque e do produto
procedure proc_consulta_item_pedido(p_tab in out cur_pedido,
                                    p_id_pedido in number);


                                    
procedure retorna_item_estoque(p_id_pedido in tb_acad_pedido.id_pedido%type);

end;
/

prompt
prompt Creating package PACK_PEDIDO_COMPRA
prompt ===================================
prompt
CREATE OR REPLACE PACKAGE PACK_PEDIDO_COMPRA IS
type pedidos is record (
 id_pedido_compra    tb_acad_pedido_compra.id_pedido_compra%type,
 preco_total         tb_acad_pedido_compra.preco_total%type,
 data_compra         tb_acad_pedido_compra.data_compra%type,
 status              tb_acad_pedido_compra.status%type,
 fk_id_fornecedor    tb_acad_pedido_compra.fk_id_fornecedor%type,
 fk_id_funcionario    tb_acad_pedido_compra.fk_id_funcionario%type

 );

type cur_pedido is ref cursor return pedidos;

/*
procedure proc_consulta_pedido(p_tab in out cur_pedido,
              p_tipo_pesquisa in number,
              p_palavra_chave in varchar2);

*/

procedure proc_insere_pedido(p_id_pedido_compra         out  tb_acad_pedido_compra.id_pedido_compra%type,
                             p_data_compra       out   tb_acad_pedido_compra.data_compra%type,                             
                             p_fk_id_funcionario in   tb_acad_pedido_compra.fk_id_funcionario%type,
                             p_fk_id_fornecedor in   tb_acad_pedido_compra.fk_id_fornecedor%type,
                             p_status out tb_acad_pedido_compra.status%type);
                             
procedure proc_busca_pedido(p_id_pedido_compra in out  tb_acad_pedido_compra.id_pedido_compra%type,
                            p_preco_total out   tb_acad_pedido_compra.preco_total%type,
                            p_data_compra out   tb_acad_pedido_compra.data_compra%type,
                            p_status      out   tb_acad_pedido_compra.status%type,
                            p_cpf_cnpj    out   tb_acad_fornecedor.cpf_cnpj%type,
                            p_fornecedor  out   tb_acad_fornecedor.nome%type,
                            p_funcionario out   tb_acad_funcionario.nome%type);
                            
procedure proc_altera_status(p_id_pedido_compra in tb_acad_pedido_compra.id_pedido_compra%type,
                               p_status out tb_acad_pedido_compra.status%type);
                            
procedure proc_conclui_pedido(p_id_pedido_compra in tb_acad_pedido_compra.id_pedido_compra%type,
                               p_status out tb_acad_pedido_compra.status%type);

procedure proc_cancela_pedido(p_id_pedido_compra in tb_acad_pedido_compra.id_pedido_compra%type,
                               p_status out tb_acad_pedido_compra.status%type);
                               
procedure inativa_item_estoque(p_id_pedido_compra in tb_acad_pedido_compra.id_pedido_compra%type);
                               
procedure proc_insere_item_estoque( p_item_estoque             in tb_acad_item_estoque.id_item_estoque%type,               
                                     p_quantidade               in tb_acad_item_estoque.quantidade%type,
                                     p_preco_custo              in tb_acad_item_estoque.preco_custo%type,
                                     p_margem_lucro             in tb_acad_item_estoque.margem_lucro%type,
                                 
                                     p_id_produto               in tb_acad_item_estoque.fk_id_produto%type
                                   );

/*
procedure proc_altera_pedido(p_id_pedido_compra in     tb_acad_pedido_compra.id_pedido_compra%type,
             p_preco_total in   tb_acad_pedido_compra.preco_total%type,
             p_data_compra in   tb_acad_pedido_compra.data_compra%type,
             p_status in        tb_acad_pedido_compra.status%type,
             p_fk_id_fornecedor in tb_acad_pedido_compra.fk_id_fornecedor%type,
             p_fk_id_funcionario in tb_acad_pedido_compra.fk_id_funcionario%type);
*/
end;
/

prompt
prompt Creating package PACK_PEDIDO_VENDA
prompt ==================================
prompt
CREATE OR REPLACE PACKAGE PACK_PEDIDO_VENDA IS
type pedidos is record (
     id_pedido        tb_acad_pedido.id_pedido%type,
     preco_total      tb_acad_pedido.preco_total%type,
     data_pedido      tb_acad_pedido.data_pedido%type,
     status           tb_acad_pedido.status%type,
     fk_id_cliente    tb_acad_pedido.fk_id_cliente%type,
     fk_id_funcionario tb_acad_pedido.fk_id_funconario%type
     --cliente           pack_cliente.clientes%type,
     --funcionario       pack_funcionario.funcionarios%type
     );

type cur_pedido is ref cursor return pedidos;



/*
procedure proc_consulta_pedido(p_tab in out cur_pedido,
                                p_tipo_pesquisa in number,
                                p_palavra_chave in varchar2);

*/


-- alterado por Bruno, o pedido tem que retornar o ID, para colocar no campo,
procedure proc_insere_pedido(p_id_pedido         out   tb_acad_pedido.id_pedido%type,
                             p_data_pedido       out   tb_acad_pedido.data_pedido%type,
                             p_fk_id_cliente      in   tb_acad_pedido.fk_id_cliente%type,
                             p_fk_id_funcionario  in   tb_acad_pedido.fk_id_funconario%type,
                             p_status out tb_acad_pedido.status%type);

procedure proc_altera_pedido(p_id_pedido in     tb_acad_pedido.id_pedido%type,
                             p_fk_id_cliente in tb_acad_pedido.fk_id_cliente%type,
                             p_fk_id_funcionario in tb_acad_pedido.fk_id_funconario%type);

procedure proc_busca_pedido(p_id_pedido in out  tb_acad_pedido.id_pedido%type,
                            p_preco_total out   tb_acad_pedido.preco_total%type,
                            p_data_pedido out   tb_acad_pedido.data_pedido%type,
                            p_status      out   tb_acad_pedido.status%type,
                            p_cpf_cnpj    out   tb_acad_cliente.cpf_cnpj%type,
                            p_cliente     out   tb_acad_cliente.nome%type,
                            p_funcionario out   tb_acad_funcionario.nome%type);

procedure proc_altera_status(p_id_pedido in tb_acad_pedido.id_pedido%type,
                               p_status out tb_acad_pedido.status%type);

procedure proc_conclui_pedido(p_id_pedido in tb_acad_pedido.id_pedido%type,
                               p_status out tb_acad_pedido.status%type);

procedure proc_cancela_pedido(p_id_pedido in tb_acad_pedido.id_pedido%type,
                               p_status out tb_acad_pedido.status%type);
                               
procedure proc_reabre_pedido(p_id_pedido in tb_acad_pedido.id_pedido%type,
                               p_status out tb_acad_pedido.status%type);

end pack_pedido_venda;
/

prompt
prompt Creating package PACK_PRODUTO
prompt =============================
prompt
CREATE OR REPLACE PACKAGE PACK_PRODUTO IS
type produto is record(
         id_produto       tb_acad_produto.id_produto%type,
         nome             tb_acad_produto.nome%type,
         descricao        tb_acad_produto.descricao%type,
         status           tb_acad_produto.status%type);

type cur_produto is ref cursor return produto;

procedure proc_consulta_produto(p_tab in out cur_produto,
                                p_tipo_pesquisa in number,
                                p_palavra_chave in varchar2,
                                p_tipo_status in number);

procedure proc_busca_produto(    p_id_produto in out   tb_acad_produto.id_produto%type,
                                 p_nome out            tb_acad_produto.nome%type,
                                 p_descricao out       tb_acad_produto.descricao%type,
                                 p_status out          tb_acad_produto.status%type);


procedure proc_insere_produto(p_nome in            tb_acad_produto.nome%type,
                              p_descricao in       tb_acad_produto.descricao%type,
                              p_status in          tb_acad_produto.status%type);

procedure proc_altera_produto(
                             p_id_produto in tb_acad_produto.id_produto%type,
                             p_nome in tb_acad_produto.nome%type,
                             p_descricao in tb_acad_produto.descricao%type,
                             p_status in tb_acad_produto.status%type);



END;
/

prompt
prompt Creating package PACK_RELATORIO
prompt ===============================
prompt
create or replace package PACK_RELATORIO is

  -- Author  : Mateus Luiz
  -- Created : 26/10/2021

  type listar_rel_lucratividade is record (
                         nome                 tb_acad_produto.nome%type,
                         quantidade_vendida   tb_acad_item_estoque.quantidade%type,
                         preco_custo          tb_acad_item_estoque.preco_custo%type,
                         margem_lucro         tb_acad_item_estoque.margem_lucro%type,
                         preco_venda          tb_acad_item_estoque.preco_venda%type,
                         lucro_total          tb_acad_item_estoque.preco_venda%type
                         );


  type cur_listar_rel_lucratividade is ref cursor return listar_rel_lucratividade;

  procedure proc_retorna_rel_lucratividade(p_tab in out cur_listar_rel_lucratividade,
                                           p_data_inicio in date,
                                           p_data_fim in date
                                           );


  type listar_rel_vendas_diarias_vendedor is record (
                         num_pedido                     tb_acad_pedido.id_pedido%type,
                         nome_cliente                   tb_acad_cliente.nome%type,
                         preco_total                    tb_acad_pedido.preco_total%type,
                         status_pedido                  varchar(200),
                         nome_vendedor                  tb_acad_funcionario.nome%type
                         );


  type cur_listar_rel_vendas_diarias_vendedor is ref cursor return listar_rel_vendas_diarias_vendedor;

  procedure proc_retorna_rel_vendas_diarias_vendedor(p_tab in out cur_listar_rel_vendas_diarias_vendedor,
                                                     p_re_funcionario in tb_acad_funcionario.id_funcionario%type,
                                                     p_permissao in tb_acad_funcionario.tipo_permissao%type,
                                                     p_tipo_status in tb_acad_funcionario.status%type);

  procedure proc_rer(p_re_funcionario in tb_acad_funcionario.id_funcionario%type,
                     p_total_pedido out  number,
                     p_tipo_status in tb_acad_funcionario.status%type,
                      p_permissao in tb_acad_funcionario.tipo_permissao%type);

end PACK_RELATORIO;
/

prompt
prompt Creating package PACK_SERVICOS
prompt ==============================
prompt
create or replace package PACK_SERVICOS is

  -- Author  : L. Vecchi
  -- Created : 10/5/2021 1:32:50 PM

type servicos is record (
     id_servico_produto          tb_acad_servico.id_servico_produto%type,
     nome                        tb_acad_servico.nome%type,
     valor                       tb_acad_servico.valor%type,
     descricao                   tb_acad_servico.descricao%type,
     tipo                        tb_acad_servico.tipo%type,
     status                      tb_acad_servico.status%type);

type cur_servico is ref cursor return servicos;

procedure proc_insere_servico(p_nome in        tb_acad_servico.nome%type,
                              p_valor in       tb_acad_servico.valor%type,
                              p_descricao in   tb_acad_servico.descricao%type,
                              p_tipo in        tb_acad_servico.tipo%type,
                              p_status in      tb_acad_servico.status%type);

procedure proc_altera_servico(
                             p_id_servico_produto in tb_acad_servico.id_servico_produto%type,
                             p_nome in        tb_acad_servico.nome%type,
                             p_valor in       tb_acad_servico.valor%type,
                             p_descricao in   tb_acad_servico.descricao%type,
                             p_tipo in        tb_acad_servico.tipo%type,
                             p_status in      tb_acad_servico.status%type
                             );

procedure proc_consulta_servico(p_tab in out cur_servico,
                                p_tipo_pesquisa in number,
                                p_palavra_chave in varchar2,
                                p_tipo_status in number);

procedure proc_busca_servico(p_id_servico_produto in       tb_acad_servico.id_servico_produto%type,
                             p_nome out                    tb_acad_servico.nome%type,
                             p_valor out                   tb_acad_servico.valor%type,
                             p_descricao out               tb_acad_servico.descricao%type,
                             p_tipo out                    tb_acad_servico.tipo%type,
                             p_status out                  tb_acad_servico.status%type);


end PACK_SERVICOS;
/

prompt
prompt Creating function FUNC_SOMAR_SUBTOTAL
prompt =====================================
prompt
create or replace function func_somar_subtotal(p_id_pedido number)
return number is
       v_subtotal number;
begin
  select sum(ip.subtotal) into v_subtotal from tb_acad_item_pedido ip where ip.fk_id_pedido = p_id_pedido;
  return v_subtotal;
end;
/

prompt
prompt Creating procedure P_INCREMENTAR_VALOR_PEDIDO
prompt =============================================
prompt
create or replace procedure p_incrementar_valor_pedido (p_id_pedido in number, p_subtotal in number) as
begin
  update tb_acad_pedido ped
  set    ped.preco_total = ped.preco_total + p_subtotal
  where  ped.id_pedido = p_id_pedido;
end;
/

prompt
prompt Creating package body PACK_CARRINHO
prompt ===================================
prompt
create or replace package body PACK_CARRINHO is

 procedure proc_retorna_produtos ( p_tab in out cur_produtos_venda,
                                   p_tipo in number,
                                   p_palavra_chave in varchar
                                 ) is
                                 


    begin

    if p_tipo = 1 then

    open p_tab for
      select es.fk_id_produto,
             p.nome,
             es.preco_venda,
             es.quantidade,
             es.id_item_estoque

      from   tb_acad_item_estoque es
            ,tb_acad_produto      p
      where es.fk_id_produto = p.id_produto
      and   p.id_produto = p_palavra_chave
      and   es.status = 1;
    end if;

    if p_tipo = 2 then

    open p_tab for
      select es.fk_id_produto,
             p.nome,
             es.preco_venda,
             es.quantidade,
             es.id_item_estoque
      from   tb_acad_item_estoque es
            ,tb_acad_produto      p
      where es.fk_id_produto = p.id_produto
      and   upper(p.nome) like '%' || p_palavra_chave || '%'
      and   es.status = 1;
    end if;

    if p_tipo = 3 then

    open p_tab for
      select es.fk_id_produto,
             p.nome,
             es.preco_venda,
             es.quantidade,
             es.id_item_estoque
      from   tb_acad_item_estoque es
            ,tb_acad_produto      p
      where es.fk_id_produto = p.id_produto
      and   es.preco_venda = p_palavra_chave
      and   es.status = 1;
    end if;

 end  proc_retorna_produtos;

  procedure proc_insere_item_pedido(
                                   p_subtotal in                tb_acad_item_pedido.subtotal%type,
                                   p_quantidade in              tb_acad_item_pedido.quantidade%type,
                                   p_fk_id_pedido in            tb_acad_item_pedido.fk_id_pedido%type,
                                   p_fk_id_item_estoque in      tb_acad_item_pedido.fk_id_item_estoque%type
                                   ) is
   begin
      insert into tb_acad_item_pedido
      (subtotal,quantidade,fk_id_pedido,fk_id_item_estoque)
      values
      (p_subtotal,p_quantidade,p_fk_id_pedido,p_fk_id_item_estoque);

      commit;
   end proc_insere_item_pedido;

   procedure proc_retorna_item_pedido(p_tab in out cur_listar_carrinho,
                                      p_id_pedido number
                                     ) is

   begin

      open p_tab for
      select
        p.nome,
        ip.quantidade,
        ie.preco_venda,
        ip.subtotal,
        ip.fk_id_item_estoque,
        ip.id_item_pedido
      from tb_acad_item_pedido ip inner join tb_acad_item_estoque ie on ie.id_item_estoque = ip.fk_id_item_estoque
                                  inner join tb_acad_produto p on p.id_produto = ie.fk_id_produto
      where ip.fk_id_pedido = p_id_pedido;

   end proc_retorna_item_pedido;

   procedure proc_retorna_item_pedido_compr(p_tab in out cur_listar_carrinho_compra,
                                      p_id_pedido_compra number
                                     ) is

   begin

      open p_tab for
      select
        p.id_produto,
        p.nome,
        ip.quantidade,
        ip.preco_custo,
        ip.preco_custo + (ip.preco_custo*(ip.margem_lucro/100)) as preco_venda,
        ip.margem_lucro,
        ip.subtotal,
        ip.fk_id_item_estoque,
        ip.id_item_pedido_compra
      from tb_acad_item_pedido_compra ip inner join tb_acad_item_estoque ie on ie.id_item_estoque = ip.fk_id_item_estoque
                                  inner join tb_acad_produto p on p.id_produto = ie.fk_id_produto
      where ip.fk_id_pedido_compra = p_id_pedido_compra;

   end proc_retorna_item_pedido_compr;

     procedure proc_altera_item_pedido(
                                   p_id_item_pedido            in  tb_acad_item_pedido.id_item_pedido%type,
                                   p_subtotal               in out tb_acad_item_pedido.subtotal%type,
                                   p_quantidade             in out tb_acad_item_pedido.quantidade%type
                                   ) is
     begin
       update tb_acad_item_pedido ip
       set ip.quantidade = p_quantidade, ip.subtotal = p_subtotal
       where ip.id_item_pedido = p_id_item_pedido;
       commit;
     end proc_altera_item_pedido ;
     
      procedure proc_altera_item_pedido_compr(
                                   p_id_item_pedido_compra  in tb_acad_item_pedido_compra.id_item_pedido_compra%type,
                                   p_subtotal               in tb_acad_item_pedido_compra.subtotal%type,
                                   p_quantidade             in tb_acad_item_pedido_compra.quantidade%type,
                                   p_preco_custo            in tb_acad_item_pedido_compra.preco_custo%type,
                                   p_margem_lucro           in tb_acad_item_pedido_compra.margem_lucro%type
                                   ) is
      begin
           update tb_acad_item_pedido_compra ip
           set ip.quantidade = p_quantidade, ip.subtotal = p_subtotal, ip.preco_custo = p_preco_custo, ip.margem_lucro = p_margem_lucro
           where ip.id_item_pedido_compra = p_id_item_pedido_compra;
           
           commit;
      end proc_altera_item_pedido_compr;

     procedure proc_exclui_item_pedido(
                                   p_id_item_pedido            in  tb_acad_item_pedido.id_item_pedido%type
                                   ) is
     begin
       delete from tb_acad_item_pedido ip
       where ip.id_item_pedido = p_id_item_pedido;
       commit;
       end proc_exclui_item_pedido;
       
     procedure proc_exclui_item_pedido_compr(
                                   p_id_item_pedido_compra      in  tb_acad_item_pedido_compra.id_item_pedido_compra%type
                                   ) is
     begin
       delete from tb_acad_item_pedido_compra ip
       where ip.id_item_pedido_compra = p_id_item_pedido_compra;
       commit;
     end proc_exclui_item_pedido_compr;


   -- retorna 1 se tem itens e 2 se não tem
   function func_retorna_tem_registro(p_numero_pedido tb_acad_pedido.id_pedido%type) return number is
      v_qtde number;
    begin
       select count(ip.id_item_pedido) into v_qtde
       from   tb_acad_item_pedido ip
       where  ip.fk_id_pedido = p_numero_pedido;

      if v_qtde > 0 then
        return 1;
      else
        return 2;
      end if;

   end func_retorna_tem_registro;
   
   -- retorna 1 se tem itens e 2 se não tem
   function func_tem_registro_compra(p_numero_pedido_compra tb_acad_pedido_compra.id_pedido_compra%type) return number is
      v_qtde number;
    begin
       select count(ip.id_item_pedido_compra) into v_qtde
       from   tb_acad_item_pedido_compra ip
       where  ip.fk_id_pedido_compra = p_numero_pedido_compra;

      if v_qtde > 0 then
        return 1;
      else
        return 2;
      end if;

   end func_tem_registro_compra;

    procedure proc_insere_item_pedido_compra(
                                   p_id_item_pedido_compra  out tb_acad_item_pedido_compra.id_item_pedido_compra%type,
                                   p_subtotal               in tb_acad_item_pedido_compra.subtotal%type,
                                   p_quantidade             in tb_acad_item_pedido_compra.quantidade%type,
                                   p_fk_id_pedido           in tb_acad_item_pedido_compra.fk_id_pedido_compra%type,
                                   p_fk_id_item_estoque     in tb_acad_item_pedido_compra.fk_id_item_estoque%type,
                                   p_preco_custo            in tb_acad_item_pedido_compra.preco_custo%type,
                                   p_margem_lucro           in tb_acad_item_pedido_compra.margem_lucro%type
                                   ) is
     begin

        insert into tb_acad_item_pedido_compra (subtotal, quantidade, preco_custo, margem_lucro, fk_id_item_estoque, fk_id_pedido_compra) 
        values (p_subtotal, p_quantidade, p_preco_custo, p_margem_lucro, p_fk_id_item_estoque, p_fk_id_pedido);
        commit;
        
        select max(id_item_pedido_compra) into p_id_item_pedido_compra from tb_acad_item_pedido_compra;
     end proc_insere_item_pedido_compra;

     procedure proc_retorna_quantidade(p_id_item_estoque in number,
                                       p_id_item_pedido in number,
                                       p_qtde_estoque out number,
                                       p_qtde_pedido out number) is
               begin
               select t.quantidade
               into p_qtde_estoque
               from tb_acad_item_estoque t
               where t.id_item_estoque = p_id_item_estoque;
               
               select t.quantidade
               into p_qtde_pedido
               from tb_acad_item_pedido t
               where t.id_item_pedido = p_id_item_pedido;
     end proc_retorna_quantidade;
     
     procedure proc_limpa_carrinho(p_id_pedido number) is
       begin
       delete tb_acad_item_pedido  t
       where t.fk_id_pedido = p_id_pedido;
       commit;
     end proc_limpa_carrinho;                                 

end PACK_CARRINHO;
/

prompt
prompt Creating package body PACK_CLIENTE
prompt ==================================
prompt
create or replace package body PACK_CLIENTE is

procedure proc_consulta_cliente(p_tab in out cur_clientes,
                                p_tipo_pesquisa in number,
                                p_palavra_chave in varchar2,
                                p_tipo_status in number) is

 begin
  if p_tipo_status = 1 then
    if p_tipo_pesquisa = 1 then
      open p_tab for
        select *
        from tb_acad_cliente tac
        where UPPER(tac.nome) like '%' || UPPER(p_palavra_chave) || '%'
        and tac.status = 1;
    end if;

    if p_tipo_pesquisa = 2 then
      open p_tab for
        select *
        from tb_acad_cliente tac
        where tac.cpf_cnpj = p_palavra_chave
        and tac.status = 1;
    end if;

    if p_tipo_pesquisa = 3 then
      open p_tab for
        select *
        from tb_acad_cliente tac
        where tac.data_nascimento = p_palavra_chave
        and tac.status = 1;
    end if;
  elsif p_tipo_status = 2 then
        if p_tipo_pesquisa = 1 then
      open p_tab for
        select *
        from tb_acad_cliente tac
        where UPPER(tac.nome) like '%' || UPPER(p_palavra_chave) || '%';
    end if;

    if p_tipo_pesquisa = 2 then
      open p_tab for
        select *
        from tb_acad_cliente tac
        where tac.cpf_cnpj = p_palavra_chave;
    end if;

    if p_tipo_pesquisa = 3 then
      open p_tab for
        select *
        from tb_acad_cliente tac
        where tac.data_nascimento = p_palavra_chave;
    end if;
  end if;



end proc_consulta_cliente;

procedure proc_busca_cliente(p_cpf_cnpj in         tb_acad_cliente.cpf_cnpj%type,
                             p_nome out            tb_acad_cliente.nome%type,
                             p_data_nascimento out tb_acad_cliente.data_nascimento%type,
                             p_estado_civil out    tb_acad_cliente.estado_civil%type,
                             p_email out           tb_acad_cliente.email%type,
                             p_telefone out        tb_acad_cliente.telefone%type,
                             p_status out          tb_acad_cliente.status%type) is

  cursor c_clientes is
    select * from tb_acad_cliente where tb_acad_cliente.cpf_cnpj = p_cpf_cnpj;

  begin
    for cliente in c_clientes
      loop
        if cliente.cpf_cnpj is not null then
           p_nome := cliente.nome;
           p_data_nascimento := cliente.data_nascimento;
           p_estado_civil := cliente.estado_civil;
           p_email := cliente.email;
           p_telefone := cliente.telefone;
           p_status := cliente.status;
        else
          p_nome := null;
        end if;
      end loop;

end proc_busca_cliente;

procedure proc_insere_cliente(p_cpf_cnpj in         tb_acad_cliente.cpf_cnpj%type,
                              p_nome in             tb_acad_cliente.nome%type,
                              p_data_nascimento in  tb_acad_cliente.data_nascimento%type,
                              p_estado_civil in     tb_acad_cliente.estado_civil%type,
                              p_email in           tb_acad_cliente.email%type,
                              p_telefone in        tb_acad_cliente.telefone%type,
                              p_status in          tb_acad_cliente.status%type) is

begin

insert into tb_acad_cliente(
                                      cpf_cnpj,
                                      nome,
                                      data_nascimento,
                                      estado_civil,
                                      email,
                                      telefone,
                                      status
                                     )
    values (
           p_cpf_cnpj,
           UPPER(p_nome),
           p_data_nascimento,
           p_estado_civil,
           p_email,
           p_telefone,
           p_status
           );

commit;

end proc_insere_cliente;

procedure proc_altera_cliente(
                             p_cpf_cnpj in tb_acad_cliente.cpf_cnpj%type,
                             p_nome in tb_acad_cliente.nome%type,
                             p_data_nascimento in tb_acad_cliente.data_nascimento%type,
                             p_estado_civil in tb_acad_cliente.estado_civil%type,
                             p_email in tb_acad_cliente.email%type,
                             p_telefone in tb_acad_cliente.telefone%type,
                             p_status in tb_acad_cliente.status%type
                             ) is

cursor c_clientes is
    SELECT *
    FROM tb_acad_cliente;

begin

for cliente in c_clientes
    loop
      if cliente.cpf_cnpj = p_cpf_cnpj then
         update tb_acad_cliente tacc
         set tacc.nome =               p_nome,
             tacc.data_nascimento =    p_data_nascimento,
             tacc.estado_civil =       p_estado_civil,
             tacc.email =              p_email,
             tacc.telefone =           p_telefone,
             tacc.status   =           p_status
         where p_cpf_cnpj = tacc.cpf_cnpj;
      end if;
    end loop;

 commit;
end proc_altera_cliente;
function func_retorna_id_cliente(p_cpf_cnpj tb_acad_cliente.cpf_cnpj%type)
return tb_acad_cliente.id_cliente%type is
  cursor c_clientes is
      SELECT *
      FROM tb_acad_cliente;
  begin
    for cliente in c_clientes
      loop
        if p_cpf_cnpj = cliente.cpf_cnpj then
          return cliente.id_cliente;
        end if;
      end loop;
      return null;

end func_retorna_id_cliente;

end PACK_CLIENTE;
/

prompt
prompt Creating package body PACK_ENDERECO
prompt ===================================
prompt
create or replace package body PACK_ENDERECO is

procedure proc_busca_endereco(p_cpf_cnpj in tb_acad_cliente.cpf_cnpj%type,
                              p_endereco_principal in tb_acad_endereco.endereco_principal%type,
                              p_tipo in number,
                               logradouro    out       tb_acad_endereco.logradouro%type,
                               bairro        out       tb_acad_endereco.bairro%type,
                               cep           out       tb_acad_endereco.cep%type,
                               numero        out       tb_acad_endereco.numero%type,
                               cidade        out       tb_acad_cidade.id_cidade%type,
                               estado        out       tb_acad_estado.id_estado%type
                                ) is

    v_id_cliente number := pack_cliente.func_retorna_id_cliente(p_cpf_cnpj);
    v_id_fornecedor number := pack_fornecedor.func_retorna_id_fornecedor(p_cpf_cnpj);
    v_endereco_principal number := p_endereco_principal;

  cursor c_endereco is
    select en.logradouro as ru, en.bairro as ba, en.cep as ce, en.numero as nu, ci.id_cidade as ci, es.id_estado as es
    from tb_acad_endereco en, tb_acad_cidade ci, tb_acad_estado es
    where en.fk_id_cidade = ci.id_cidade
          and ci.fk_id_estado = es.id_estado
          and en.fk_id_cliente = v_id_cliente
          and en.endereco_principal = v_endereco_principal;


    cursor c_fornecedor is
    select en.logradouro as ru, en.bairro as ba, en.cep as ce, en.numero as nu, ci.id_cidade as ci, es.id_estado as es
    from tb_acad_endereco en, tb_acad_cidade ci, tb_acad_estado es
    where en.fk_id_cidade = ci.id_cidade
          and ci.fk_id_estado = es.id_estado
          and en.fk_id_fornecedor = v_id_fornecedor
          and en.endereco_principal = v_endereco_principal;

begin
   if p_tipo = 1 then -- cliente
    for ameba in c_endereco
      loop
          logradouro := ameba.ru;
          bairro := ameba.ba;
          cep := ameba.ce;
          numero := ameba.nu;
          cidade := ameba.ci;
          estado := ameba.es;
      end loop;
    end if;

    if p_tipo = 2 then -- fornecedor
      for forn in c_fornecedor
      loop
          logradouro := forn.ru;
          bairro := forn.ba;
          cep := forn.ce;
          numero := forn.nu;
          cidade := forn.ci;
          estado := forn.es;
      end loop;
    end if;

    if p_tipo = 3 then  -- estoque
      null;
    end if;

end proc_busca_endereco;


procedure proc_insere_endereco(
                              p_cpf_cnpj in tb_acad_cliente.cpf_cnpj%type,
                              p_endereco_principal in tb_acad_endereco.endereco_principal%type,
                              p_tipo in number,
                              p_logradouro    in       tb_acad_endereco.logradouro%type,
                              p_bairro        in       tb_acad_endereco.bairro%type,
                              p_cep           in       tb_acad_endereco.cep%type,
                              p_numero        in       tb_acad_endereco.numero%type,
                              p_cidade        in       tb_acad_cidade.id_cidade%type
                               ) is

      v_id_cliente number := pack_cliente.func_retorna_id_cliente(p_cpf_cnpj);
      v_id_fornecedor number := pack_fornecedor.func_retorna_id_fornecedor(p_cpf_cnpj);
begin
   if p_tipo = 1 then -- cliente

      insert into tb_acad_endereco( -- primario
                         logradouro,
                         bairro,
                         cep,
                         numero,
                         endereco_principal,
                         fk_id_cliente,
                         fk_id_cidade)
       values(
                          p_logradouro,
                          p_bairro,
                          p_cep,
                          p_numero,
                          p_endereco_principal,
                          v_id_cliente,
                          p_cidade

       );

       insert into tb_acad_endereco(  -- secundário
                         logradouro,
                         bairro,
                         cep,
                         numero,
                         endereco_principal,
                         fk_id_cliente,
                         fk_id_cidade)
       values(
                          p_logradouro,
                          p_bairro,
                          p_cep,
                          p_numero,
                          2,
                          v_id_cliente,
                          p_cidade

       );
    end if;

    if p_tipo = 2 then -- fornecedor
     insert into tb_acad_endereco(
                         logradouro,
                         bairro,
                         cep,
                         numero,
                         endereco_principal,
                         fk_id_fornecedor,
                         fk_id_cidade)
       values(
                          p_logradouro,
                          p_bairro,
                          p_cep,
                          p_numero,
                          p_endereco_principal,
                          v_id_fornecedor,
                          p_cidade

       );

       insert into tb_acad_endereco(
                         logradouro,
                         bairro,
                         cep,
                         numero,
                         endereco_principal,
                         fk_id_fornecedor,
                         fk_id_cidade)
       values(
                          p_logradouro,
                          p_bairro,
                          p_cep,
                          p_numero,
                          2,
                          v_id_fornecedor,
                          p_cidade

       );

    end if;

    if p_tipo = 3 then  -- estoque
      null;
    end if;


    COMMIT;

end proc_insere_endereco;


procedure proc_altera_endereco(
                              p_cpf_cnpj in tb_acad_cliente.cpf_cnpj%type,
                              p_endereco_principal in tb_acad_endereco.endereco_principal%type,
                              p_tipo in number,
                              p_logradouro    in       tb_acad_endereco.logradouro%type,
                              p_bairro        in       tb_acad_endereco.bairro%type,
                              p_cep           in       tb_acad_endereco.cep%type,
                              p_numero        in       tb_acad_endereco.numero%type,
                              p_cidade        in       tb_acad_cidade.id_cidade%type
                               ) is

      v_id_cliente number := pack_cliente.func_retorna_id_cliente(p_cpf_cnpj);
      v_id_fornecedor number := pack_fornecedor.func_retorna_id_fornecedor(p_cpf_cnpj);
begin
   if p_tipo = 1 then -- cliente
     update tb_acad_endereco set
                         logradouro = p_logradouro,
                         bairro = p_bairro,
                         cep = p_cep,
                         numero = p_numero,
                         endereco_principal = p_endereco_principal,
                         fk_id_cliente = v_id_cliente,
                         fk_id_cidade = p_cidade
       where fk_id_cliente = v_id_cliente
             and endereco_principal = p_endereco_principal;

    end if;

    if p_tipo = 2 then -- fornecedor
      update tb_acad_endereco set
                         logradouro = p_logradouro,
                         bairro = p_bairro,
                         cep = p_cep,
                         numero = p_numero,
                         endereco_principal = p_endereco_principal,
                         fk_id_fornecedor = v_id_fornecedor,
                         fk_id_cidade = p_cidade
       where fk_id_fornecedor = v_id_fornecedor
             and endereco_principal = p_endereco_principal;

    end if;


    if p_tipo = 3 then  -- estoque
      null;
    end if;


    COMMIT;

end proc_altera_endereco;




end PACK_ENDERECO;
/

prompt
prompt Creating package body PACK_FORNECEDOR
prompt =====================================
prompt
create or replace package body PACK_FORNECEDOR is

procedure proc_consulta_fornecedor(p_tab in out cur_fornecedores,
                                   p_tipo_pesquisa in number,
                                   p_palavra_chave in varchar2,
                                   p_tipo_status in number) is

 begin
  if p_tipo_status = 1 then
    if p_tipo_pesquisa = 1 then
      open p_tab for
        select *
        from tb_acad_fornecedor tac
        where tac.id_fornecedor = p_palavra_chave
        and tac.status = 1;
    end if;

    if p_tipo_pesquisa = 2 then
      open p_tab for
        select *
        from tb_acad_fornecedor tac
        where tac.cpf_cnpj = p_palavra_chave
        and tac.status = 1;
    end if;

    if p_tipo_pesquisa = 3 then
      open p_tab for
        select *
        from tb_acad_fornecedor tac
        where tac.nome like '%' || upper(p_palavra_chave) || '%'
        and tac.status = 1;
    end if;
  elsif p_tipo_status = 2 then
    if p_tipo_pesquisa = 1 then
      open p_tab for
        select *
        from tb_acad_fornecedor tac
        where tac.id_fornecedor = p_palavra_chave;
    end if;

    if p_tipo_pesquisa = 2 then
      open p_tab for
        select *
        from tb_acad_fornecedor tac
        where tac.cpf_cnpj = p_palavra_chave;
    end if;

    if p_tipo_pesquisa = 3 then
      open p_tab for
        select *
        from tb_acad_fornecedor tac
        where tac.nome like '%' || upper(p_palavra_chave) || '%';
    end if;



  end if;


end proc_consulta_fornecedor;

procedure proc_busca_fornecedor(p_id_fornecedor in number,
                                p_nome_fornecedor out varchar2,
                                p_cpf_cnpj out varchar2,
                                p_telefone out varchar2,
                                p_status out number) is

 cursor c_fornecedores is
       SELECT *
       FROM tb_acad_fornecedor;

     begin
       for fornecedor in c_fornecedores
       Loop
         if p_id_fornecedor = fornecedor.id_fornecedor then
           p_nome_fornecedor := fornecedor.nome;
           p_cpf_cnpj := fornecedor.cpf_cnpj;
           p_telefone := fornecedor.telefone;
           p_status := fornecedor.status;
         end if;
       End Loop;




end proc_busca_fornecedor;

procedure proc_insere_fornecedor(p_nome in        tb_acad_fornecedor.nome%type,
                                 p_cpf_cnpj in    tb_acad_fornecedor.cpf_cnpj%type,
                                 p_telefone in    tb_acad_fornecedor.telefone%type,
                                 p_status in      tb_acad_fornecedor.status%type)is

begin
  insert into tb_acad_fornecedor(nome, cpf_cnpj, telefone, status)
  values (upper(p_nome), p_cpf_cnpj, p_telefone, p_status);


end proc_insere_fornecedor;

procedure proc_altera_fornecedor(p_nome in        tb_acad_fornecedor.nome%type,
                                 p_cpf_cnpj in    tb_acad_fornecedor.cpf_cnpj%type,
                                 p_telefone in    tb_acad_fornecedor.telefone%type,
                                 p_status in      tb_acad_fornecedor.status%type) is

  cursor c_fornecedor is
       SELECT *
       FROM tb_acad_fornecedor;

  begin
       for fornecedor in c_fornecedor
       loop
         if fornecedor.cpf_cnpj = p_cpf_cnpj THEN
            update tb_acad_fornecedor taf
            set taf.cpf_cnpj = p_cpf_cnpj,
                taf.nome = p_nome,
                taf.telefone = p_telefone,
                taf.status = p_status
             where p_cpf_cnpj = taf.cpf_cnpj;
         end if;

       end loop;

end proc_altera_fornecedor;

function func_retorna_id_fornecedor(p_cpf_cnpj in tb_acad_fornecedor.cpf_cnpj%type)
return tb_acad_fornecedor.id_fornecedor%type is
  cursor c_fornecedor is
      SELECT *
      FROM tb_acad_fornecedor;
  begin
    for fornecedor in c_fornecedor
      loop
        if p_cpf_cnpj = fornecedor.cpf_cnpj then
          return fornecedor.id_fornecedor;
        end if;
      end loop;
      return null;

end func_retorna_id_fornecedor;

end PACK_FORNECEDOR;
/

prompt
prompt Creating package body PACK_FUNCIONARIO
prompt ======================================
prompt
create or replace package body PACK_FUNCIONARIO is

procedure proc_consulta_funcionario(
    p_tab in out cur_funcionarios,
    p_tipo_pesquisa in number,
    p_palavra_chave in varchar2,
    p_tipo_status in number)
is
begin
  if p_tipo_status = 1 then
    if p_tipo_pesquisa = 1 then
      open p_tab for
        select id_funcionario, nome, cpf_cnpj, tipo_permissao, data_nascimento, senha, status
        from tb_acad_funcionario taf
        where UPPER(taf.nome) like '%' || UPPER(p_palavra_chave) || '%'
        and taf.status = 1;
    end if;

    if p_tipo_pesquisa = 2 then
      open p_tab for
        select id_funcionario, nome, cpf_cnpj, tipo_permissao, data_nascimento, senha, status
        from tb_acad_funcionario taf
        where taf.cpf_cnpj = p_palavra_chave
        and taf.status = 1;
    end if;

    if p_tipo_pesquisa = 3 then
      open p_tab for
        select id_funcionario, nome, cpf_cnpj, tipo_permissao, data_nascimento, senha, status
        from tb_acad_funcionario taf
        where taf.id_funcionario = p_palavra_chave
        and taf.status = 1;
    end if;
  elsif p_tipo_status = 2 then
    if p_tipo_pesquisa = 1 then
      open p_tab for
        select id_funcionario, nome, cpf_cnpj, tipo_permissao, data_nascimento, senha, status
        from tb_acad_funcionario taf
        where UPPER(taf.nome) like '%' || UPPER(p_palavra_chave) || '%';
    end if;

    if p_tipo_pesquisa = 2 then
      open p_tab for
        select id_funcionario, nome, cpf_cnpj, tipo_permissao, data_nascimento, senha, status
        from tb_acad_funcionario taf
        where taf.cpf_cnpj = p_palavra_chave;
    end if;

    if p_tipo_pesquisa = 3 then
      open p_tab for
        select id_funcionario, nome, cpf_cnpj, tipo_permissao, data_nascimento, senha, status
        from tb_acad_funcionario taf
        where taf.id_funcionario = p_palavra_chave;
    end if;
  end if;

end proc_consulta_funcionario;

procedure proc_insere_funcionario (
    p_nome in tb_acad_funcionario.nome%type,
    p_cpf_cnpj in tb_acad_funcionario.cpf_cnpj%type,
    p_tipo_permissao in tb_acad_funcionario.tipo_permissao%type,
    p_data_nascimento in tb_acad_funcionario.data_nascimento%type,
    p_senha in tb_acad_funcionario.senha%type,
    p_status in tb_acad_funcionario.status%type
)
is
begin
  INSERT INTO TB_ACAD_FUNCIONARIO (nome, cpf_cnpj, tipo_permissao, data_nascimento, senha, status)
  VALUES (
         p_nome,
         p_cpf_cnpj,
         p_tipo_permissao,
         p_data_nascimento,
         p_senha,
         p_status
    );
    COMMIT;
end proc_insere_funcionario;

procedure proc_busca_funcionario(     p_id_funcionario in      out   tb_acad_funcionario.id_funcionario%type,
                                      p_nome                   out   tb_acad_funcionario.nome%type,
                                      p_cpf_cnpj               out   tb_acad_funcionario.cpf_cnpj%type,
                                      p_tipo_permissao         out   tb_acad_funcionario.tipo_permissao%type,
                                      p_data_nascimento        out   tb_acad_funcionario.data_nascimento%type,
                                      p_senha                  out   tb_acad_funcionario.senha%type,
                                      p_status                 out   tb_acad_funcionario.status%type) is

    cursor c_funcionarios is
    select * from tb_acad_funcionario where tb_acad_funcionario.id_funcionario = p_id_funcionario;

  begin
    for func in c_funcionarios
      loop
        if func.id_funcionario is not null then
            p_id_funcionario := func.id_funcionario;
            p_nome           := func.nome;
            p_cpf_cnpj       := func.cpf_cnpj;
            p_tipo_permissao := func.tipo_permissao;
            p_data_nascimento := func.data_nascimento;
            p_senha          := func.senha;
            p_status         := func.status;
        else
          p_nome := null;
        end if;
      end loop;


end proc_busca_funcionario;



procedure proc_altera_funcionario (
    p_id_funcionario in tb_acad_funcionario.id_funcionario%type,
    p_nome in tb_acad_funcionario.nome%type,
    p_cpf_cnpj in tb_acad_funcionario.cpf_cnpj%type,
    p_tipo_permissao in tb_acad_funcionario.tipo_permissao%type,
    p_data_nascimento in tb_acad_funcionario.data_nascimento%type,
    p_senha in tb_acad_funcionario.senha%type,
    p_status in tb_acad_funcionario.status%type
)
is
begin
  UPDATE
     TB_ACAD_FUNCIONARIO
  SET
     nome = p_nome,
     cpf_cnpj = p_cpf_cnpj,
     tipo_permissao = p_tipo_permissao,
     data_nascimento = p_data_nascimento,
     senha = p_senha,
     status = p_status
   WHERE
     id_funcionario = p_id_funcionario;

   COMMIT;
end proc_altera_funcionario;

procedure proc_verifica_login(p_re in tb_acad_funcionario.id_funcionario%type,
                              p_senha in tb_acad_funcionario.senha%type,
                              p_nome out tb_acad_funcionario.nome%type,
                              p_permissao out tb_acad_funcionario.tipo_permissao%type) is

cursor c_funcionarios is
    select * from tb_acad_funcionario where tb_acad_funcionario.id_funcionario = p_re;

  begin
    for func in c_funcionarios
      loop
        if func.id_funcionario is not null then
            if p_senha = func.senha then
              p_nome := func.nome;
              p_permissao := func.tipo_permissao;
            end if;
        else
          p_nome := null;
        end if;
      end loop;
end proc_verifica_login;

end PACK_FUNCIONARIO;
/

prompt
prompt Creating package body PACK_ITEM_ESTOQUE
prompt =======================================
prompt
create or replace package body PACK_ITEM_ESTOQUE is



procedure proc_consulta_item_estoque( p_tab in out cur_item_estoque_tab,
                                      p_tipo_pesquisa in number,
                                      p_palavra_chave in varchar2,
                                      p_tipo_status in number)is
begin
  if p_tipo_status = 1 then
    if p_tipo_pesquisa = 1 then
      open p_tab for

      select est.id_item_estoque, prod.nome, est.status
      from tb_acad_item_estoque est inner join tb_acad_produto prod
      on prod.id_produto = est.fk_id_produto
      where UPPER(prod.nome) like '%' || UPPER(p_palavra_chave) || '%'
        and est.status = 1
      order by prod.nome asc;

    end if;

    if p_tipo_pesquisa = 2 then
      open p_tab for

      select est.id_item_estoque, prod.nome, est.status
      from tb_acad_item_estoque est inner join tb_acad_produto prod
      on prod.id_produto = est.fk_id_produto
      where est.id_item_estoque = cast (p_palavra_chave as integer)
        and est.status = 1
      order by prod.nome asc;

    end if;

  elsif p_tipo_status = 2 then
        if p_tipo_pesquisa = 1 then
      open p_tab for
        select est.id_item_estoque, prod.nome, est.status
        from tb_acad_item_estoque est inner join tb_acad_produto prod
        on prod.id_produto = est.fk_id_produto
        where UPPER(prod.nome) like '%' || UPPER(p_palavra_chave) || '%'
        order by prod.nome asc;
    end if;

    if p_tipo_pesquisa = 2 then
      open p_tab for

      select est.id_item_estoque, prod.nome, est.status
      from tb_acad_item_estoque est inner join tb_acad_produto prod
      on prod.id_produto = est.fk_id_produto
      where est.id_item_estoque = cast (p_palavra_chave as integer)
      order by prod.nome asc;

    end if;


  end if;



end proc_consulta_item_estoque;

procedure proc_busca_prod_forn( p_id_item_estoque in tb_acad_item_estoque.id_item_estoque%type,
                                p_prod_nome out tb_acad_produto.nome%type,
                                p_item_estoque_status out tb_acad_item_estoque.status%type,
                                p_item_estoque_quantidade out tb_acad_item_estoque.quantidade%type,
                                p_item_estoque_preco_custo out tb_acad_item_estoque.preco_custo%type,
                                p_item_estoque_margem out tb_acad_item_estoque.margem_lucro%type,
                                p_item_estoque_preco_venda out tb_acad_item_estoque.preco_venda%type,
                                p_forn_nome out tb_acad_fornecedor.nome%type,
                                p_forn_cnpj out tb_acad_fornecedor.cpf_cnpj%type
                                ) is
    cursor c_prod_forn is
    select est.id_item_estoque, prod.nome, est.status, est.quantidade,
           est.preco_custo,
           est.margem_lucro,
           est.preco_venda,
           forn.nome as nome_forn, forn.cpf_cnpj
    from tb_acad_item_estoque est inner join tb_acad_produto prod on prod.id_produto = est.fk_id_produto
         inner join tb_acad_item_pedido_compra ipc on ipc.fk_id_item_estoque = est.id_item_estoque
         inner join tb_acad_pedido_compra pc on pc.id_pedido_compra = ipc.fk_id_pedido_compra
         inner join tb_acad_fornecedor forn on forn.id_fornecedor = pc.fk_id_fornecedor
         where est.id_item_estoque = p_id_item_estoque
         order by prod.nome asc;


    begin
      for results in c_prod_forn
        loop
            p_prod_nome := results.nome;
            p_item_estoque_status := 1;
            p_item_estoque_quantidade := results.quantidade;
            p_item_estoque_preco_custo := results.preco_custo;
            p_item_estoque_margem := results.margem_lucro;
            p_item_estoque_preco_venda := results.preco_venda;
            p_forn_nome := results.nome_forn;
            p_forn_cnpj := results.cpf_cnpj;
        end loop;


end proc_busca_prod_forn;

procedure proc_altera_margem(
                                p_id_item_estoque in tb_acad_item_estoque.id_item_estoque%type,
                                p_item_estoque_margem in tb_acad_item_estoque.margem_lucro%type,
                                p_item_estoque_preco_venda in tb_acad_item_estoque.preco_venda%type
                             ) is

cursor c_item_estoque is
    SELECT *
    FROM tb_acad_item_estoque;

begin

for results in c_item_estoque
    loop
         update tb_acad_item_estoque tacc
         set tacc.margem_lucro =              p_item_estoque_margem,
             tacc.preco_venda =               p_item_estoque_preco_venda
         where tacc.id_item_estoque = p_id_item_estoque;
    end loop;

 commit;
end proc_altera_margem;

procedure insere_item_estoque_aguardando(p_id_item_estoque out tb_acad_item_estoque.id_item_estoque%type,
                                      p_id_produto       in tb_acad_item_estoque.fk_id_produto%type                  
                                      ) is
                                      
                                      
begin
  
 INSERT INTO TB_ACAD_ITEM_ESTOQUE(QUANTIDADE,DATA_CADASTRO,STATUS,PRECO_CUSTO,MARGEM_LUCRO,PRECO_VENDA,FK_ID_PRODUTO,FK_ID_ESTOQUE) VALUES(0,SYSDATE,3,0,0,0,p_id_produto,1);
 commit;
 SELECT MAX(ID_ITEM_ESTOQUE) into p_id_item_estoque from TB_ACAD_ITEM_ESTOQUE; 
end;



end PACK_ITEM_ESTOQUE;
/

prompt
prompt Creating package body PACK_ITEM_PEDIDO_COMPRA
prompt =============================================
prompt
CREATE OR REPLACE PACKAGE BODY PACK_ITEM_PEDIDO_COMPRA IS

--trazer todos os dados do itens do pedindo fazendo junção do item_estoque e do produto
procedure proc_consulta_item_pedido_compra(p_tab in out cur_pedido,
                                           p_id_pedido_compra in number) is
                                begin
                                    open p_tab for
                                      select id_item_pedido_compra,subtotal,taip.quantidade,fk_id_item_estoque,fk_id_pedido_compra,taip.preco_custo,taip.margem_lucro,preco_venda,id_produto,nome,descricao
                                      from tb_acad_item_pedido_compra taip
                                      inner join tb_acad_item_estoque taie
                                      on taip.fk_id_item_estoque = taie.id_item_estoque
                                      inner join tb_acad_produto tapro
                                      on taie.fk_id_produto = tapro.id_produto
                                      where taip.fk_id_pedido_compra = p_id_pedido_compra;



 end proc_consulta_item_pedido_compra;
 
procedure remove_item_estoque_pd_compra(p_id_pedido in tb_acad_pedido_compra.id_pedido_compra%type,
                               p_cnpj_fornecedor in tb_acad_pedido_compra.fk_id_fornecedor%type) is

   esta_cancelado number;

   cursor cur is
     select ipc.*
     from tb_acad_fornecedor forn inner join tb_acad_pedido_compra pc on pc.fk_id_fornecedor = forn.id_fornecedor
          inner join tb_acad_item_pedido_compra ipc on pc.id_pedido_compra = ipc.fk_id_pedido_compra
     where pc.id_pedido_compra = p_id_pedido and forn.id_fornecedor = p_cnpj_fornecedor;
begin

   select p.status into esta_cancelado 
   from tb_acad_pedido_compra p
   where p.id_pedido_compra = p_id_pedido and p.fk_id_fornecedor = p_cnpj_fornecedor;

   for results in cur
   loop
       if esta_cancelado != 4 then
       update tb_acad_item_estoque ie
       set ie.quantidade = ie.quantidade - results.quantidade
       where ie.id_item_estoque = results.fk_id_item_estoque;
       end if;
   end loop;

end remove_item_estoque_pd_compra;
end PACK_ITEM_PEDIDO_COMPRA;
/

prompt
prompt Creating package body PACK_ITEM_PEDIDO_VENDA
prompt ============================================
prompt
CREATE OR REPLACE PACKAGE BODY PACK_ITEM_PEDIDO_VENDA IS

--trazer todos os dados do itens do pedindo fazendo junção do item_estoque e do produto
procedure proc_consulta_item_pedido(p_tab in out cur_pedido,
                                    p_id_pedido in number) is
                                begin
                                    open p_tab for
                                      select id_item_pedido,subtotal,taip.quantidade,fk_id_item_estoque,fk_id_pedido,preco_custo,margem_lucro,preco_venda,id_produto,nome,descricao
                                      from tb_acad_item_pedido taip
                                      inner join tb_acad_item_estoque taie
                                      on taip.fk_id_item_estoque = taie.id_item_estoque
                                      inner join tb_acad_produto tapro
                                      on taie.fk_id_produto = tapro.id_produto
                                      where taip.fk_id_pedido = p_id_pedido;



 end proc_consulta_item_pedido;

procedure retorna_item_estoque(p_id_pedido in tb_acad_pedido.id_pedido%type) is

   esta_cancelado number;

   cursor cur is
       select *
       from tb_acad_item_pedido tip
       where tip.fk_id_pedido = p_id_pedido;
begin

   /*select p.status into esta_cancelado 
   from tb_acad_pedido p
   where p.id_pedido = p_id_pedido;*/

   for results in cur
   loop
       --if esta_cancelado != 4 then
       update tb_acad_item_estoque ie
       set ie.quantidade = ie.quantidade + results.quantidade
       where ie.id_item_estoque = results.fk_id_item_estoque;
       --end if;
   end loop;
   commit;
end retorna_item_estoque;

end PACK_ITEM_PEDIDO_VENDA;
/

prompt
prompt Creating package body PACK_PEDIDO_COMPRA
prompt ========================================
prompt
CREATE OR REPLACE PACKAGE BODY PACK_PEDIDO_COMPRA IS
procedure proc_insere_pedido(p_id_pedido_compra         out  tb_acad_pedido_compra.id_pedido_compra%type,
                             p_data_compra       out   tb_acad_pedido_compra.data_compra%type,
                             p_fk_id_funcionario in   tb_acad_pedido_compra.fk_id_funcionario%type,
                             p_fk_id_fornecedor in   tb_acad_pedido_compra.fk_id_fornecedor%type,
                             p_status out tb_acad_pedido_compra.status%type) is
 begin
     -- Cria o Pedido
     insert into  tb_acad_pedido_compra(
                  data_compra,
                  preco_total,
                  status,
                  fk_id_fornecedor,
                  fk_id_funcionario
                 )
          values (sysdate,
                  0,
                  1,
                  p_fk_id_fornecedor,
                  p_fk_id_funcionario
                  );
       COMMIT;

      -- Cria a data conforme data atual do sistema
      p_data_compra := sysdate;

      -- Busca e retorna o id do pedido que acabou de ser criado
      select  max(p.id_pedido_compra) into p_id_pedido_compra
      from    tb_acad_pedido_compra p
      where   p.data_compra       = p_data_compra
        and   p.fk_id_fornecedor     = p_fk_id_fornecedor
        and   p.fk_id_funcionario = p_fk_id_funcionario ;
        
      p_status := 1;


end proc_insere_pedido;

procedure proc_busca_pedido(p_id_pedido_compra in out  tb_acad_pedido_compra.id_pedido_compra%type,
                            p_preco_total out   tb_acad_pedido_compra.preco_total%type,
                            p_data_compra out   tb_acad_pedido_compra.data_compra%type,
                            p_status      out   tb_acad_pedido_compra.status%type,
                            p_cpf_cnpj    out   tb_acad_fornecedor.cpf_cnpj%type,
                            p_fornecedor  out   tb_acad_fornecedor.nome%type,
                            p_funcionario out   tb_acad_funcionario.nome%type)is
   cursor c_pedidos is

          select ped.id_pedido_compra,ped.preco_total,ped.data_compra,ped.status,forn.cpf_cnpj,forn.nome as fornecedor, fun.nome as funcionario
          from tb_acad_pedido_compra ped
          inner join tb_acad_fornecedor forn
          on ped.fk_id_fornecedor = forn.id_fornecedor
          inner join tb_acad_funcionario fun
          on ped.fk_id_funcionario = fun.id_funcionario
          where ped.id_pedido_compra = p_id_pedido_compra;
   begin
     for ped in c_pedidos
      loop
        if ped.id_pedido_compra is not null then
           p_id_pedido_compra := ped.id_pedido_compra;
           p_preco_total  := ped.preco_total;
           p_data_compra  := ped.data_compra;
           p_status     := ped.status;
           p_cpf_cnpj   := ped.cpf_cnpj;
           p_fornecedor    := ped.fornecedor;
           p_funcionario := ped.funcionario;
        else
          p_fornecedor := null;
        end if;
      end loop;
     end;
     
procedure proc_altera_status(p_id_pedido_compra in tb_acad_pedido_compra.id_pedido_compra%type,
                               p_status out tb_acad_pedido_compra.status%type) is
begin
      p_status := 2;
      update tb_acad_pedido_compra
      set status = 2
      where id_pedido_compra = p_id_pedido_compra;
      commit;
  end proc_altera_status;
  
procedure proc_conclui_pedido(p_id_pedido_compra in tb_acad_pedido_compra.id_pedido_compra%type,
                               p_status out tb_acad_pedido_compra.status%type) is
begin
      p_status := 3;
      update tb_acad_pedido_compra
      set status = 3
      where id_pedido_compra = p_id_pedido_compra;
      commit;
  end proc_conclui_pedido;

procedure proc_cancela_pedido(p_id_pedido_compra in tb_acad_pedido_compra.id_pedido_compra%type,
                               p_status out tb_acad_pedido_compra.status%type) is
begin
      p_status := 4;
      update tb_acad_pedido_compra
      set status = 4
      where id_pedido_compra = p_id_pedido_compra;
      commit;
  end;
  
  
procedure inativa_item_estoque(p_id_pedido_compra in tb_acad_pedido_compra.id_pedido_compra%type) is
  begin
    update tb_acad_item_estoque tie
    set tie.status = 2
    where tie.id_item_estoque in (select tpc.fk_id_item_estoque from tb_acad_item_pedido_compra tpc where tpc.fk_id_pedido_compra = p_id_pedido_compra);
  commit;
  end;

--Altera o ESTOQUE
procedure proc_insere_item_estoque(  p_item_estoque             in tb_acad_item_estoque.id_item_estoque%type,               
                                     p_quantidade               in tb_acad_item_estoque.quantidade%type,
                                     p_preco_custo              in tb_acad_item_estoque.preco_custo%type,
                                     p_margem_lucro             in tb_acad_item_estoque.margem_lucro%type,

                                     p_id_produto               in tb_acad_item_estoque.fk_id_produto%type) is 
begin
   
       UPDATE TB_ACAD_ITEM_ESTOQUE aie 
       SET aie.quantidade = p_quantidade,
           aie.data_cadastro = SYSDATE,
           aie.status = 1,
           aie.preco_custo = p_preco_custo,
           aie.margem_lucro = p_margem_lucro,
           aie.preco_venda = (p_preco_custo + p_preco_custo*(p_margem_lucro/100))
       WHERE aie.id_item_estoque = p_item_estoque;

       /*if p_quantidade = 0 then
         UPDATE TB_ACAD_ITEM_ESTOQUE
         SET STATUS = 2
         WHERE ID_ITEM_ESTOQUE = p_item_estoque;
       end if;*/
end; 
  
/*
procedure proc_consulta_pedido(p_tab in out cur_pedido,
              p_tipo_pesquisa in number,
              p_palavra_chave in varchar2) is 
              begin
                
                end proc_consulta_pedido;




procedure proc_altera_pedido(p_id_pedido_compra in     tb_acad_pedido_compra.id_pedido_compra%type,
             p_preco_total in   tb_acad_pedido_compra.preco_total%type,
             p_data_compra in   tb_acad_pedido_compra.data_compra%type,
             p_status in        tb_acad_pedido_compra.status%type,
             p_fk_id_fornecedor in tb_acad_pedido_compra.fk_id_fornecedor%type,
             p_fk_id_funcionario in tb_acad_pedido_compra.fk_id_funcionario%type) is
             begin
              sysdate;
             end proc_altera_pedido;

*/
end pack_pedido_compra;
/

prompt
prompt Creating package body PACK_PEDIDO_VENDA
prompt =======================================
prompt
CREATE OR REPLACE PACKAGE BODY PACK_PEDIDO_VENDA IS

/*procedure proc_consulta_pedido(p_tab in out cur_pedido,
                                p_tipo_pesquisa in number,
                                p_palavra_chave in varchar2) is
                                begin
                                  if p_tipo_pesquisa = 1 then --Pesquisa por numero do pedido
                                    open p_tab for
                                      select * from tb_acad_pedido tap
                                      where tap.id_pedido = p_palavra_chave;
                                 elsif p_tipo_pesquisa = 2 then --Pesquisa por nome do cliente
                                  open p_tab for
                                    select * from tb_acad_pedido tab
                                    inner join tb_acad_cliente tac
                                    on tab.fk_id_cliente = tac.id_cliente
                                    where upper(tac.nome) like '%' ||  upper(p_palavra_chave) || '%'
                                   end if;
                                end proc_consulta_pedido;

*/

-- Retirado preço total e status, o total vai ser realizado através de uma triguer
-- e o status de um pedido num é criado inativo
procedure proc_insere_pedido(p_id_pedido         out  tb_acad_pedido.id_pedido%type,
                             p_data_pedido       out  tb_acad_pedido.data_pedido%type,
                             p_fk_id_cliente     in   tb_acad_pedido.fk_id_cliente%type,
                             p_fk_id_funcionario in   tb_acad_pedido.fk_id_funconario%type,
                             p_status out tb_acad_pedido.status%type) is

 begin
     -- Cria o Pedido
     insert into  tb_acad_pedido(
                  data_pedido,
                  preco_total,
                  status,
                  fk_id_cliente,
                  fk_id_funconario
                 )
          values (sysdate,
                  0.0,
                  1,
                  p_fk_id_cliente,
                  p_fk_id_funcionario
                  );

      -- Cria a data conforme data atual do sistema
      p_data_pedido := sysdate;


      -- Busca e retorna o id do pedido que acabou de ser criado
      select  p.id_pedido into p_id_pedido
      from    tb_acad_pedido p
      where   p_data_pedido       = p.data_pedido
        and   p_fk_id_cliente     = p.fk_id_cliente
        and   p_fk_id_funcionario = p.fk_id_funconario ;

      p_status := 1;
COMMIT;
end proc_insere_pedido;




procedure proc_altera_pedido(p_id_pedido in tb_acad_pedido.id_pedido%type,
                             p_fk_id_cliente in tb_acad_pedido.fk_id_cliente%type,
                             p_fk_id_funcionario in tb_acad_pedido.fk_id_funconario%type) is


                               cursor c_pedidos is
                                SELECT *
                                FROM tb_acad_pedido;

                            begin

                            for pedido in c_pedidos
                                loop
                                  if pedido.id_pedido = p_id_pedido then
                                     update tb_acad_pedido tap
                                     set tap.fk_id_cliente    =  p_fk_id_cliente,
                                         tap.fk_id_funconario =  p_fk_id_funcionario
                                     where pedido.id_pedido = tap.id_pedido;
                                  end if;
                                end loop;

                             commit;

 end proc_altera_pedido ;

 procedure proc_busca_pedido(p_id_pedido in out  tb_acad_pedido.id_pedido%type,
                            p_preco_total out   tb_acad_pedido.preco_total%type,
                            p_data_pedido out   tb_acad_pedido.data_pedido%type,
                            p_status      out   tb_acad_pedido.status%type,
                            p_cpf_cnpj    out   tb_acad_cliente.cpf_cnpj%type,
                            p_cliente     out   tb_acad_cliente.nome%type,
                            p_funcionario out   tb_acad_funcionario.nome%type)is
   cursor c_pedidos is
          select ped.id_pedido,ped.preco_total,ped.data_pedido,ped.status,cli.cpf_cnpj,cli.nome as cliente, fun.nome as funcionario
          from tb_acad_pedido ped
          inner join tb_acad_cliente cli
          on ped.fk_id_cliente = cli.id_cliente
          inner join tb_acad_funcionario fun
          on ped.fk_id_funconario = fun.id_funcionario
          where ped.id_pedido = p_id_pedido;
   begin
     for ped in c_pedidos
      loop
        if ped.id_pedido is not null then
           p_id_pedido := ped.id_pedido;
           p_preco_total  := ped.preco_total;
           p_data_pedido  := ped.data_pedido;
           p_status     := ped.status;
           p_cpf_cnpj   := ped.cpf_cnpj;
           p_cliente    := ped.cliente;
           p_funcionario := ped.funcionario;
        else
          p_cliente := null;
        end if;
      end loop;
     end;

  procedure proc_altera_status(p_id_pedido in tb_acad_pedido.id_pedido%type,
                               p_status out tb_acad_pedido.status%type) is
    possui_item number := 0;

  begin
     p_status := 2;
     select
        count(*) as quantidade into possui_item
     from tb_acad_item_pedido ip right join tb_acad_pedido p on p.id_pedido = ip.fk_id_pedido
     where ip.fk_id_pedido = p_id_pedido;

    if possui_item >= 1 then
      update tb_acad_pedido
      set status = 2
      where id_pedido = p_id_pedido;
      commit;
    end if;

  end proc_altera_status;

  procedure proc_conclui_pedido(p_id_pedido in tb_acad_pedido.id_pedido%type,
                                p_status out tb_acad_pedido.status%type) is
  begin
      p_status := 3;
      update tb_acad_pedido
      set status = 3
      where id_pedido = p_id_pedido;
      commit;
  end proc_conclui_pedido;

  procedure proc_cancela_pedido(p_id_pedido in tb_acad_pedido.id_pedido%type,
                                p_status out tb_acad_pedido.status%type) is
  begin
      p_status := 4;
      update tb_acad_pedido
      set status = 4
      where id_pedido = p_id_pedido;
      commit;
  end;
  
  procedure proc_reabre_pedido(p_id_pedido in tb_acad_pedido.id_pedido%type,
                                p_status out tb_acad_pedido.status%type) is
  begin
      p_status := 2;
      update tb_acad_pedido
      set status = 2
      where id_pedido = p_id_pedido;
      commit;
  end;


end pack_pedido_venda;
/

prompt
prompt Creating package body PACK_PRODUTO
prompt ==================================
prompt
CREATE OR REPLACE PACKAGE BODY PACK_PRODUTO IS

procedure proc_consulta_produto(p_tab in out cur_produto,
                p_tipo_pesquisa in number,
                p_palavra_chave in varchar2,
                p_tipo_status in number) is
  begin
   if p_tipo_status = 1 then
    if p_tipo_pesquisa = 1 then
      open p_tab for
        select * from tb_acad_produto tac
        where tac.id_produto = p_palavra_chave
        and tac.status = 1;
   elsif p_tipo_pesquisa = 2 then
    open p_tab for
      select * from tb_acad_produto tac
      where upper(tac.nome) like '%' ||  upper(p_palavra_chave) || '%'
      and tac.status = 1;
     end if;
  elsif p_tipo_status = 2 then
    if p_tipo_pesquisa = 1 then
      open p_tab for
        select * from tb_acad_produto tac
        where tac.id_produto = p_palavra_chave;
   elsif p_tipo_pesquisa = 2 then
    open p_tab for
      select * from tb_acad_produto tac
      where upper(tac.nome) like '%' ||  upper(p_palavra_chave) || '%';
     end if;
  end if;
end proc_consulta_produto;


procedure proc_busca_produto(    p_id_produto in out   tb_acad_produto.id_produto%type,
                                 p_nome out            tb_acad_produto.nome%type,
                                 p_descricao out       tb_acad_produto.descricao%type,
                                 p_status out          tb_acad_produto.status%type) is

    cursor c_produtos is
    select * from tb_acad_produto where tb_acad_produto.id_produto = p_id_produto;

  begin
    for prod in c_produtos
      loop
        if prod.id_produto is not null then
           p_id_produto := prod.id_produto;
           p_nome       := prod.nome;
           p_descricao  := prod.descricao;
           p_status     := prod.status;
        else
          p_nome := null;
        end if;
      end loop;
end proc_busca_produto;







procedure proc_insere_produto(p_nome in            tb_acad_produto.nome%type,
                             p_descricao in       tb_acad_produto.descricao%type,
                             p_status in          tb_acad_produto.status%type)

is begin

insert into tb_acad_produto(

                                      nome,
                                      descricao,
                                      status
                                     )
    values (

           upper(p_nome) ,
           p_descricao,
           p_status
           );

commit;

end proc_insere_produto;

procedure proc_altera_produto(
                             p_id_produto in tb_acad_produto.id_produto%type,
                             p_nome in tb_acad_produto.nome%type,
                             p_descricao in tb_acad_produto.descricao%type,
                             p_status in tb_acad_produto.status%type
                             ) is

cursor c_produtos is
    SELECT *
    FROM tb_acad_produto;

begin

for produto in c_produtos
    loop
      if produto.id_produto = p_id_produto then
         update tb_acad_produto tap
         set tap.nome =               p_nome,
             tap.descricao =          p_descricao,
             tap.status   =           p_status
         where p_id_produto = tap.id_produto;
      end if;
    end loop;

 commit;

end proc_altera_produto;


function func_retorna_id_produto(p_id_produto in tb_acad_produto.id_produto%type)
return tb_acad_produto.id_produto%type is
  cursor c_produtos is
      SELECT *
      FROM tb_acad_produto;
  begin
    for produto in c_produtos
      loop
        if p_id_produto = produto.id_produto then
          return produto.id_produto;
        end if;
      end loop;
      return null;

end func_retorna_id_produto;

END;
/

prompt
prompt Creating package body PACK_RELATORIO
prompt ====================================
prompt
create or replace package body PACK_RELATORIO is


  procedure proc_retorna_rel_lucratividade(p_tab in out cur_listar_rel_lucratividade,
                                   p_data_inicio in date,
                                   p_data_fim in date) is

  begin
      open p_tab for
      SELECT
             PRO.NOME,
             sum(IP.QUANTIDADE) as QUANTIDADE_VENDIDA,
             IE.PRECO_CUSTO,
             IE.MARGEM_LUCRO, 
             IE.PRECO_VENDA,
             sum(IP.QUANTIDADE) * (IE.PRECO_VENDA - IE.PRECO_CUSTO) as LUCRO_TOTAL
      FROM TB_ACAD_PEDIDO P
           INNER JOIN TB_ACAD_ITEM_PEDIDO IP ON IP.FK_ID_PEDIDO = P.ID_PEDIDO
           INNER JOIN TB_ACAD_ITEM_ESTOQUE IE ON IE.ID_ITEM_ESTOQUE = IP.FK_ID_ITEM_ESTOQUE
           INNER JOIN TB_ACAD_PRODUTO PRO ON PRO.ID_PRODUTO = IE.FK_ID_PRODUTO
      WHERE P.DATA_PEDIDO BETWEEN nvl(p_data_inicio, '01/01/2021') and nvl(p_data_fim + .99999, sysdate + .99999)
      GROUP BY PRO.NOME, IE.PRECO_VENDA, IE.PRECO_CUSTO, IE.MARGEM_LUCRO;

  end proc_retorna_rel_lucratividade;


  procedure proc_retorna_rel_vendas_diarias_vendedor(p_tab in out cur_listar_rel_vendas_diarias_vendedor,
                                                     p_re_funcionario in tb_acad_funcionario.id_funcionario%type,
                                                     p_permissao in tb_acad_funcionario.tipo_permissao%type,
                                                     p_tipo_status in tb_acad_funcionario.status%type) is
                                                                                                       
  begin
      if p_permissao = 1 then -- Vendedor
          if p_tipo_status = 2 then -- Cancelado
               open p_tab for
                 select pd.id_pedido,
                        cli.nome as nome_cliente, 
                        pd.preco_total,
                        decode(pd.status,
                               1, 'Iniciado',
                               2, 'Aberto',
                               3, 'Fechado',
                               4, 'Cancelado') as status_pedido,
                        fun.nome as nome_vendedor
                from tb_acad_cliente cli inner join tb_acad_pedido pd on cli.id_cliente = pd.fk_id_cliente
                     inner join tb_acad_funcionario fun on fun.id_funcionario = pd.fk_id_funconario
                     where pd.preco_total > 0
                       and pd.data_pedido between trunc(sysdate - .99999) and trunc(sysdate) +.99999
                       and pd.status = 4
                       and fun.id_funcionario = p_re_funcionario;
          end if;

          if p_tipo_status = 1 then -- Fechado
               open p_tab for
                 select pd.id_pedido,
                        cli.nome as nome_cliente, 
                        pd.preco_total,
                        decode(pd.status,
                               1, 'Iniciado',
                               2, 'Aberto',
                               3, 'Fechado',
                               4, 'Cancelado') as status_pedido,
                        fun.nome as nome_vendedor
                from tb_acad_cliente cli inner join tb_acad_pedido pd on cli.id_cliente = pd.fk_id_cliente
                     inner join tb_acad_funcionario fun on fun.id_funcionario = pd.fk_id_funconario
                     where pd.preco_total > 0
                       and pd.data_pedido between trunc(sysdate - .99999) and trunc(sysdate) +.99999
                       and pd.status = 3
                       and fun.id_funcionario = p_re_funcionario;
          end if;
      end if;
      
     if p_permissao = 2 then -- Gerente
          if p_tipo_status = 2 then -- Cancelado
               open p_tab for
                 select pd.id_pedido,
                        cli.nome as nome_cliente, 
                        pd.preco_total,
                        decode(pd.status,
                               1, 'Iniciado',
                               2, 'Aberto',
                               3, 'Fechado',
                               4, 'Cancelado') as status_pedido,
                        fun.nome as nome_vendedor
                from tb_acad_cliente cli inner join tb_acad_pedido pd on cli.id_cliente = pd.fk_id_cliente
                     inner join tb_acad_funcionario fun on fun.id_funcionario = pd.fk_id_funconario
                     where pd.preco_total > 0
                       and pd.status = 4
                       and pd.data_pedido between trunc(sysdate - .99999) and trunc(sysdate) +.99999;
          end if;

          if p_tipo_status = 1 then -- Fechado
               open p_tab for
                 select pd.id_pedido,
                        cli.nome as nome_cliente, 
                        pd.preco_total,
                        decode(pd.status,
                               1, 'Iniciado',
                               2, 'Aberto',
                               3, 'Fechado',
                               4, 'Cancelado') as status_pedido,
                        fun.nome as nome_vendedor
                from tb_acad_cliente cli inner join tb_acad_pedido pd on cli.id_cliente = pd.fk_id_cliente
                     inner join tb_acad_funcionario fun on fun.id_funcionario = pd.fk_id_funconario
                     where pd.preco_total > 0
                       and pd.status = 3
                       and pd.data_pedido between trunc(sysdate - .99999) and trunc(sysdate) +.99999;
          end if;
      end if;
      
  end proc_retorna_rel_vendas_diarias_vendedor;


  procedure proc_rer(p_re_funcionario in tb_acad_funcionario.id_funcionario%type,
                     p_total_pedido out  number,
                     p_tipo_status in tb_acad_funcionario.status%type,
                      p_permissao in tb_acad_funcionario.tipo_permissao%type) is
  
  begin
  if p_tipo_status = 1 then
    if p_permissao = 1 then
       select sum(pd.preco_total) into p_total_pedido
       from tb_acad_cliente cli inner join tb_acad_pedido pd on cli.id_cliente = pd.fk_id_cliente
                                inner join tb_acad_funcionario fun on fun.id_funcionario = pd.fk_id_funconario
       where pd.preco_total > 0
             and pd.data_pedido between trunc(sysdate - .99999) and trunc(sysdate) +.99999
             and pd.status = 3
             and fun.id_funcionario = p_re_funcionario;
    elsif p_permissao = 2 then
       select sum(pd.preco_total) into p_total_pedido
       from tb_acad_cliente cli inner join tb_acad_pedido pd on cli.id_cliente = pd.fk_id_cliente
                                inner join tb_acad_funcionario fun on fun.id_funcionario = pd.fk_id_funconario
       where pd.preco_total > 0
             and pd.data_pedido between trunc(sysdate - .99999) and trunc(sysdate) +.99999
             and pd.status = 3;
    end if;
             
  elsif p_tipo_status = 2 then
   if p_permissao = 1 then
       select sum(pd.preco_total) into p_total_pedido
       from tb_acad_cliente cli inner join tb_acad_pedido pd on cli.id_cliente = pd.fk_id_cliente
                                inner join tb_acad_funcionario fun on fun.id_funcionario = pd.fk_id_funconario
       where pd.preco_total > 0
             and pd.data_pedido between trunc(sysdate - .99999) and trunc(sysdate) +.99999
             and pd.status = 4
             and fun.id_funcionario = p_re_funcionario;
    elsif p_permissao = 2 then
         select sum(pd.preco_total) into p_total_pedido
         from tb_acad_cliente cli inner join tb_acad_pedido pd on cli.id_cliente = pd.fk_id_cliente
                                  inner join tb_acad_funcionario fun on fun.id_funcionario = pd.fk_id_funconario
         where pd.preco_total > 0
               and pd.data_pedido between trunc(sysdate - .99999) and trunc(sysdate) +.99999
               and pd.status = 4;
    end if;
  end if;
  end proc_rer;


end PACK_RELATORIO;
/

prompt
prompt Creating package body PACK_SERVICOS
prompt ===================================
prompt
create or replace package body PACK_SERVICOS is

procedure proc_consulta_servico(p_tab in out cur_servico,
                                p_tipo_pesquisa in number,
                                p_palavra_chave in varchar2,
                                p_tipo_status in number) is
begin
  if p_tipo_status = 1 then
      if p_tipo_pesquisa = 1 then
        open p_tab for
          select *
          from tb_acad_servico tas
          where upper(tas.nome) like '%' || upper(p_palavra_chave) || '%'
          and tas.status = 1;
      end if;

      if p_tipo_pesquisa = 2 then
        open p_tab for
          select *
          from tb_acad_servico tas
          where upper(tas.descricao) like '%' || upper(p_palavra_chave) || '%'
          and tas.status = 1;
      end if;

   elsif p_tipo_status = 2 then
         if p_tipo_pesquisa = 1 then
            open p_tab for
              select *
              from tb_acad_servico tas
              where upper(tas.nome) like '%' || upper(p_palavra_chave) || '%';
          end if;

          if p_tipo_pesquisa = 2 then
            open p_tab for
              select *
              from tb_acad_servico tas
              where upper(tas.descricao) like '%' || upper(p_palavra_chave) || '%';
          end if;
   end if;

end proc_consulta_servico;

procedure proc_insere_servico(p_nome in        tb_acad_servico.nome%type,
                              p_valor in       tb_acad_servico.valor%type,
                              p_descricao in   tb_acad_servico.descricao%type,
                              p_tipo in        tb_acad_servico.tipo%type,
                              p_status in      tb_acad_servico.status%type) is

begin

insert into tb_acad_servico(nome,
                             valor,
                             descricao,
                             tipo,
                             status)

values(
                             p_nome,
                             p_valor,
                             p_descricao,
                             p_tipo,
                             p_status
                             );

commit;

end proc_insere_servico;

procedure proc_altera_servico(
                             p_id_servico_produto in tb_acad_servico.id_servico_produto%type,
                             p_nome in tb_acad_servico.nome%type,
                             p_valor in tb_acad_servico.valor%type,
                             p_descricao in tb_acad_servico.descricao%type,
                             p_tipo in tb_acad_servico.tipo%type,
                             p_status in tb_acad_servico.status%type) is

cursor c_servico is
       select *
       from tb_acad_servico;

begin

for servico in c_servico
    loop
     if servico.id_servico_produto= p_id_servico_produto then
        update tb_acad_servico tas
        set tas.nome = p_nome,
            tas.valor = p_valor,
            tas.descricao = p_descricao,
            tas.tipo = p_tipo,
            tas.status = p_status
        where p_id_servico_produto = tas.id_servico_produto;
     end if;
    end loop;

commit;

end proc_altera_servico;

procedure proc_busca_servico(p_id_servico_produto in       tb_acad_servico.id_servico_produto%type,
                             p_nome out                    tb_acad_servico.nome%type,
                             p_valor out                   tb_acad_servico.valor%type,
                             p_descricao out               tb_acad_servico.descricao%type,
                             p_tipo out                    tb_acad_servico.tipo%type,
                             p_status out                  tb_acad_servico.status%type) is

cursor c_servico is
       SELECT *
       FROM tb_acad_servico;

begin
 for servico in c_servico
   loop
     if servico.id_servico_produto = p_id_servico_produto then
        p_nome := servico.nome;
        p_valor := servico.valor;
        p_descricao := servico.descricao;
        p_tipo := servico.tipo;
        p_status := servico.status;
     end if;
   end loop;

end proc_busca_servico;

end PACK_SERVICOS;
/

prompt
prompt Creating trigger SOMAR_TOTAL
prompt ============================
prompt
create or replace trigger somar_total
  after insert or update
  on tb_acad_item_pedido
  for each row
begin
 
if (inserting) then
  update tb_acad_pedido ped
  set    ped.preco_total = ped.preco_total + :new.subtotal
  where  ped.id_pedido = :new.fk_id_pedido;
elsif (updating) then
  update tb_acad_pedido ped
  set    ped.preco_total = ped.preco_total - :old.subtotal + :new.subtotal
  where  ped.id_pedido = :new.fk_id_pedido; 
end if;


end somar_total;
/

prompt
prompt Creating trigger SOMAR_TOTAL_COMPRA
prompt ===================================
prompt
create or replace trigger SOMAR_TOTAL_COMPRA
  after insert or update
  on tb_acad_item_pedido_compra 
  for each row
declare
  -- local variables here
begin
  if (inserting) then
  update tb_acad_pedido_compra ped
  set    ped.preco_total = ped.preco_total + :new.subtotal
  where  ped.id_pedido_compra = :new.fk_id_pedido_compra;
elsif (updating) then
  update tb_acad_pedido_compra ped
  set    ped.preco_total = ped.preco_total - :old.subtotal + :new.subtotal
  where  ped.id_pedido_compra = :new.fk_id_pedido_compra; 
end if;
end SOMAR_TOTAL_COMPRA;
/

prompt
prompt Creating trigger SUBTRAIR_ESTOQUE
prompt =================================
prompt
create or replace trigger subtrair_estoque
  before update or insert or delete
  on tb_acad_item_pedido
  for each row
declare
begin
  if (Inserting) then
        update tb_acad_item_estoque ie
        set ie.quantidade = ie.quantidade - :new.quantidade
        where ie.id_item_estoque = :new.fk_id_item_estoque;
  elsif (Updating) then
     if :new.quantidade > :old.quantidade then
        update tb_acad_item_estoque ie
        set ie.quantidade = ie.quantidade - (:new.quantidade - :old.quantidade)
        where ie.id_item_estoque = :new.fk_id_item_estoque;
     elsif :new.quantidade < :old.quantidade then
        update tb_acad_item_estoque ie
        set ie.quantidade = ie.quantidade + (:old.quantidade - :new.quantidade)
        where ie.id_item_estoque = :new.fk_id_item_estoque;
     end if;
  else
        update tb_acad_item_estoque ie
        set ie.quantidade = ie.quantidade + :old.quantidade
        where ie.id_item_estoque = :old.fk_id_item_estoque;
  end if;
end subtrair_estoque;
/

prompt
prompt Creating trigger TG_CRIAR_ITEM_ESTOQUE
prompt ======================================
prompt
create or replace trigger tg_criar_item_estoque
  after update
  on tb_acad_pedido_compra 
  for each row
declare
  cursor cur_item is
        select ipc.quantidade, ipc.preco_custo, ipc.margem_lucro, ie.fk_id_produto, ipc.fk_id_item_estoque from tb_acad_item_pedido_compra ipc
        inner join tb_acad_item_estoque ie
        on ipc.fk_id_item_estoque = ie.id_item_estoque
        where ipc.fk_id_pedido_compra = :new.id_pedido_compra
        ;
begin
  if :new.status = 3 then
    for lr in cur_item loop
       PACK_PEDIDO_COMPRA.proc_insere_item_estoque(lr.fk_id_item_estoque, lr.quantidade, lr.preco_custo, lr.margem_lucro, lr.fk_id_produto);
    end loop;
      
  end if;
end tg_criar_item_estoque;
/

prompt
prompt Creating trigger TG_CRIAR_ITEM_ESTOQUE_ZERADO
prompt =============================================
prompt
CREATE OR REPLACE TRIGGER tg_criar_item_estoque_zerado

       AFTER INSERT
       ON tb_acad_produto

       FOR EACH ROW
           BEGIN
                INSERT INTO TB_ACAD_ITEM_ESTOQUE(QUANTIDADE,DATA_CADASTRO,STATUS,PRECO_CUSTO,MARGEM_LUCRO,PRECO_VENDA,FK_ID_PRODUTO,FK_ID_ESTOQUE) VALUES(0,SYSDATE,1,0,0,0,:NEW.ID_PRODUTO,1);
           END;
/

prompt
prompt Creating trigger TG_EXCLUIR_ITEM_ESTOQUE
prompt ========================================
prompt
create or replace trigger TG_EXCLUIR_ITEM_ESTOQUE
  after delete
  on tb_acad_item_pedido_compra 
  for each row
declare
  -- local variables here
begin
  delete tb_acad_item_estoque ie 
  where ie.id_item_estoque = :old.fk_id_item_estoque;
end TG_EXCLUIR_ITEM_ESTOQUE;
/


prompt Done
spool off
set define on
