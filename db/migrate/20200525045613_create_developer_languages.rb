class CreateDeveloperLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :developer_languages do |t|
      t.integer :language_id
      t.integer :developer_id
      t.timestamps
    end
  end
end
