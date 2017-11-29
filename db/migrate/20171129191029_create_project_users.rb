class CreateProjectUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :project_users, id: :uuid do |t|
      t.references :project, foreign_key: true, type: :uuid, index: true
      t.references :user, foreign_key: true, type: :uuid, index: true

      t.timestamps
    end
  end
end
