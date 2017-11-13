class AddFleetToStudents < ActiveRecord::Migration[5.1]
  def change
    change_table :students do |t|
      t.references :fleet, foreign_key: true, type: :uuid
    end
  end
end
