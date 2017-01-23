DROP TABLE IF EXISTS rates;

CREATE TABLE rates (
  id SERIAL4 PRIMARY KEY,
  rate_date VARCHAR(255),
  currency VARCHAR(255),
  rate DECIMAL
);