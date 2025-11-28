WITH RECURSIVE paths AS (
  SELECT source AS src, target AS tgt
  FROM PageLinks
  WHERE source = 'home'
  
  UNION
  
  SELECT p.tgt AS src, pl.target AS tgt
  FROM paths p
  JOIN PageLinks pl ON p.tgt = pl.source
)
SELECT DISTINCT tgt AS reachable_page
FROM paths
WHERE tgt ~* '(ref|polic)'
ORDER BY reachable_page;