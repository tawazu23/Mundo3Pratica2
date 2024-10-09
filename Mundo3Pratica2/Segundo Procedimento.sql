INSERT INTO Usuario (login, senha)
VALUES 
('op1', 'op1'), 
('op2', 'op2');

INSERT INTO Produto (nome, quantidade, preco_Venda)
VALUES 
('Banana', 100, 5.00),
('Laranja', 500, 2.00),
('Manga', 800, 4.00);

INSERT INTO Pessoa (nome, logradouro, cidade, estado, telefone, email)
VALUES
('Joao', 'Rua 12, casa 3, Quitanda', 'Riacho Sul', 'PA', '1111-1111', 'joao@riacho.com'),
('JJC', 'Rua 11, Centro', 'Riacho do Norte', 'PA', '1212-1212', 'jjc@riacho.com');

INSERT INTO Pessoa_Fisica (idPessoa, cpf)
VALUES 
(7, '11111111111');

INSERT INTO Pessoa_Juridica (idPessoa, cnpj)
VALUES 
(15, '22222222222222');

INSERT INTO Movimento (idUsuario, idPessoa, idProduto, quantidade, tipo, valor_unitario)
VALUES 
(1, 7, 1, 20, 'S', 4.00), 
(1, 7, 3, 15, 'S', 2.00),
(2, 7, 3, 10, 'S', 3.00),
(1, 15, 3, 15, 'E', 5.00),
(1, 15, 4, 20, 'E', 4.00);