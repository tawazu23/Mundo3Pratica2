use Loja;
GO

CREATE TABLE [Pessoa] (
    idPessoa integer NOT NULL IDENTITY,
    nome varchar(255) NOT NULL,
    logradouro varchar(255) NOT NULL,
    cidade varchar(255) NOT NULL,
    estado char(2) NOT NULL,
    telefone varchar(14) NOT NULL,
    email varchar(255) NOT NULL,
    CONSTRAINT [PK_PESSOA] PRIMARY KEY CLUSTERED ([idPessoa] ASC)
)
GO


CREATE TABLE [Pessoa_Fisica] (
    idPessoa integer NOT NULL,
    cpf varchar(11) NOT NULL,
    CONSTRAINT [PK_PESSOA_FISICA] PRIMARY KEY CLUSTERED ([idPessoa] ASC),
    CONSTRAINT [FK_PESSOA_FISICA_PESSOA] FOREIGN KEY ([idPessoa]) REFERENCES [Pessoa] ([idPessoa])
    ON UPDATE CASCADE
    ON DELETE CASCADE
)
GO


CREATE TABLE [Pessoa_Juridica] (
    idPessoa integer NOT NULL,
    cnpj varchar(14) NOT NULL,
    CONSTRAINT [PK_PESSOA_JURIDICA] PRIMARY KEY CLUSTERED ([idPessoa] ASC),
    CONSTRAINT [FK_PESSOA_JURIDICA_PESSOA] FOREIGN KEY ([idPessoa]) REFERENCES [Pessoa] ([idPessoa])
    ON UPDATE CASCADE
    ON DELETE CASCADE
)
GO

CREATE TABLE [Usuario] (
    idUsuario integer NOT NULL IDENTITY,
    login varchar(20) NOT NULL,
    senha varchar(20) NOT NULL,
    CONSTRAINT [PK_USUARIO] PRIMARY KEY CLUSTERED ([idUsuario] ASC)
)
GO

CREATE TABLE [Produto] (
    idProduto integer NOT NULL IDENTITY,
    nome varchar(255) NOT NULL,
    quantidade integer NOT NULL,
    preco_Venda numeric NOT NULL,
    CONSTRAINT [PK_PRODUTO] PRIMARY KEY CLUSTERED ([idProduto] ASC)
)
GO

CREATE TABLE [Movimento] (
    idMovimento integer NOT NULL IDENTITY,
    idPessoa integer NOT NULL,
    idProduto integer NOT NULL,
    idUsuario integer NOT NULL,
    quantidade integer NOT NULL,
    tipo char(1) NOT NULL,
    valor_unitario numeric NOT NULL,
    CONSTRAINT [PK_MOVIMENTO] PRIMARY KEY CLUSTERED ([idMovimento] ASC)
)
GO

ALTER TABLE [Movimento] WITH CHECK ADD CONSTRAINT [Movimento_fk0] FOREIGN KEY ([idPessoa])
REFERENCES [Pessoa] ([idPessoa])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Movimento] CHECK CONSTRAINT [Movimento_fk0]
GO

ALTER TABLE [Movimento] WITH CHECK ADD CONSTRAINT [Movimento_fk1] FOREIGN KEY ([idProduto])
REFERENCES [Produto] ([idProduto])
ON UPDATE CASCADE
GO
ALTER TABLE [Movimento] CHECK CONSTRAINT [Movimento_fk1]
GO

ALTER TABLE [Movimento] WITH CHECK ADD CONSTRAINT [Movimento_fk2] FOREIGN KEY ([idUsuario])
REFERENCES [Usuario] ([idUsuario])
ON UPDATE CASCADE
GO
ALTER TABLE [Movimento] CHECK CONSTRAINT [Movimento_fk2]
GO