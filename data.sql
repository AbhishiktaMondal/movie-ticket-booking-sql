
-- Movies
INSERT INTO movies (title, genre, duration, rating) VALUES
('Bhool Chuk Maaf', 'Comedy, Drama', 135, 8.8),
('Kesari Veer', 'Drama, History', 150, 9.0),
('Sitaare Zameen Par', 'Drama', 130, 8.4),
('Housefull 5', 'Comedy', 165, 8.2),
('Maalik', 'Action, Drama', 150, 8.9);


-- Theaters
INSERT INTO theaters (name, location) VALUES
('SVF Cinemas', 'Banachity, Durgapur'),
('Durgapur Cinema', 'City Centre, Durgapur'),
('Arti  Cinemas', 'Benachity, Durgapur'),
('INOX Burdwan Arcade', 'Big Bazaar, Burdwan'),
('Burdwan Cinema Hall', 'Khosbagan, Burdwan');


-- Screens
INSERT INTO screens (theater_id, screen_name) VALUES
(1, 'Screen 1'),
(2, 'Screen 2'),
(3, 'Screen A'),
(4, 'Screen A'),
(5, 'Screen 1');


-- Shows
INSERT INTO shows (movie_id, screen_id, show_date, show_time) VALUES
(1, 3, '2025-05-09', '12:00'),
(2, 5, '2025-05-16', '13:30'),
(3, 4, '2025-06-20', '15:00'),
(4, 1, '2025-06-06', '18:10'),
(5, 2, '2025-06-20', '14:00');


--Seats
DO $$
BEGIN
  FOR i IN 1..20 LOOP
    INSERT INTO seats (screen_id, seat_number) VALUES
    (1, 'A' || i),
    (2, 'B' || i),
    (3, 'C' || i),
    (4, 'D' || i),
	(5, 'E' || i);
  END LOOP;
END $$;


-- Customers
INSERT INTO customers (name, email, phone) VALUES
('Abhishikta Mondal', 'abhishikta@example.com', '9906554210'),
('Anupam Hui', 'anupam@example.com', '8972345099'),
('Pritul kr. Roy', 'pritul@example.com', '8972341902'),
('Prithish Roy', 'prithish@example.com', '9907662876'),
('Aditya Mukhaejee', 'aditya@example.com', '9720543102');


-- Booking
INSERT INTO bookings (customer_id, show_id, seat_id)
VALUES 
(1, 1, 53),
(2, 2, 33),
(3, 4, 43),
(4, 4, 48),
(5, 1, 58);
