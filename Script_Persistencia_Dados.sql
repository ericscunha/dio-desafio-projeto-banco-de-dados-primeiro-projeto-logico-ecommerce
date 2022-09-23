-- Persitência de dados no banco de dados
use ecommerce;

-- Estado
insert into state values ('AL', 'Alagoas'),
						 ('BA', 'Bahia'),
                         ('SE', 'Sergipe');

-- Cidade
insert into city (name_city, id_state) values ('Maceió', 'AL'),
											  ('Salvador', 'BA'),
                                              ('Aracaju', 'SE');
                                              
-- Categoria de Produtos
insert into category (name_category) values ('Brinquedos'),
											('Perfumes'),
                                            ('Vestuário'),
                                            ('Móveis'),
                                            ('Eletrodomésticos'),
											('Informática');

-- Unidade de Medida
insert into units values ('UND', 'Unidade'),
						 ('CX', 'Caixa'),
                         ('PCT', 'Pacote'),
                         ('KG', 'Kilograma');

-- Operadora de cartão
insert into operator_card (name_operator, credit, debit)
	values ('Visa', 1, 1),
		   ('Master', 1, 0),
           ('Maestro', 0, 1);
                                              
insert into clients (Fname, Minit, Lname, type_client, document_number, bithdate, email, phone)
	values ('Joao', 'S', 'Santos', 'PF', '12345678901', '1978-06-23', 'joao@email.com', '71999998888'),
           ('Maria', 'B', 'Carvalho', 'PF', '13355678901', '1988-12-20', 'maria@email.com', '79999776688'),
           ('Carlos', 'A', 'Barbosa', 'PF', '17345676981', '1984-05-12', 'carlos@email.com', '82998795846'),
           ('Ventura SA', null, null, 'PJ', '123456789000145', null, 'ventura@email.com', '799981234455');


insert into address (address, number_address, add_information, district, zip_code, id_client, id_city, actived, main_address)
	values ('Rua A', '25', null, 'Brotas', '40000000', 1, 2, 1, 1),
		   ('Rua B', '1075', null, 'Coroa do meio', '49000000', 2, 2, 1, 1),
           ('Rua do Meio', 'S/N', null, 'Jatiuca', '57000000', 3, 2, 1, 1),
           ('Rua do Inácio', '876', null, 'DIA', '49000000', 4, 2, 1, 1);
           
insert into client_cards(id_client, alias_card, id_operator_card, card_number, validity, name_owner_card, actived)
			values (1, 'Visa João', 1, '4756786498763214', '12/23', 'João S Santos', 1),
				   (2, 'Master', 2, '4778789498764513', '12/30', 'Maria B Carvalho', 1),
                   (3, 'Master', 2, '4778239488769247', '02/25', 'Carlos A Barbosa', 1),
                   (4, 'Visa', 1, '4756467896128324', '01/26', 'Ventura Corpoarte', 1);

-- Situações do Pedido
insert into status_order (status_description)
	values ("Em andamento"), ("Processando"), ("Enviado"), ("Entregue"), ("Cancelado");

-- Produto    
insert into product(name_product, classification_kids, id_category, id_units, size, price)
	values ('Jogo de Xadrez', 1, 1, 'UND', null, 60.00),
		   ('Jogo de Dominó', 1, 1, 'UND', null, 40.00),
           ('Uno', 1, 1, 'UND', null, 25.00),
           ('Pikachu de Pelúcia', 1, 1, 'UND', null, 200.00),
           ('Dior Sauvage', 0, 2, 'UND', '100 ml', 400.00),
           ('Forno Microondas 30L', 0, 5, 'UND', '30L', 500.00),
           ('Notebook ROG Core i7', 0, 6, 'UND', null, 9000.00),
           ('Mouse sem fio', 0, 6, 'UND', null, 100.00),
           ('Monitor LED 21 pol', 0, 6, 'UND', null, 1300.00);

-- Estoque
insert into product_storage (storage_location)
	values ('CD Maceió'), ('CD Salvador'), ('CD Aracaju');
        
insert into storage_location(id_storage, id_product, location)
	values (1, 1, 'RABCA1'),
		   (1, 2, 'RABCA1'),
           (1, 3, 'RABCA1'),
           (1, 4, 'RABBA2'),
           (1, 5, 'RDBAA1'),
           (1, 6, 'RZBEA3'),
           (1, 7, 'RZBAA1'),
           (1, 8, 'RZBBA3'),
           (1, 9, 'RZBBA3'),
           (2, 1, 'RABCA1'),
		   (2, 2, 'RABCA1'),
           (2, 3, 'RABCA1'),
           (2, 4, 'RABBA2'),
           (2, 5, 'RDBAA1'),
           (2, 6, 'RZBEA3'),
           (2, 7, 'RZBAA1'),
           (2, 8, 'RZBBA3'),
           (2, 9, 'RZBBA3'),
           (3, 1, 'RABCA1'),
		   (3, 2, 'RABCA1'),
           (3, 3, 'RABCA1'),
           (3, 4, 'RABBA2'),
           (3, 5, 'RDBAA1'),
           (3, 6, 'RZBEA3'),
           (3, 7, 'RZBAA1'),
           (3, 8, 'RZBBA3'),
           (3, 9, 'RZBBA3');
           
