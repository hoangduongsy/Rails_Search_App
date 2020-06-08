class CreateDeveloperProgrammingLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :developer_programming_languages do |t|
      t.integer :developer_id
      t.integer :programming_language_id
      t.timestamps
    end
  end
end
