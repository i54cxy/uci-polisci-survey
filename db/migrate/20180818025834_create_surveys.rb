class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
