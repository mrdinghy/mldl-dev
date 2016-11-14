 SELECT count(issues.id) AS vcount,
    issues.district_id, issues.structure_id
   FROM issues
  GROUP BY issues.district_id, issues.structure_id;