 SELECT b.member, COUNT(p.bid), COUNT(CASE WHEN p.paid_amount >= p.amount THEN p.bid END), 
   IFNULL(SUM(CASE WHEN p.paid_amount >= p.amount THEN p.paid_amount ELSE 0 END), 0)
FROM borrowings b, penalties p
WHERE p.bid = b.bid
GROUP BY b.member;
