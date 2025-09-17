CREATE TABLE airport (
    airport_id SERIAL PRIMARY KEY,
    airport_name VARCHAR(100),
    country VARCHAR(50),
    state VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE airline (
    airline_id SERIAL PRIMARY KEY,
    airline_code VARCHAR(10),
    name VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE flight (
    flight_id SERIAL PRIMARY KEY,
    airline_id INT REFERENCES airline(airline_id),
    departure_airport_id INT REFERENCES airport(airport_id),
    arrival_airport_id INT REFERENCES airport(airport_id),
    departing_gate VARCHAR(10),
    arriving_gate VARCHAR(10),
    scheduled_departure TIMESTAMP,
    scheduled_arrival TIMESTAMP,
    actual_departure TIMESTAMP,
    actual_arrival TIMESTAMP
);

CREATE TABLE passenger (
    passenger_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    date_of_birth DATE,
    country_of_citizenship VARCHAR(50),
    country_of_residence VARCHAR(50),
    passport_number VARCHAR(20)
);

CREATE TABLE booking (
    booking_id SERIAL PRIMARY KEY,
    flight_id INT REFERENCES flight(flight_id),
    passenger_id INT REFERENCES passenger(passenger_id),
    status VARCHAR(20),
    booking_platform VARCHAR(50),
    ticket_price NUMERIC(10,2)
);

CREATE TABLE booking_changes (
    change_id SERIAL PRIMARY KEY,
    booking_id INT REFERENCES booking(booking_id),
    change_details TEXT
);

CREATE TABLE boarding_pass (
    boarding_pass_id SERIAL PRIMARY KEY,
    booking_id INT REFERENCES booking(booking_id),
    seat VARCHAR(10),
    boarding_time TIMESTAMP
);

CREATE TABLE baggage (
    baggage_id SERIAL PRIMARY KEY,
    booking_id INT REFERENCES booking(booking_id),
    weight_kg NUMERIC(5,2)
);

CREATE TABLE baggage_check (
    baggage_check_id SERIAL PRIMARY KEY,
    baggage_id INT REFERENCES baggage(baggage_id),
    passenger_id INT REFERENCES passenger(passenger_id),
    check_results TEXT
);

CREATE TABLE security_check (
    security_check_id SERIAL PRIMARY KEY,
    passenger_id INT REFERENCES passenger(passenger_id),
    check_results TEXT
);
