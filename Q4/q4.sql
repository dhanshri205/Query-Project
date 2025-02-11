SELECT b.book_id, b.title, b.author, count(borrowings.book_id) as bcount, max(borrowings.start_date) as rdate
FROM books b
LEFT OUTER JOIN borrowings on b.book_id = borrowings.book_id
WHERE b.pyear > 2001
GROUP BY b.book_id, b.title, b.author;
