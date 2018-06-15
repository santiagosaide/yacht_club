class ChangeFamilyIdDefaultValueInMembers < ActiveRecord::Migration[5.0]
  def change
    change_column_default :members, :family_id, 'lalaland'
  end
end
