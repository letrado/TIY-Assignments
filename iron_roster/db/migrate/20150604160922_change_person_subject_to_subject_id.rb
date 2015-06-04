class ChangePersonSubjectToSubjectId < ActiveRecord::Migration

  def change
  	change_column :people, :subject, :integer
  	rename_column :people, :subject, :subject_id
  end
end
