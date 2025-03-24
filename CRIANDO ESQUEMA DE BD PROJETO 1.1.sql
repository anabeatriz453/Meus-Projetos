use ecommerce;
show tables;

insert into client (Fname, Mname, Lname, cpf, Address) values
	('João', 'P', 'Silva', '12345678901', 'Rua das Flores, 123, São Paulo, SP, Brasil'),
	('Maria', 'A', 'Souza', '23456789012', 'Avenida Paulista, 456, São Paulo, SP, Brasil'),
	('Carlos', 'B', 'Oliveira', '34567890123', 'Rua do Mercado, 789, Rio de Janeiro, RJ, Brasil'),
	('Ana', 'C', 'Costa', '45678901234', 'Rua Boa Vista, 10, Belo Horizonte, MG, Brasil'),
	('Pedro', 'D', 'Santos', '56789012345', 'Avenida Central, 50, Curitiba, PR, Brasil'),
	('Juliana', 'E', 'Lima', '67890123456', 'Rua Primavera, 100, Salvador, BA, Brasil'),
	('Fernando', 'F', 'Pereira', '78901234567', 'Avenida Atlântica, 200, Recife, PE, Brasil'),
	('Camila', 'G', 'Ferreira', '89012345678', 'Rua das Palmeiras, 300, Porto Alegre, RS, Brasil'),
	('Bruno', 'H', 'Rodrigues', '90123456789', 'Avenida dos Bandeirantes, 400, Campinas, SP, Brasil'),
	('Patrícia', 'I', 'Alves', '01234567890', 'Rua do Sol, 500, Florianópolis, SC, Brasil');
    
    INSERT INTO product (Pname, classification_kids, category, avaliacao, size) VALUES
	('Camiseta Estampada', false, 'Roupas', 4.5, 'M'),
	('Blusa Infantil', true, 'Roupas', 4.8, 'P'),
	('Tênis Esportivo', false, 'Calçados', 4.3, '40'),
	('Sapatilha Colorida', false, 'Calçados', 4.7, '37'),
	('Mochila Escolar', true, 'Acessórios', 4.9, 'Único'),
	('Chapéu de Praia', false, 'Acessórios', 4.2, 'M'),
	('Bola de Futebol', true, 'Esportes', 4.8, 'Único'),
	('Carrinho de Brinquedo', true, 'Brinquedos', 4.6, 'Único'),
	('Jaqueta Jeans', false, 'Roupas', 4.4, 'G'),
	('Relógio Digital', false, 'Acessórios', 4.7, 'Único');
    
    
select * from client;
select * from product;

INSERT INTO orders (idorderclient, orderstatus, orderdescription, sendvalue, paymentcash) VALUES
	(1, 'Confirmado', 'Compra de roupas esportivas', 15.50, false),
	(2, 'Cancelado', 'Pedido de sapatos infantis', 10.00, true),
	(3, 'Em processamento', 'Compra de acessórios para celular', 12.30, false),
	(4, 'Confirmado', 'Pedido de alimentos orgânicos', 20.00, true),
	(5, 'Cancelado', 'Compra de material escolar', 10.00, false),
	(6, 'Em processamento', 'Pedido de brinquedos educativos', 18.40, true),
	(7, 'Confirmado', 'Compra de móveis para escritório', 25.00, false),
	(8, 'Confirmado', 'Pedido de livros de ficção', 13.70, true),
	(9, 'Em processamento', 'Compra de eletrônicos', 30.00, false),
	(10, 'Cancelado', 'Pedido de itens de decoração', 10.00, false);
    
select * from orders;
    
INSERT INTO productStorage (storageLoaction, quantity) VALUES
	('Armazém Central - São Paulo', 50),
	('Depósito Regional - Rio de Janeiro', 30),
	('Centro de Distribuição - Belo Horizonte', 20),
	('Depósito Norte - Manaus', 15),
	('Armazém Sul - Porto Alegre', 40),
	('Depósito Nordeste - Salvador', 25),
	('Centro de Distribuição - Curitiba', 35),
	('Depósito Oeste - Cuiabá', 10),
	('Armazém Litoral - Santos', 45),
	('Depósito Fronteira - Foz do Iguaçu', 12);
    
    select * from productStorage;

    INSERT INTO supplier (SocialName, CNPJ, contact) VALUES
	('Fornecedor Central Ltda', '12345678000195', '11987654321'),
	('Distribuidora Brasil S.A.', '22345678000195', '21987654321'),
	('Logística Sul Eireli', '32345678000195', '31987654321'),
	('Importadora Norte Ltda', '42345678000195', '92987654321'),
	('Alimentos Premium S.A.', '52345678000195', '71987654321');

  select * from supplier;

INSERT INTO seller (socialname, abstname, cnpj, cpf, contact) VALUES
	('Vendedor Central', 'V. Central', '62345678000195', '123456789', '11987654322'),
	('Comércio Rápido', NULL, '72345678000195', '234567891', '21987654322'),
	('Loja Express', 'L. Express', '82345678000195', '345678912', '31987654322'),
	('Mercado Top', NULL, '92345678000195', '456789123', '41987654322'),
	('Compras & Cia', 'C&Cia', '02345678000195', '567891234', '51987654322');

  select * from seller;

INSERT INTO productseller (idpseller, idpproduct, prodquantity) VALUES
	(1, 1, 10),
	(2, 2, 15),
	(3, 3, 5),
	(4, 4, 20),
	(5, 5, 12);

  select * from productseller;

INSERT INTO productorder (idPOproduct, idPOorder, poQuantity, poStatus) VALUES
	(1, 1, 2, 'Disponivel'),
	(2, 2, 1, 'Sem estoque'),
	(3, 3, 5, 'Disponivel'),
	(4, 4, 3, 'Sem estoque'),
	(5, 5, 4, 'Disponivel');

  select * from productorder;

INSERT INTO storageLocation (idLproduct, idLstorage, location) VALUES
	(1, 1, 'Centro de Distribuição - São Paulo'),
	(2, 2, 'Armazém Nordeste - Recife'),
	(3, 3, 'Depósito Sul - Porto Alegre'),
	(4, 4, 'Centro Oeste - Goiânia'),
	(5, 5, 'Litoral Norte - Salvador');

  select * from storageLocation;

INSERT INTO productsupplier (idpssupplier, idpsproduct, quantity) VALUES
	(1, 1, 100),
	(2, 2, 200),
	(3, 3, 150),
	(4, 4, 300),
	(5, 5, 250);

  select * from productsupplier;
  
  -- quantos clientes foram cadastrados na tabela
  select count(*) from client;

-- código  usado para recuperar informações das tabelas client e orders, combinando-as com base na relação entre c.idClient e o.idorderclient
SELECT * FROM 
client c, orders o 
WHERE c.idClient = o.idorderclient;






    
    

