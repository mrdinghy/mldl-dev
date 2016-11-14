 SELECT m.id,
    m.issue_id,
    m.mediate_start,
    m.mediate_end,
    m.result,
    m.mediation_notes,
    m.created_at,
    m.updated_at,
    i.structure_id
   FROM mediations m,
    issues i
  WHERE m.issue_id = i.id

