-- Pratybos 7 --

--Papildyti duomenų bazę kad būtų galima:

-- 1. Knygos gali turėti vieną ir daugiau autorių.

CREATE TABLE book_author (bookAuthorId int(11) NOT NULL AUTO_INCREMENT, authorId int(11) NOT NULL, bookId int(11) NOT NULL, PRIMARY KEY (bookAuthorId) ) DEFAULT CHARSET=UTF8;

-- 2. Sutvarkyti duomenų bazės duomenis, jei reikia papildykite naujais.
INSERT INTO book_author (bookId, authorId) SELECT books.bookId, books.authorId FROM books INNER JOIN authors ON authors.authorId = books.authorId;
UPDATE books, book_author SET books.authorId = book_author.Id WHERE books.authorId = book_author.authorId;
ALTER TABLE books CHANGE authorID bookAuthorId int(11);

-- 3. Išrinkite visas knygas su jų autoriais. (autorius, jei jų daugiau nei vienas atskirkite kableliais)
INSERT INTO book_author (authorId, bookId) VALUES(2, 1),(4,3);   -- Keli papildomi įrašai, kad atsirastų bendri autoriai prie knygų

SELECT books.title, books.year, GROUP_CONCAT(authors.name) AS authors_list FROM books LEFT JOIN book_author ON books.bookId = book_author.bookId LEFT JOIN authors ON authors.authorId = book_author.authorId GROUP BY books.title, books.year;

-- 4. Sutvarkykite  knygų lentelę, kad galėtumėte išsaugoti originalų knygos pavadinimą. (Pavadinime išsaugokite, lietuviškas raides kaip ą,ė,š ir pan.)

ALTER TABLE books DEFAULT CHARSET=utf8;
ALTER TABLE books MODIFY title varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;


INSERT INTO books (title, year) VALUES ('Jie grįžta per pilnatį. Žiauriai šiurpi istorija apie tris draugus, kiną, burtus ir pasimetusį karalių', 2015);
