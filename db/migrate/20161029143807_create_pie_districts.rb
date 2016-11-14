class CreatePieDistricts < ActiveRecord::Migration
  def change
    create_view :pie_districts
  end
end
