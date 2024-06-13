CREATE DATABASE social_media;

\c social_media

CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    profile_picture TEXT,
    biography TEXT,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Posts (
    post_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    content TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Comments (
    comment_id SERIAL PRIMARY KEY,
    post_id INT REFERENCES Posts(post_id),
    user_id INT REFERENCES Users(user_id),
    content TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Friendships (
    friendship_id SERIAL PRIMARY KEY,
    user_id_1 INT REFERENCES Users(user_id),
    user_id_2 INT REFERENCES Users(user_id),
    status VARCHAR(20) DEFAULT 'pending',
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Likes (
    like_id SERIAL PRIMARY KEY,
    post_id INT REFERENCES Posts(post_id),
    user_id INT REFERENCES Users(user_id),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO Users (username, email, password, profile_picture, biography, registration_date) VALUES
('john_doe', 'john@example.com', 'hashed_password1', 'path/to/pic1.jpg', 'Hello world!', '2024-01-01 10:00:00'),
('jane_smith', 'jane@example.com', 'hashed_password2', 'path/to/pic2.jpg', 'Loving life!', '2024-01-02 10:00:00'),
('sam_brown', 'sam@example.com', 'hashed_password3', 'path/to/pic3.jpg', 'Coder by day, gamer by night.', '2024-01-03 10:00:00'),
('lisa_jones', 'lisa@example.com', 'hashed_password4', 'path/to/pic4.jpg', 'Love to travel.', '2024-01-04 10:00:00'),
('paul_white', 'paul@example.com', 'hashed_password5', 'path/to/pic5.jpg', 'Foodie.', '2024-01-05 10:00:00'),
('karen_davis', 'karen@example.com', 'hashed_password6', 'path/to/pic6.jpg', 'Fitness enthusiast.', '2024-01-06 10:00:00'),
('mike_taylor', 'mike@example.com', 'hashed_password7', 'path/to/pic7.jpg', 'Tech lover.', '2024-01-07 10:00:00'),
('anna_martin', 'anna@example.com', 'hashed_password8', 'path/to/pic8.jpg', 'Bookworm.', '2024-01-08 10:00:00'),
('bob_lee', 'bob@example.com', 'hashed_password9', 'path/to/pic9.jpg', 'Outdoor adventurer.', '2024-01-09 10:00:00'),
('susan_clark', 'susan@example.com', 'hashed_password10', 'path/to/pic10.jpg', 'Music fanatic.', '2024-01-10 10:00:00'),
('tim_evans', 'tim@example.com', 'hashed_password11', 'path/to/pic11.jpg', 'Movie buff.', '2024-01-11 10:00:00'),
('nancy_walker', 'nancy@example.com', 'hashed_password12', 'path/to/pic12.jpg', 'Nature lover.', '2024-01-12 10:00:00'),
('steve_hall', 'steve@example.com', 'hashed_password13', 'path/to/pic13.jpg', 'Tech entrepreneur.', '2024-01-13 10:00:00'),
('carol_adams', 'carol@example.com', 'hashed_password14', 'path/to/pic14.jpg', 'Artist.', '2024-01-14 10:00:00'),
('eric_allen', 'eric@example.com', 'hashed_password15', 'path/to/pic15.jpg', 'Sports fan.', '2024-01-15 10:00:00'),
('rachel_perez', 'rachel@example.com', 'hashed_password16', 'path/to/pic16.jpg', 'Photographer.', '2024-01-16 10:00:00'),
('daniel_king', 'daniel@example.com', 'hashed_password17', 'path/to/pic17.jpg', 'History buff.', '2024-01-17 10:00:00'),
('laura_wright', 'laura@example.com', 'hashed_password18', 'path/to/pic18.jpg', 'Fashionista.', '2024-01-18 10:00:00'),
('kevin_scott', 'kevin@example.com', 'hashed_password19', 'path/to/pic19.jpg', 'Traveler.', '2024-01-19 10:00:00'),
('amy_green', 'amy@example.com', 'hashed_password20', 'path/to/pic20.jpg', 'Chef.', '2024-01-20 10:00:00');

INSERT INTO Posts (user_id, content, timestamp) VALUES
(1, 'This is my first post!', '2024-01-01 12:00:00'),
(2, 'Hello everyone, excited to be here!', '2024-01-02 12:00:00'),
(3, 'Coding is life!', '2024-01-03 12:00:00'),
(4, 'Just visited an amazing place!', '2024-01-04 12:00:00'),
(5, 'Check out my latest recipe!', '2024-01-05 12:00:00'),
(6, 'Workout routine update.', '2024-01-06 12:00:00'),
(7, 'New gadget review!', '2024-01-07 12:00:00'),
(8, 'Favorite book this month.', '2024-01-08 12:00:00'),
(9, 'Hiking adventures!', '2024-01-09 12:00:00'),
(10, 'Top songs on my playlist.', '2024-01-10 12:00:00'),
(11, 'Must-watch movies.', '2024-01-11 12:00:00'),
(12, 'Bird watching in the park.', '2024-01-12 12:00:00'),
(13, 'Starting a new tech project!', '2024-01-13 12:00:00'),
(14, 'My latest painting.', '2024-01-14 12:00:00'),
(15, 'Thoughts on the big game.', '2024-01-15 12:00:00'),
(16, 'Captured a beautiful moment.', '2024-01-16 12:00:00'),
(17, 'Historical facts you didn’t know.', '2024-01-17 12:00:00'),
(18, 'Fashion trends I love.', '2024-01-18 12:00:00'),
(19, 'Travel tips for new explorers.', '2024-01-19 12:00:00'),
(20, 'Cooking tips for beginners.', '2024-01-20 12:00:00');

INSERT INTO Comments (post_id, user_id, content, timestamp) VALUES
(1, 2, 'Nice post!', '2024-01-01 13:00:00'),
(2, 1, 'Welcome!', '2024-01-02 13:00:00'),
(3, 4, 'Great insights.', '2024-01-03 13:00:00'),
(4, 3, 'Beautiful place!', '2024-01-04 13:00:00'),
(5, 6, 'Yummy!', '2024-01-05 13:00:00'),
(6, 5, 'Very helpful!', '2024-01-06 13:00:00'),
(7, 8, 'Interesting review.', '2024-01-07 13:00:00'),
(8, 7, 'Adding this to my list.', '2024-01-08 13:00:00'),
(9, 10, 'Looks fun!', '2024-01-09 13:00:00'),
(10, 9, 'Great playlist!', '2024-01-10 13:00:00'),
(11, 12, 'Must watch!', '2024-01-11 13:00:00'),
(12, 11, 'Nature is amazing.', '2024-01-12 13:00:00'),
(13, 14, 'Good luck!', '2024-01-13 13:00:00'),
(14, 13, 'Lovely art.', '2024-01-14 13:00:00'),
(15, 16, 'Go team!', '2024-01-15 13:00:00'),
(16, 15, 'Beautiful capture.', '2024-01-16 13:00:00'),
(17, 18, 'Interesting facts.', '2024-01-17 13:00:00'),
(18, 17, 'Love it!', '2024-01-18 13:00:00'),
(19, 20, 'Great tips!', '2024-01-19 13:00:00'),
(20, 19, 'Delicious!', '2024-01-20 13:00:00');

INSERT INTO Friendships (user_id_1, user_id_2, status, timestamp) VALUES
(1, 2, 'accepted', '2024-01-01 14:00:00'),
(3, 4, 'accepted', '2024-01-02 14:00:00'),
(5, 6, 'accepted', '2024-01-03 14:00:00'),
(7, 8, 'accepted', '2024-01-04 14:00:00'),
(9, 10, 'accepted', '2024-01-05 14:00:00'),
(11, 12, 'accepted', '2024-01-06 14:00:00'),
(13, 14, 'accepted', '2024-01-07 14:00:00'),
(15, 16, 'accepted', '2024-01-08 14:00:00'),
(17, 18, 'accepted', '2024-01-09 14:00:00'),
(19, 20, 'accepted', '2024-01-10 14:00:00'),
(1, 3, 'accepted', '2024-01-11 14:00:00'),
(2, 4, 'accepted', '2024-01-12 14:00:00'),
(5, 7, 'accepted', '2024-01-13 14:00:00'),
(6, 8, 'accepted', '2024-01-14 14:00:00'),
(9, 11, 'accepted', '2024-01-15 14:00:00'),
(10, 12, 'accepted', '2024-01-16 14:00:00'),
(13, 15, 'accepted', '2024-01-17 14:00:00'),
(14, 16, 'accepted', '2024-01-18 14:00:00'),
(17, 19, 'accepted', '2024-01-19 14:00:00'),
(18, 20, 'accepted', '2024-01-20 14:00:00');

INSERT INTO Likes (post_id, user_id, timestamp) VALUES
(1, 2, '2024-01-01 15:00:00'),
(2, 1, '2024-01-02 15:00:00'),
(3, 4, '2024-01-03 15:00:00'),
(4, 3, '2024-01-04 15:00:00'),
(5, 6, '2024-01-05 15:00:00'),
(6, 5, '2024-01-06 15:00:00'),
(7, 8, '2024-01-07 15:00:00'),
(8, 7, '2024-01-08 15:00:00'),
(9, 10, '2024-01-09 15:00:00'),
(10, 9, '2024-01-10 15:00:00'),
(11, 12, '2024-01-11 15:00:00'),
(12, 11, '2024-01-12 15:00:00'),
(13, 14, '2024-01-13 15:00:00'),
(14, 13, '2024-01-14 15:00:00'),
(15, 16, '2024-01-15 15:00:00'),
(16, 15, '2024-01-16 15:00:00'),
(17, 18, '2024-01-17 15:00:00'),
(18, 17, '2024-01-18 15:00:00'),
(19, 20, '2024-01-19 15:00:00'),
(20, 19, '2024-01-20 15:00:00');
