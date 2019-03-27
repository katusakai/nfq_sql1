-- Pratybos 2 --

-- 1. Papildykite autorių lentelę 2 įrašais; 
INSERT INTO authors (authors.name) VALUES ('Tadas Janca'),('Linas Kukulskis');
--ARBA:
INSERT INTO authors SET authors.name = 'Tadas Janca';
INSERT INTO authors SET authors.name = 'Linas Kukulskis';


-- 2. Papildykite knygų lentelę, 3 įrašais apie knygas, kurių autorius įrašėte prieš tai.
INSERT INTO books SET authorID = 8, title = 'SQL home work', year = 2019;
INSERT INTO books SET authorID = 8, title = 'PHP home work', year = 2019;
INSERT INTO books SET authorID = 9, title = 'Grades for homework', year = 2019;

-- 3. Pakeiskite vienos knygos autorių į kitą.
UPDATE books SET books.authorId = 9 WHERE books.bookId = 8;

