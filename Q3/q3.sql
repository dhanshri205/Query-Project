SELECT b.bid, b.member
FROM borrowings b
WHERE julianday(b.end_date) - julianday(b.start_date) > 14
and b.book_id NOT IN(
  SELECT w.book_id 
  FROM waitlists w
  WHERE w.priority >= 5);
