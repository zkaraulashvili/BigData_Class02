CREATE TABLE public.payments (
    payment_id BIGSERIAL PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    amount NUMERIC(12,2) NOT NULL,
    status TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE USER dbz WITH PASSWORD 'dbz';

ALTER USER dbz WITH REPLICATION;

GRANT CONNECT ON DATABASE sourcedb TO dbz;
GRANT USAGE ON SCHEMA public TO dbz;
GRANT SELECT ON TABLE public.payments TO dbz;

CREATE PUBLICATION pub_exam
FOR TABLE public.payments;

CREATE SCHEMA debezium_info;

CREATE TABLE debezium_info.heartbeat (
    id SERIAL PRIMARY KEY,
    date_load TIMESTAMPTZ DEFAULT NOW()
);

GRANT USAGE ON SCHEMA debezium_info TO dbz;
GRANT INSERT, SELECT ON TABLE debezium_info.heartbeat TO dbz;
GRANT USAGE, SELECT ON SEQUENCE debezium_info.heartbeat_id_seq TO dbz;

