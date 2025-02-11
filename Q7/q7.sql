SELECT book_id, title, pyear
FROM (
  SELECT b.book_id, b.title, b.pyear, rank() over (ORDER BY COUNT(*) DESC) AS rank
  FROM borrowings bor
  JOIN books b ON bor.book_id = b.book_id
  GROUP BY b.book_id, b.title, b.pyear)
AS rankedBooks
WHERE rank <= 3;
