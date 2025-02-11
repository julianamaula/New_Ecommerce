use New_Ecommerce;

-- Consultas complexas

-- Recuperação de clientes e seus pedidos
SELECT c.idClient, c.Fname, c.Lname, o.idOrder, o.orderStatus 
FROM clients c 
LEFT JOIN orders o ON c.idClient = o.idOrderClient;

-- Buscar pedidos confirmados de um cliente específico
SELECT * FROM orders 
WHERE orderStatus = 'Confirmado' AND idOrderClient = 1;


-- Calcular o valor total do pedido somando a taxa de envio
SELECT idOrder, (sendValue + 5) AS totalComTaxa 
FROM orders;

-- Ordenar produtos pela avaliação (maior para menor)
SELECT * FROM product 
ORDER BY avaliação DESC;

-- Média de avaliação dos produtos por categoria (apenas acima de 3)
SELECT Category, AVG(avaliação) AS media_avaliação
FROM product 
GROUP BY Category 
HAVING AVG(avaliação) > 3;

-- Buscar produtos e seus fornecedores
SELECT p.Pname, s.SocialName 
FROM product p
JOIN productSupplier ps ON p.idProduct = ps.idPsProduct
JOIN supplier s ON ps.idPsSupplier = s.idSupplier;



-- buscando o cliente pelo id = 1
SELECT * FROM clients WHERE idClient = 1; 

-- Buscando status do cliente
SELECT DISTINCT orderStatus FROM orders; 

SELECT * FROM orders 
WHERE LOWER(orderStatus) = 'confirmado' AND idOrderClient = 1;


-- Quantos pedidos foram feitos por cada cliente?
SELECT c.idClient, c.Fname, c.Lname, COUNT(o.idOrder) AS total_pedidos 
FROM clients c
LEFT JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY c.idClient, c.Fname, c.Lname;


-- Algum vendedor também é fornecedor
SELECT v.CNPJ, f.CNPJ 
FROM seller v, supplier f;




-- Relação de produtos, fornecedores e estoques
SELECT p.Pname, f.SocialName, ps.quantity, s.storageLocation, s.quantity 
FROM product p 
JOIN productSupplier ps ON p.idProduct = ps.idPsProduct
JOIN supplier f ON ps.idPsSupplier = f.idSupplier
JOIN storageLocation sl ON p.idProduct = sl.idLproduct
JOIN productStorage s ON sl.idLstorage = s.idProdStorage;


-- Relação de nomes dos fornecedores e nomes dos produtos
SELECT s.SocialName, p.Pname 
FROM supplier s
JOIN productSupplier ps ON s.idSupplier = ps.idPsSupplier 
JOIN product p ON ps.idPsProduct = p.idProduct;



-- Listar todos os pagamentos de um cliente específico (exemplo: ID 2)
SELECT 
    p.idPayment AS ID_Pagamento,
    p.typePayment AS Tipo_Pagamento,
    p.limiteAvailable AS Limite_Disponível
FROM payments p
WHERE p.idClient = 2;
