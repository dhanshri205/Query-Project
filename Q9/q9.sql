CREATE VIEW book_info AS
  SELECT b.book_id, b.title, IFNULL(r.revcnt, 0) AS revcnt, IFNULL(r.rating, 0.0) AS rating, IFNULL(r.rating23, 0.0) AS rating23, IFNULL(br.reqcnt, 0) AS reqcnt
  FROM books b
  LEFT JOIN(
    SELECT book_id, COUNT(*) AS revcnt, AVG(rating) AS rating, AVG(CASE WHEN strftime('%Y', rdate) = '2023' THEN rating ELSE NULL END) AS rating23
    FROM reviews
    GROUP BY book_id) r ON b.book_id = r.book_id
  LEFT JOIN (
    SELECT book_id, COUNT(*) AS reqcnt
    FROM (
      SELECT book_id, member
      FROM borrowings
      UNION ALL
      SELECT book_id, member
      FROM waitlists) AS combined
  GROUP BY book_id
  ) br ON b.book_id = br.book_id;
