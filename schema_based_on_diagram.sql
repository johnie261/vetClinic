CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20),
    date_of_birth DATE,    
);

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR,
);

CREATE TABLE invocies (
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    paid_at TIMESTAMP,
    medical_history_id INT,
);

CREATE TABLE treatment (
    id SERIAL PRIMARY KEY,
    type VARCHAR,
    name VARCHAR,
);

CREATE TABLE invocie_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
);

CREATE TABLE medical_treatment (
    medical_history_id INT,
    treatment_id INT,
);
