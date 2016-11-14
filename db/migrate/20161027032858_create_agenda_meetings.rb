class CreateAgendaMeetings < ActiveRecord::Migration
  def change
    create_view :agenda_meetings
  end
end
