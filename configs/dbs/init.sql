CREATE SCHEMA datasets;
CREATE TABLE datasets.filters (id SERIAL PRIMARY KEY, user_id text NOT NULL, dataset_id text NOT NULL, data jsonb, data_timestamp timestamp);