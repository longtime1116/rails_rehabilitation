class CreateCreators < ActiveRecord::Migration[5.2]
  def change
    create_table :creators do |t|
      t.references :user, foreign_key: true
      t.string :pen_name

      t.timestamps
    end
  end
end
