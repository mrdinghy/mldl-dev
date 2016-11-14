 SELECT count(issues.id) AS vcount,
    issues.structure_id
   FROM issues
  GROUP BY issues.structure_id;