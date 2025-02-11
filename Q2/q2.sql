SELECT b.bid, b.member, b.end_date
FROM borrowings b, books bk, members m
WHERE m.email = b.member and bk.book_id = b.book_id
and (bk.author = 'John' or bk.author = 'Marry')
AND m.faculty = 'CS';
