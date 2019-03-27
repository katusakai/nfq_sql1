-- Pratybos 4 --

-- 1. Suskaičiuokite kiek knygų kiekvieno autoriaus yra duomenų bazėje (įtraukdami autorius, kurie neturi knygų, bei neįtraukdami šių autorių).

-- Visi autoriai:
SELECT authors.name, COUNT(books.bookId) FROM authors LEFT JOIN books ON authors.authorId = books.authorId GROUP BY authors.name;

-- Tik tie kurie turi knygas:
SELECT authors.name, COUNT(books.bookId) FROM authors INNER JOIN books ON authors.authorId = books.authorId GROUP BY authors.name;


-- 2. Pašalinkite autorius, kurie neturi knygų.
DELETE FROM authors WHERE authors.authorId IN (SELECT no_books.authorId FROM (SELECT authors.authorId, authors.name, COUNT(books.bookId) AS 'COUNTS' FROM authors LEFT JOIN books ON authors.authorId = books.authorId GROUP BY authors.name) AS no_books WHERE COUNTS = 0);


