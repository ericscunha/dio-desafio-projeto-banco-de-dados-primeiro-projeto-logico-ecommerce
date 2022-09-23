-- Criação do banco de dados para o cenário de E-commerce

create database ecommerce;
use ecommerce;


-- criar tabela de Estado
create table state(
	id_state char(2) primary key,
    name_state varchar(45)
);

-- crir tabde de Cidades
create table city(
	id_city int auto_increment primary key,
    name_city varchar(45) not null,
    id_state char(2) not null,
    constraint fk_city_state foreign key (id_state) references state(id_state)
    		on update cascade
);

-- criar tabela cliente
create table clients(
	id_client int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    type_client ENUM("PF", "PJ") not null,
    document_number varchar(15) not null,
    bithdate date,
    email varchar(45),
	phone varchar(45),
    constraint unique_document_number_client unique (document_number)
);

-- criar tabela de Endereços
create table address(
	id_address int auto_increment primary key,
    address varchar(45) not null,
    number_address varchar(5),
    add_information varchar(45),
    district varchar(45) not null,
    zip_code varchar(9) not null,
    id_client int not null,
    id_city int not null,
    actived tinyint not null default 1,
    main_address tinyint not null default 0,
    constraint fk_address_client foreign key (id_client) references clients(id_client),
    constraint fk_address_city foreign key (id_city) references city(id_city)
);

-- Criar tabela de operadora de cartão de crédito/débito
create table operator_card(
	id_operator_card int auto_increment primary key,
    name_operator varchar(15) not null,
    credit tinyint not null default 1,
    debit tinyint not null default 0
);

-- criar tabela de cartão do cliente
create table client_cards(
	id_client_card int auto_increment primary key,
    id_client int not null,
    alias_card varchar(10),
    id_operator_card int not null,
    card_number varchar(16) not null,
    validity char(5) not null,
    name_owner_card varchar(45),
    document_number varchar(15),
    actived tinyint not null default 1,
    constraint fk_client_cards_operator foreign key (id_operator_card) references operator_card(id_operator_card)
);

-- criar tabela Categoria
create table category(
	id_category int auto_increment primary key,
    name_category varchar(45)
);

-- crair tabela Unidade de Medida
create table units(
	id_units varchar(5) primary key,
    name_unit varchar(20)
);

-- criar tabela produto
-- size = dimensão do produto
create table product(
	id_product int auto_increment primary key,
    name_product varchar(255) not null,
    classification_kids tinyint default 0,
    id_category int not null,
    id_units varchar(5) not null,
    evaluation int default 0,
    size varchar(10),
    price float not null,
    constraint fk_product_category foreign key (id_category) references category(id_category),
    constraint fk_product_units foreign key (id_units) references units(id_units)
);

-- Criar tabela de Situações
create table status_order(
	id_status_order int auto_increment primary key,
    status_description varchar(20) not null
);

-- criar tabela pedido
create table orders(
	id_order int auto_increment primary key,
    id_client int not null,
    id_status_order int not null,
    order_description varchar(255),
    amount float default 0,
    send_value float default 0,
    date_order datetime,
    id_client_address int not null,
    constraint fk_orders_status_order foreign key (id_status_order) references status_order(id_status_order),
    constraint fk_orders_client foreign key (id_client) references clients(id_client)
		on update cascade,
	constraint fk_orders_client_address foreign key (id_client_address) references address(id_address)
);

-- criar tabela status do pedido
create table monitor_orders(
	id_monitor_order int auto_increment,
    id_order int not null,
    id_status_order int not null,
    date_status datetime not null,
    tracking_code varchar(45),
    contact_delivery varchar(45),
    primary key (id_monitor_order, id_order),
    constraint fk_monitor_orders_orders foreign key (id_order) references orders(id_order)
		on delete cascade,
	constraint fk_monitor_orders_status foreign key (id_status_order) references status_order(id_status_order)
);

-- Criar tabela de pagamentos
create table payments(
	id_payment int auto_increment not null,
	id_order int not null,
    id_client_card int,
    type_payment ENUM("Boleto", "Pix", "Cartão de Crédito", "Cartão de Débito") not null,
    amount float not null,
    status_payment ENUM("Aprovado", "Reprovado", "Aguardando") default "Aguardando",
    payday datetime,
    due_date date,
    authorization_code varchar(45),
    installment smallint,
    primary key (id_payment, id_order),
    constraint fk_payment_order foreign key (id_order) references orders(id_order)
		on delete cascade,
    constraint fk_payment_client_card foreign key (id_client_card) references client_cards(id_client_card) 
);

-- criar tabela estoque
create table product_storage(
	id_prod_storage int auto_increment primary key,
    storage_location varchar(255),
    quantity int default 0
);

-- criar tabela vendedor_fornecedor
create table seller_supplier(
	id_seller_supplier int auto_increment primary key,
    social_name varchar(80) not null,
    type_client ENUM("PF", "PJ") not null,
    document_number varchar(15) not null,
    seller tinyint not null default 1,
    supplier tinyint not null default 0,
    address varchar(45) not null,
    number_address varchar(5),
    add_information varchar(45),
    district varchar(45) not null,
    zip_code varchar(9) not null,
    id_city int not null,
    phone char(12) not null, 
    name_contact varchar(45),
    email varchar(45),
    constraint unique_document_number unique (document_number),
    constraint fk_seller_supplier_city foreign key (id_city) references city(id_city)
);

create table product_seller(
	id_seller int,
    id_product int,
    prod_quantity int default 1,
    primary key (id_seller, id_product),
    constraint fk_product_seller_seller foreign key (id_seller) references seller_supplier(id_seller_supplier),
    constraint fk_product_seller_product foreign key (id_product) references product(id_product)
);

create table product_order(
	id_product int,
    id_order int,
    quantity int default 1,
    produ_Status enum('Disponível', 'Sem Estoque') default 'Disponível',
    primary key (id_product, id_order),
    constraint fk_productorder_product foreign key (id_product) references product(id_product),
    constraint fk_productorder_order foreign key (id_order) references orders(id_order)
);

create table storage_location(
	id_product int,
    id_storage int,
    location varchar(255),
    primary key (id_product, id_storage),
    constraint fk_storage_location_product foreign key (id_product) references product(id_Product),
    constraint fk_storage_location_storage foreign key (id_storage) references product_storage(id_prod_storage)
);

create table product_supplier(
	id_supplier int,
    id_Product int,
    quantity int not null,
    primary key (id_supplier, id_Product),
    constraint fk_product_supplier_supplier foreign key (id_Supplier) references seller_supplier(id_seller_supplier),
    constraint fk_product_supplier_product foreign key (id_product) references product(id_product)
);

show tables;

    
