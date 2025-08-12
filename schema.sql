-- 1. Movies Table
CREATE TABLE movies (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    duration INTEGER, -- in minutes
    rating DECIMAL(2,1)
);

-- 2. Theaters Table
CREATE TABLE theaters (
    theater_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

-- 3. Screens Table (Each theater has multiple screens)
CREATE TABLE screens (
    screen_id SERIAL PRIMARY KEY,
    theater_id INT REFERENCES theaters(theater_id),
    screen_name VARCHAR(50)
);

-- 4. Shows Table (Different show timings for movies)
CREATE TABLE shows (
    show_id SERIAL PRIMARY KEY,
    movie_id INT REFERENCES movies(movie_id),
    screen_id INT REFERENCES screens(screen_id),
    show_date DATE,
    show_time TIME
);

-- 5. Seats Table (Available seats in each screen)
CREATE TABLE seats (
    seat_id SERIAL PRIMARY KEY,
    screen_id INT REFERENCES screens(screen_id),
    seat_number VARCHAR(10)
);

-- 6. Customers Table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

-- 7. Bookings Table (Which customer booked which seat for which show)
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    show_id INT REFERENCES shows(show_id),
    seat_id INT REFERENCES seats(seat_id),
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);