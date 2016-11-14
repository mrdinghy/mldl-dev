 SELECT count(issues.id) AS vcount,
    issues.category_id
   FROM issues
  GROUP BY issues.category_id;