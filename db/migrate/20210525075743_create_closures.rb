class CreateClosures < ActiveRecord::Migration[5.2]
  def change
    create_table :closures do |t|
      t.references :ancestor,   foreign_key: { to_table: :comments }
      t.references :descendant, foreign_key: { to_table: :comments }

      t.timestamps
    end
  end
end
