# 📦 Banco de Dados - New E-commerce

## 🚀 Sobre o Projeto
Este repositório contém a modelagem e implementação de um banco de dados relacional para um sistema de **e-commerce**. Ele foi projetado para gerenciar clientes, produtos, pedidos, pagamentos, vendedores e fornecedores, garantindo integridade e eficiência na busca e armazenamento dos dados.

## 🛠 Tecnologias Utilizadas
- **MySQL** - Sistema de gerenciamento de banco de dados relacional (RDBMS)
- **SQL** - Linguagem de consulta estruturada para manipulação dos dados
- **Workbench** - Ferramenta para modelagem e execução de consultas

## 🔍 Estrutura e Consulta de Dados
O banco de dados foi modelado com chaves primárias, estrangeiras e constraints para manter a integridade dos dados. A busca pode ser realizada utilizando consultas SQL que envolvem:

- **Recuperações simples**: `SELECT * FROM clients;`
- **Filtros avançados**: `SELECT * FROM orders WHERE orderStatus = 'Confirmado';`
- **Junções entre tabelas**: `SELECT p.Pname, s.SocialName FROM product p JOIN productSupplier ps ON p.idProduct = ps.idPsProduct JOIN supplier s ON ps.idPsSupplier = s.idSupplier;`

## 🤝 Como Contribuir
1. **Faça um Fork** do repositório
2. **Clone o projeto**: `git clone https://github.com/seu-usuario/nome-do-repositorio.git`
3. **Crie uma branch** para sua funcionalidade: `git checkout -b minha-feature`
4. **Faça as alterações** e realize commits com mensagens claras
5. **Envie um Pull Request** para revisão

## 📄 Licença
Este projeto está sob a licença MIT. Sinta-se à vontade para utilizá-lo e aprimorá-lo!

---
💡 *Dúvidas ou sugestões? Entre em contato ou abra uma issue!* 
