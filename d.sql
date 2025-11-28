WITH RECURSIVE Subtopics AS (
  SELECT tid, tname, parent_tid
  FROM Topic
  WHERE tname = 'Support'
  
  UNION
  
  SELECT t.tid, t.tname, t.parent_tid
  FROM Topic t
  JOIN Subtopics s ON t.parent_tid = s.tid
)
SELECT DISTINCT st.tname, msg
FROM Subtopics st
JOIN Discussion d ON st.tid = d.tid
CROSS JOIN LATERAL unnest(d.messages) AS msg
WHERE msg ~* '(refund|return)'
ORDER BY st.tname, msg;