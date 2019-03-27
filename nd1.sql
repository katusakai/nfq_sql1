-- Pratybos 1 --

-- 1. Išrinkite visus įrašus iš Knygų lentelės
SELECT books.* FROM books;

-- 2. Išrinkite tik Knygų pavadinimus abėcėles tvarka.
SELECT books.title FROM books ORDER BY title ASC;

-- 3. Suskaičiuokite, kiek knygų kiekvieno autoriaus yra knygų lentelėje

SELECT books.authorId, COUNT(books.bookId) FROM books GROUP BY books.authorId;

