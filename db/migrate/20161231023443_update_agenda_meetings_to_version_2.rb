class UpdateAgendaMeetingsToVersion2 < ActiveRecord::Migration
  def change
    update_view :agenda_meetings, version: 2, revert_to_version: 1
  end
end
