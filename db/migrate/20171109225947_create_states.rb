class CreateStates < ActiveRecord::Migration[5.1]
  def change
    create_table :states, id: :uuid do |t|
      t.string :name
      t.string :acronym

      t.timestamps
    end
  end
end
