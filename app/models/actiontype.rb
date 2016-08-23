
class Actiontype < EnumerateIt::Base
  associate_values created:1,agenda: 2, comment: 3, ongoing: 4,resolved: 5, escalated: 6, mediation: 7, cancelled: 8, onhold: 9, reopened: 10,
                   mediation_result_ongoing: 24, mediation_result_resolved: 25, mediation_result_escalated:26, mediation_result_cancelled: 28,
  meeting_result_ongoing: 34, meeting_result_resolved: 35, meeting_result_escalated: 36, meeting_result_mediation: 37, meeting_result_cancelled: 38
end
