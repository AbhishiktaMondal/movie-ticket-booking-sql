-- View all movies
SELECT * FROM movies;


-- All shows for a movie
SELECT sh.show_id, t.name AS theater, s.screen_name, sh.show_date, sh.show_time
FROM shows sh
JOIN movies m ON sh.movie_id = m.movie_id
JOIN screens s ON sh.screen_id = s.screen_id
JOIN theaters t ON s.theater_id = t.theater_id
WHERE m.title = 'Bhool Chuk Maaf';


-- View all avilable seats for a show
SELECT se.seat_id, se.seat_number
FROM seats se
JOIN screens sc ON se.screen_id = sc.screen_id
JOIN shows sh ON sc.screen_id = sh.screen_id
WHERE sh.show_id = 1 -- replace with your show_id
AND se.seat_id NOT IN (
    SELECT seat_id FROM bookings WHERE show_id = 1
);


-- View all bookings
SELECT b.booking_id, m.title, t.name AS theater, s.screen_name, se.seat_number, sh.show_date, sh.show_time
FROM bookings b
JOIN customers c ON b.customer_id = c.customer_id
JOIN shows sh ON b.show_id = sh.show_id
JOIN movies m ON sh.movie_id = m.movie_id
JOIN screens s ON sh.screen_id = s.screen_id
JOIN theaters t ON s.theater_id = t.theater_id
JOIN seats se ON b.seat_id = se.seat_id
WHERE c.name = 'Abhishikta Mondal';


-- Total bookings for a show
SELECT COUNT(*) AS total_bookings
FROM bookings
WHERE show_id = 1;



-- Search movie by genre
SELECT * FROM movies
WHERE genre ILIKE '%action%';
