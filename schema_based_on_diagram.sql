CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    date_of_birth DATE  
);

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at TIMESTAMP,
    status VARCHAR(50),
    patient_id INT REFERENCES patients(id)
);

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    paid_at TIMESTAMP,
    medical_histories_id INT REFERENCES medical_histories(id)
);

CREATE TABLE treatment (
    id SERIAL PRIMARY KEY,
    type VARCHAR(50),
    name VARCHAR(50)
);

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoices_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatment(id)
);

CREATE TABLE medical_history_treatment (
    medical_histories_id INT,
    treatment_id INT,
    PRIMARY KEY (medical_histories_id, treatment_id),
    FOREIGN KEY (medical_histories_id) REFERENCES medical_histories (id),
    FOREIGN KEY (treatment_id) REFERENCES treatment (id)
);
