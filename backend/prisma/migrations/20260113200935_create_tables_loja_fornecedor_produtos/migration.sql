-- CreateTable
CREATE TABLE "fornecedor" (
    "idFornecedor" SERIAL NOT NULL,
    "cnpjcpf" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "endereco" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "tipoFornecimento" TEXT NOT NULL,
    "prazoEntrega" INTEGER NOT NULL,
    "email" TEXT NOT NULL,

    CONSTRAINT "fornecedor_pkey" PRIMARY KEY ("idFornecedor")
);

-- CreateTable
CREATE TABLE "produto" (
    "idProduto" SERIAL NOT NULL,
    "descricao" TEXT NOT NULL,
    "preco" DOUBLE PRECISION NOT NULL,
    "dataEntrada" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dataSaida" TIMESTAMP(3),
    "foto" TEXT,
    "setorPreparo" TEXT NOT NULL,
    "disponivel" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "produto_pkey" PRIMARY KEY ("idProduto")
);

-- CreateTable
CREATE TABLE "produtoAlimento" (
    "idProdAli" INTEGER NOT NULL,
    "peso" DOUBLE PRECISION NOT NULL,
    "ingredientes" TEXT NOT NULL,
    "dataValidade" TIMESTAMP(3) NOT NULL,
    "classAlimentar" TEXT NOT NULL,
    "quantPorEmba" INTEGER NOT NULL,

    CONSTRAINT "produtoAlimento_pkey" PRIMARY KEY ("idProdAli")
);

-- CreateTable
CREATE TABLE "produtoBebida" (
    "idProdBeb" INTEGER NOT NULL,
    "volume" DOUBLE PRECISION NOT NULL,
    "calorias" INTEGER NOT NULL,
    "GelOuQuente" TEXT NOT NULL,
    "acucar" BOOLEAN NOT NULL,
    "lactose" BOOLEAN NOT NULL,
    "ingredientes" TEXT NOT NULL,

    CONSTRAINT "produtoBebida_pkey" PRIMARY KEY ("idProdBeb")
);

-- CreateTable
CREATE TABLE "produtoCafe" (
    "idProdCafe" INTEGER NOT NULL,
    "tipoMoagem" TEXT NOT NULL,
    "tipoTorra" TEXT NOT NULL,
    "acidez" TEXT NOT NULL,
    "origem" TEXT NOT NULL,
    "tamEmbalagem" INTEGER NOT NULL,
    "tipoGrao" TEXT NOT NULL,

    CONSTRAINT "produtoCafe_pkey" PRIMARY KEY ("idProdCafe")
);

-- CreateTable
CREATE TABLE "loja" (
    "idLoja" SERIAL NOT NULL,
    "cnpj" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "endereco" TEXT NOT NULL,

    CONSTRAINT "loja_pkey" PRIMARY KEY ("idLoja")
);

-- CreateIndex
CREATE UNIQUE INDEX "fornecedor_cnpjcpf_key" ON "fornecedor"("cnpjcpf");

-- CreateIndex
CREATE UNIQUE INDEX "fornecedor_email_key" ON "fornecedor"("email");

-- CreateIndex
CREATE UNIQUE INDEX "loja_cnpj_key" ON "loja"("cnpj");

-- AddForeignKey
ALTER TABLE "produtoAlimento" ADD CONSTRAINT "produtoAlimento_idProdAli_fkey" FOREIGN KEY ("idProdAli") REFERENCES "produto"("idProduto") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "produtoBebida" ADD CONSTRAINT "produtoBebida_idProdBeb_fkey" FOREIGN KEY ("idProdBeb") REFERENCES "produto"("idProduto") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "produtoCafe" ADD CONSTRAINT "produtoCafe_idProdCafe_fkey" FOREIGN KEY ("idProdCafe") REFERENCES "produto"("idProduto") ON DELETE RESTRICT ON UPDATE CASCADE;
