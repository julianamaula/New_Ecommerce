-- drop database New_Ecommerce;

create database New_Ecommerce;
use New_Ecommerce;

-- Criação das tabelas

-- Criando tabela de clientes
CREATE TABLE clients (
    idClient INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único do cliente
    Fname VARCHAR(10), -- Primeiro nome do cliente
    Minit CHAR(3), -- Inicial do nome do meio
    Lname VARCHAR(20), -- Último nome do cliente
    CPF CHAR(11) NOT NULL, -- CPF do cliente (único e obrigatório)
    Address VARCHAR(255), -- Endereço do cliente
    CONSTRAINT unique_cpf_cliente UNIQUE (CPF) -- Restringe a duplicação de CPF
);

-- Criando tabela de produtos
CREATE TABLE product (
    idProduct INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único do produto
    Pname VARCHAR(255) NOT NULL, -- Nome do produto
    rating_kids BOOLEAN DEFAULT FALSE, -- Indica se é recomendado para crianças
    Category ENUM('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') NOT NULL, -- Categoria do produto
    avaliação FLOAT DEFAULT 0, -- Avaliação do produto (padrão 0)
    size VARCHAR(10) -- Tamanho do produto (se aplicável)
);

-- Criando tabela de pagamentos
CREATE TABLE payments (
    idClient INT, -- Chave estrangeira referenciando clientes
    idPayment INT, -- Identificador do pagamento
    typePayment ENUM('Boleto','Cartão','Dois cartões','Pix'), -- Tipo de pagamento aceito
    limiteAvailable FLOAT, -- Limite disponível para pagamento
    PRIMARY KEY (idClient, idPayment) -- Chave composta garantindo unicidade
);

-- Criando tabela de pedidos
CREATE TABLE orders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único do pedido
    idOrderClient INT, -- Cliente que realizou o pedido
    orderStatus ENUM('Cancelado','Confirmado','Em processamento') DEFAULT 'Em processamento', -- Status do pedido
    orderDescription VARCHAR(255), -- Descrição do pedido
    sendValue FLOAT DEFAULT 10, -- Valor do frete padrão
    paymentCash BOOLEAN DEFAULT FALSE, -- Indica se o pagamento foi à vista
    CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES clients(idClient) ON UPDATE CASCADE -- Relaciona pedido ao cliente
);

-- Criando ordens de pagamentos, oferencendo um pagamento pode ser associado a múltiplos pedidos
CREATE TABLE orderPayments (
    idOrder INT,
    idPayment INT,
    idClient INT,
    PRIMARY KEY (idOrder, idPayment),
    FOREIGN KEY (idOrder) REFERENCES orders(idOrder),
    FOREIGN KEY (idClient, idPayment) REFERENCES payments(idClient, idPayment)
);



-- Criando tabela de armazenamento de produtos
CREATE TABLE productStorage (
    idProdStorage INT AUTO_INCREMENT PRIMARY KEY, -- Identificador do armazenamento
    storageLocation VARCHAR(255), -- Local de armazenamento
    quantity INT DEFAULT 0 -- Quantidade de produtos disponíveis
);



CREATE TABLE supplier (
		idSupplier INT AUTO_INCREMENT PRIMARY KEY,
        SocialName VARCHAR(255) NOT NULL,
	    CNPJ CHAR (15) NOT NULL,
        contact CHAR (11) NOT NULL,
        CONSTRAINT unique_supplier UNIQUE (CNPJ)
        
        );
        
	
create table seller  (
		idSeller INT AUTO_INCREMENT PRIMARY KEY,
        SocialName VARCHAR(255) NOT NULL,
        AbstName varchar (255),
	    CNPJ CHAR(15),
        CPF CHAR (11),
        location VARCHAR (255),
        contact CHAR (11) NOT NULL,
        CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
        CONSTRAINT unique_cpf_seller UNIQUE (CPF)
        
        );

-- Criando tabela de fornecedores
CREATE TABLE fornecedor (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único do fornecedor
    SocialName VARCHAR(255) NOT NULL, -- Razão social do fornecedor
    CNPJ CHAR(15) NOT NULL, -- CNPJ único do fornecedor
    contato CHAR(11) NOT NULL, -- Contato do fornecedor
    CONSTRAINT unique_supplier UNIQUE (CNPJ) -- Restrição de CNPJ único
);

-- Criando tabela de vendedores
CREATE TABLE vendedor (
    idSeller INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único do vendedor
    SocialName VARCHAR(255) NOT NULL, -- Razão social do vendedor
    AbstName VARCHAR(255), -- Nome fantasia
    CNPJ CHAR(15), -- CNPJ do vendedor (se aplicável)
    CPF CHAR(11), -- CPF do vendedor (se aplicável)
    local VARCHAR(255), -- Localização do vendedor
    contato CHAR(11) NOT NULL, -- Contato do vendedor
    CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ), -- Restrição para CNPJ único
    CONSTRAINT unique_cpf_seller UNIQUE (CPF) -- Restrição para CPF único
);

-- Criando tabela de produtos vendidos por vendedores
CREATE TABLE productSeller (
    idPseller INT, -- Identificador do vendedor
    idPproduct INT, -- Identificador do produto
    prodQuantity INT DEFAULT 1, -- Quantidade do produto disponível para venda
    PRIMARY KEY (idPseller, idPproduct), -- Chave composta
    CONSTRAINT fk_product_seller FOREIGN KEY (idPseller) REFERENCES seller (idSeller), -- Relacionamento com vendedor
    CONSTRAINT fk_product_product FOREIGN KEY (idPproduct) REFERENCES product(idProduct) -- Relacionamento com produto
);

-- Criando tabela de pedidos de produtos
CREATE TABLE productOrder (
    idPOproduct INT, -- Identificador do produto
    idPOorder INT, -- Identificador do pedido
    poQuantity INT DEFAULT 1, -- Quantidade do produto no pedido
    poStatus ENUM('Disponível','Sem estoque') DEFAULT 'Disponível', -- Status do produto no pedido
    PRIMARY KEY (idPOproduct, idPOorder), -- Chave composta
    CONSTRAINT fk_productorder_product FOREIGN KEY (idPOproduct) REFERENCES product(idProduct), -- Relacionamento com produto
    CONSTRAINT fk_productorder_order FOREIGN KEY (idPOorder) REFERENCES orders(idOrder) -- Relacionamento com pedido
);

-- Criando tabela de localização do estoque
CREATE TABLE storageLocation (
    idLproduct INT, -- Identificador do produto
    idLstorage INT, -- Identificador do armazenamento
    location VARCHAR(255) NOT NULL, -- Localização do estoque
    PRIMARY KEY (idLproduct, idLstorage), -- Chave composta
    CONSTRAINT fk_storage_location_product FOREIGN KEY (idLproduct) REFERENCES product(idProduct), -- Relacionamento com produto
    CONSTRAINT fk_storage_location_storage FOREIGN KEY (idLstorage) REFERENCES productStorage(idProdStorage) -- Relacionamento com armazenamento
);

-- Criando tabela de fornecedores de produtos
CREATE TABLE productSupplier (
    idPsSupplier INT, -- Identificador do fornecedor
    idPsProduct INT, -- Identificador do produto
    quantity INT NOT NULL, -- Quantidade fornecida
    PRIMARY KEY (idPsSupplier, idPsProduct), -- Chave composta
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier) REFERENCES supplier (idSupplier), -- Relacionamento com fornecedor
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct) REFERENCES product(idProduct) -- Relacionamento com produto
);


