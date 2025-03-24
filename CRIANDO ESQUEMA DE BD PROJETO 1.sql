create database ecommerce;
use ecommerce;

-- tabela cliente
create table client (
    idClient int auto_increment primary key,
    fname varchar (10),
    mname varchar (3),
    lname varchar (20),
    cpf char (11) not null,
    address varchar (30),
    constraint unique_cpf_client unique (cpf)
);

-- tabela produto
create table product (
    idProduct int auto_increment primary key,
    pname varchar(10),
    classification_kids bool default false,
    category enum('Eletrônico', 'Vestuário', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    avaliacao float default 0,
    size varchar(10),
    constraint unique_pname unique (pname)
);

create table payments(
	idClient int,
    idPayment int,
    typePayment enum('Boleto','Cartão','Dois Cartões'),
    limitAvailable float,
    primary key (idClient, idpayment)
);

-- tabela pedido
create table orders (
    idorder int auto_increment primary key,
    idorderclient int,
    orderstatus enum('Cancelado', 'Confirmado', 'Em processamento') not null,
    orderdescription varchar(255),
    sendvalue float default 10,
    paymentcash boolean default false,
    constraint fk_orders_clients foreign key (idorderclient) references client(idclient)
);

-- tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
	storageLoaction varchar (255),
    quantity int default 0
);

-- tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null, 
    constraint unique_supplier unique (cnpj)
);

-- tabela vendedor
create table seller (
    idsupplier int auto_increment primary key,
    socialname varchar(255) not null,
    abstname varchar(255),
    cnpj char(15) not null,
    cpf char(9),
    contact char(11) not null, 
    constraint unique_cnpj_seller unique (cnpj),
    constraint unique_cpf_seller unique (cpf)
);

-- Tabela ProdutoVendedor
create table productseller (
    idpseller int,
    idpproduct int,
    prodquantity int default 1,
    primary key (idpseller, idpproduct),
    constraint fk_product_seller foreign key (idpseller) references seller (idsupplier),
    constraint fk_product_product foreign key (idpproduct) references product (idproduct)
);

-- tabela ProdutoPedido
create table productorder (
    idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum ('Disponivel','Sem estoque') default'Disponivel',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_seller foreign key (idPOproduct) references product (idProduct),
    constraint fk_productorder_product foreign key (idPOorder) references orders (idOrder)
);

-- tabela local de armazenamento
create table storageLocation (
	idLproduct int,
    idLstorage int, 
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product (idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage (idProdStorage)
);

-- tabela ProdutoFornecedor
create table productsupplier (
    idpssupplier int,
    idpsproduct int,
    quantity int not null,
    primary key (idpssupplier, idpsproduct),
    constraint fk_product_supplier foreign key (idpssupplier) references supplier(idsupplier),
    constraint fk_product_supplier_product foreign key (idpsproduct) references product(idproduct)
);






