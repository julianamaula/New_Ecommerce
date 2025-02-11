use New_Ecommerce;

-- inserindo os dados
 
-- idClient, Fname, Minit, Lname, CPF, Addres.
INSERT INTO clients (Fname, Minit, Lname, CPF, Address)  VALUES 
							('Maria', 'M', 'Silva', '12346789011', 'Rua Silva de Prata 29, Carangola - Cidade das Flores'),
							('Matheus', 'O', 'Pimentel', '97865432102', 'Rua Almeda 289, Centro - Cidade das Flores'),
							('Ricardo', 'F', 'Silva', '45678913123', 'Avenida Almeda Vinha 1009, Centro - Cidade das Flores'),
							('Julia', 'S', 'França', '78912345634', 'Rua Lareijras 861, Centro - Cidade das Flores'),
							('Roberta', 'G', 'Assis', '98745631987', 'Avenida Koller 19, Centro - Cidade das Flores'),
							('Isabela', 'M', 'Cruz', '65478912345', 'Rua Almeda das Flores 28, Centro - Cidade das Flores'
                            
                            );


INSERT INTO payments (idClient, idPayment, typePayment, limiteAvailable) VALUES
(1, 1, 'Cartão', 5000.00), 
(1, 2, 'Pix', 1000.00), 
(2, 3, 'Boleto', 2000.00);


               
               
               
-- idProduct, Pname, classification_kids boo, category('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'), avaliação, size
insert into product (Pname, rating_kids, category, avaliação, size) values
								('Fone de ouvido',false,'Eletrônico','4',null),
                                ('Barbie Elsa',true,'Brinquedos','3',null),
                                ('Body Carters',true,'Vestimenta','5',null),
                                ('Microfone Vedo - Youtuber',true,'Eletrônico','4',null),
                                ('Sofa retrátil',false,'Móveis','3','3x57x80'),
                                ('Farinha de arroz',false,'Alimentos','2',null),
                                ('Fire Stick Amazon',false,'Eletrônico','3',null);
                                
select * from clients;
select * from product;

-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash

delete from orders where idOrderClient in (1,2,3,4);
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
				   (1, default, 'compra via aplicativo', null,1),
                   (2, default,'compra via aplicativo',50,0),
                   (3,'Confirmado', null, null,1),
                   (4, default,'compra via web site', 150,0);


-- idPOproduct, idPOorder, poQuantity, poStatus
select * from orders;
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
						 (1,1,2,null),
                         (2,1,1,null),
                         (3,2,1,null);
                         
-- storageLocation, quantity
insert into productStorage (storageLocation, quantity) values
						   ('Rio de Janeiro',100),
                           ('Rio de Janeiro',500),
                           ('São Paulo',10),
                           ('São Paulo',100),
                           ('São Paulo',10),
                           ('Brasília',60);
                           
                           
-- id\Lproduct, idLstorage, location
insert into storageLocation (idLproduct, idLstorage, location) values
							(1,2,'RJ'),
                            (2,6,'GO');


-- idSupplier, SocialName, CNPJ, contact
insert into supplier (SocialName, CNPJ, contact) values
					 ('Almeida e filhos', 123456789123456, '21985474'),
                     ('Eletrônicos Silva', 854519649143457,'21985484'),
                     ('Eletrônicos Valma', 934567893934695, '21975474');
                     

select * from supplier;
-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
							(1,1,500),
                            (1,2,400),
                            (2,4,633),
                            (3,3,5),
                            (2,5,10);
                            
-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into  seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
					('Tech Eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
                    ('Botique Durgas', null, null, 123456783, 'Rio de Janeiro', 219567895),
                    ('Kids World', null, 456789123654485, null, 'São Paulo', 1198657484);
                    
select * from seller;

-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idPproduct, prodQuantity) value
						 (1,6,80),
                         (2,7,10);
                         
                         
                         
INSERT INTO orders (idOrderClient, orderStatus, orderDescription) 
VALUES (1, 'Confirmado', 'Pedido de teste');


INSERT INTO clients (Fname, Minit, Lname, CPF, Address) 
VALUES ('João', 'A', 'Silva', '12345678901', 'Rua A, 123');








