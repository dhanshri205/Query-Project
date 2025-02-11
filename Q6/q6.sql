SELECT b.book_id, b.title, COUNT(DISTINCT br.bid) AS wcount
FROM books b
LEFT JOIN borrowings br ON b.book_id = br.book_id
LEFT JOIN waitlists w ON b.book_id = w.book_id
WHERE b.pyear <= 2015
GROUP BY b.book_id, b.title
HAVING COUNT(distinct br.bid) >= 1
AND COUNT(DISTINCT br.bid) >= 2 * COUNT(DISTINCT w.wid);
