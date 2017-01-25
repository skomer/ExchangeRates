DROP TABLE IF EXISTS rate_records;

CREATE TABLE rate_records (
  id SERIAL4 PRIMARY KEY,
  rate_date VARCHAR(255),
  currency VARCHAR(255),
  rate DECIMAL,
  CONSTRAINT rate_record_unique UNIQUE (rate_date, currency, rate)
);