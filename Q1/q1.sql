SELECT DISTINCT m.name, m.email
FROM members m, borrowings b, waitlists w
WHERE m.email = b.member
AND m.email = w.member
AND b.book_id = w.book_id;