-- criar tabela vendedor_fornecedor
insert into seller_supplier(social_name, type_client, document_number, seller, supplier, address, district, zip_code, id_city, phone)
	values ('ABC Brinquedos', 'PJ', '123456789000199', 1, 1, 'Rua X', 'DIA', '49000000', 3, '79991234567'),
		   ('Perfumes da Ju', 'PJ', '167893549000199', 1, 0, 'Rua das Rosas', 'Pirajá', '40000000', 2, '71993534589'),
           ('Delta Tech', 'PJ', '135678923000156', 1, 1, 'Rua Info', 'Jardim das Margaridas', '49000000', 2, '71999863227'),
           ('Connorte Eletrodomésticos', 'PJ', '156923789000148', 0, 1, 'Rua do eixo', 'Centro Industrial', '57000000', 1, '82993894729'),
           ('ABC Eletrodomesticos', 'PJ', '123456789000198', 1, 0, 'Rua X', 'DIA', '49000000', 3, '79991234568');
           
insert into product_seller(id_seller, id_product, prod_quantity)
	values (1, 1, 30),
           (1, 2, 50),
           (1, 3, 15),
           (1, 4, 5),
           (2, 5, 10),
           (3, 7, 30),
           (3, 8, 30),
           (3, 9, 30),
           (5, 6, 30);
            
insert into product_supplier(id_supplier, id_Product, quantity)
	values (1, 1, 30),
           (1, 2, 50),
           (1, 3, 15),
           (1, 4, 5),
           (3, 7, 30),
           (3, 8, 30),
           (3, 9, 30),
           (4, 6, 50);
           
insert into orders(id_client, id_status_order, order_description, amount, send_value, date_order, id_client_address)
	values (1, 4, 'Brinquedos', 85.00, 0, '2022-09-09', 1),
		   (2, 4, 'Pefumes', 800, 30, '2022-09-09', 2),
           (3, 4, 'Eletrodomesticos', 1800, 45, '2022-09-09', 3),
           (4, 4, 'Informática', 18000.00, 0, '2022-09-10', 4),
           (1, 3, 'Pefume', 400.00, 0, '2022-09-19', 1),
		   (2, 3, 'Brinquedo', 40, 0, '2022-09-19', 2),
           (3, 3, 'Perfume', 400, 20, '2022-09-20', 3),
           (4, 3, 'Informática', 2800.00, 0, '2022-09-20', 4);
           
insert into product_order(id_order, id_product, quantity)
    values (1, 1, 1),
		   (1, 3, 1),
           (2, 5, 2),
           (3, 6, 1),
           (3, 9, 1),
           (4, 7, 2),
           (5, 5, 1),
           (6, 2, 1),
           (7, 5, 1),
           (8, 9, 2),
           (8, 8, 2);
           
 -- ("Em andamento"), ("Processando"), ("Enviado"), ("Entregue"),           
insert into monitor_orders(id_order, id_status_order, date_status, tracking_code)
	values (1, 1, '2022-09-09', null),
		   (1, 2, '2022-09-09', null),
           (1, 3, '2022-09-10', null),
           (1, 4, '2022-09-12', null),
           (2, 1, '2022-09-09', null),
		   (2, 2, '2022-09-09', null),
           (2, 3, '2022-09-10', null),
           (2, 4, '2022-09-12', null),
           (3, 1, '2022-09-09', null),
		   (3, 2, '2022-09-09', null),
           (3, 3, '2022-09-10', null),
           (3, 4, '2022-09-12', null),
           (4, 1, '2022-09-10', null),
		   (4, 2, '2022-09-10', null),
           (4, 3, '2022-09-11', null),
           (4, 4, '2022-09-13', null),
           (5, 1, '2022-09-19', null),
		   (5, 2, '2022-09-19', null),
           (5, 3, '2022-09-20', null),
           (6, 1, '2022-09-19', null),
		   (6, 2, '2022-09-19', null),
           (6, 3, '2022-09-20', null),
           (7, 1, '2022-09-20', null),
		   (7, 2, '2022-09-20', null),
           (7, 3, '2022-09-21', null),
           (8, 1, '2022-09-20', null),
		   (8, 2, '2022-09-20', null),
           (8, 3, '2022-09-21', null);

-- ENUM("Boleto", "Pix", "Cartão de Crédito", "Cartão de Débito")
-- ENUM("Aprovado", "Reprovado", "Aguardando") default "Aguardando"
-- Pagamentos de pedido
insert into payments(id_order, id_client_card, type_payment, amount, status_payment , payday, due_date, installment)
	values (1, null, 'Pix', 85.00, 'Aprovado', '2022-09-09', null, null),
		   (2, 2, 'Cartão de Crédito', 800, 'Aprovado', '2022-09-09', null, 4),
           (3, 3, 'Cartão de Crédito', 1800, 'Aprovado', '2022-09-09', null, 10),
           (4, 4, 'Cartão de Crédito', 18000, 'Aprovado', '2022-09-10', null, 6),
           (5, null, 'Boleto', 800, 'Aprovado', '2022-09-19', '2022-09-20', null),
           (6, null, 'Pix', 40, 'Aprovado', '2022-09-19', null, null),
           (7, 3, 'Cartão de Crédito', 400, 'Aprovado', '2022-09-20', null, 2),
           (8, 4, 'Cartão de Crédito', 2800, 'Aprovado', '2022-09-20', null, 10);