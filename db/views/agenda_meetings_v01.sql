 SELECT a.id,
    a.meeting_id,
    a.issue_id,
    a.agenda_note,
    a.result,
    a.addressed,
    a.created_at,
    a.updated_at,
    m.structure_id,
    m.meeting_held
   FROM agendas a,
    meetings m
  WHERE a.meeting_id = m.id