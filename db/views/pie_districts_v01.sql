 SELECT count(issues.id) AS vcount,
    issues.district_id
   FROM issues
  GROUP BY issues.district_id;