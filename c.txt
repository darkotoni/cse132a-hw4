SELECT DISTINCT p.pname, comment AS matching_comment
FROM Product p
JOIN Review r ON p.pid = r.pid
CROSS JOIN LATERAL unnest(r.comments) AS comment
WHERE p.category = 'electronics'
  AND comment ~* '(defect|broken)'
ORDER BY p.pname, matching_comment;