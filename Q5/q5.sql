SELECT b.book_id, b.title, AVG(reviews.rating) AS raverage
FROM books b
JOIN reviews ON b.book_id = reviews.book_id
GROUP BY b.book_id, b.title
HAVING COUNT(reviews.rid) >= 2
ORDER BY raverage DESC
LIMIT 3;
