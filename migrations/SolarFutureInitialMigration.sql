-- Create schema of the solar energy company
CREATE SCHEMA IF NOT EXISTS solar_future;

-- Create tables in schema
CREATE TABLE IF NOT EXISTS solar_future.clients (
    client_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL, -- email field for contact
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS solar_future.contracts (
    contract_id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES solar_future.clients(client_id), -- foreign key referencing the user it belongs
    start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN
);

CREATE TABLE IF NOT EXISTS solar_future.energy_readings (
    reading_id SERIAL PRIMARY KEY,
    contract_id INTEGER REFERENCES solar_future.contracts(contract_id), -- foreign key referencing the contract it belongs
    reading_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    kwh FLOAT
);

