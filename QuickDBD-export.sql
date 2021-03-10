-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "key_sku" (
    "product_sku" VARCHAR(255)   NOT NULL,
    "stock_code" INT   NOT NULL,
    CONSTRAINT "pk_key_sku" PRIMARY KEY (
        "product_sku"
     )
);

CREATE TABLE "marketing_spend" (
    "date" DATE   NOT NULL,
    "offline_spend" INT   NOT NULL,
    "online_spend" DEC   NOT NULL,
    CONSTRAINT "pk_marketing_spend" PRIMARY KEY (
        "date"
     )
);

CREATE TABLE "online" (
    "transaction_id" INT   NOT NULL,
    "date" DATE   NOT NULL,
    "product_sku" VARCHAR(255)   NOT NULL,
    "product" VARCHAR(255)   NOT NULL,
    "product_category" VARCHAR(255)   NOT NULL,
    "quantity" INT   NOT NULL,
    "avg_price" DEC   NOT NULL,
    "revenue" DEC   NOT NULL,
    "tax" DEC   NOT NULL,
    "delivery_cost" DEC   NOT NULL
);

CREATE TABLE "retail" (
    "invoice_no" INT   NOT NULL,
    "invoice_date" DATE   NOT NULL,
    "stock_code" INT   NOT NULL,
    "quantity" INT   NOT NULL
);

ALTER TABLE "online" ADD CONSTRAINT "fk_online_date" FOREIGN KEY("date")
REFERENCES "marketing_spend" ("date");

ALTER TABLE "online" ADD CONSTRAINT "fk_online_product_sku" FOREIGN KEY("product_sku")
REFERENCES "key_sku" ("product_sku");

ALTER TABLE "retail" ADD CONSTRAINT "fk_retail_invoice_date" FOREIGN KEY("invoice_date")
REFERENCES "marketing_spend" ("date");

