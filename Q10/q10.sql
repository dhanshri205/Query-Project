SELECT DISTINCT
    m.email
FROM
    borrowings b
JOIN
    members m ON b.member = m.email
LEFT JOIN
    book_info bi ON b.book_id = bi.book_id
WHERE
    bi.rating > 3.5
    AND bi.reqcnt > (SELECT AVG(reqcnt) FROM book_info)
    AND NOT EXISTS (
        SELECT 1
        FROM
            borrowings nb
            LEFT JOIN book_info nbi ON nb.book_id = nbi.book_id
        WHERE
            nb.member = b.member
            AND (nbi.rating IS NULL OR nbi.rating <= 3.5)
    );
