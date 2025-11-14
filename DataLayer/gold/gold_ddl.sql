CREATE SCHEMA IF NOT EXISTS dw;

DROP TABLE IF EXISTS dw.ft_vendas;
DROP TABLE IF EXISTS dw.dim_cliente;
DROP TABLE IF EXISTS dw.dim_vendedor;
DROP TABLE IF EXISTS dw.dim_produto;
DROP TABLE IF EXISTS dw.dim_pagamento;
DROP TABLE IF EXISTS dw.dim_tempo;

CREATE TABLE IF NOT EXISTS dw.dim_tempo (
    sk_tempo INT PRIMARY KEY,
    data_completa DATE,
    nr_ano INT,
    nr_mes INT,
    nm_mes VARCHAR(20),
    nr_dia INT,
    nr_trimestre INT,
    nm_dia_semana VARCHAR(20),
    fl_fim_de_semana BOOLEAN
);

CREATE INDEX IF NOT EXISTS idx_dim_tempo_data ON dw.dim_tempo(data_completa);

CREATE TABLE IF NOT EXISTS dw.dim_cliente (
    sk_cliente SERIAL PRIMARY KEY,
    nk_id_cliente VARCHAR(32),
    nm_cidade VARCHAR(100),
    sg_estado CHAR(2)
);

CREATE INDEX IF NOT EXISTS idx_dim_cliente_nk ON dw.dim_cliente(nk_id_cliente);

CREATE TABLE IF NOT EXISTS dw.dim_vendedor (
    sk_vendedor SERIAL PRIMARY KEY,
    nk_id_vendedor VARCHAR(32),
    nm_cidade VARCHAR(100),
    sg_estado CHAR(2)
);

CREATE INDEX IF NOT EXISTS idx_dim_vendedor_nk ON dw.dim_vendedor(nk_id_vendedor);

CREATE TABLE IF NOT EXISTS dw.dim_produto (
    sk_produto SERIAL PRIMARY KEY,
    nk_id_produto VARCHAR(32),
    nm_categoria VARCHAR(100)
);

CREATE INDEX IF NOT EXISTS idx_dim_produto_nk ON dw.dim_produto(nk_id_produto);

CREATE TABLE IF NOT EXISTS dw.dim_pagamento (
    sk_pagamento SERIAL PRIMARY KEY,
    ds_tipo_pagamento VARCHAR(50),
    nr_parcelas INT
);

CREATE TABLE IF NOT EXISTS dw.ft_vendas (
    sk_venda BIGSERIAL PRIMARY KEY,
    sk_cliente INT REFERENCES dw.dim_cliente(sk_cliente),
    sk_vendedor INT REFERENCES dw.dim_vendedor(sk_vendedor),
    sk_produto INT REFERENCES dw.dim_produto(sk_produto),
    sk_tempo INT REFERENCES dw.dim_tempo(sk_tempo),
    sk_pagamento INT REFERENCES dw.dim_pagamento(sk_pagamento),
    nk_id_pedido VARCHAR(32),
    vlr_total NUMERIC(10,2),
    vlr_frete NUMERIC(10,2),
    vlr_item NUMERIC(10,2),
    qtd_dias_entrega INT,
    nota_avaliacao INT,
    fl_atraso BOOLEAN
);

CREATE INDEX IF NOT EXISTS idx_ft_vendas_cliente ON dw.ft_vendas(sk_cliente);
CREATE INDEX IF NOT EXISTS idx_ft_vendas_produto ON dw.ft_vendas(sk_produto);
CREATE INDEX IF NOT EXISTS idx_ft_vendas_tempo ON dw.ft_vendas(sk_tempo);