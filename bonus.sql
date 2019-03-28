---------------------BONUS----
--1.Straipsniai saugomi lentelėje News (newsId, text, date), straipsnio komentarai saugomi lentelėje Comments (commentId, text, date, newsId). Išrinkite 10 naujausių straipsnių su paskutiniu parašytu komentaru (newsId, newsDate, newsText, commentDate, commentText ).

CREATE TABLE News (newsId int(11) NOT NULL AUTO_INCREMENT, text TEXT(255) NOT NULL, date datetime DEFAULT NULL, PRIMARY KEY(newsId)) DEFAULT CHARSET=utf8;
CREATE TABLE Comments (commentId int(11) NOT NULL AUTO_INCREMENT, text varchar(255) NOT NULL, date datetime NOT NULL,
 newsId int(11) NOT NULL, PRIMARY KEY(commentId)) DEFAULT CHARSET=utf8;
 
--Reikia pridėti dummy data. Tai bus galutinėje duomenų bazės versijoje. DATABASE FOR BONUS.sql faile
 
--2. Išrinkite 10 naujausių straipsnių su paskutiniu parašytu komentaru (newsId, newsDate, newsText, commentDate, commentText ).

SELECT news.newsId, SUBSTRING(news.text,1,30) AS newsText, news.date AS newsDate, SUBSTRING(comments.text,1,30) AS commentText, comments.date AS commentDate FROM news LEFT JOIN comments ON news.newsId = comments.newsId GROUP BY news.date DESC LIMIT 10;

