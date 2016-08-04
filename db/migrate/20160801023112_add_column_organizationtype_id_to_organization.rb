class AddColumnOrganizationtypeIdToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :organizationtype_id, :integer
  end
end
