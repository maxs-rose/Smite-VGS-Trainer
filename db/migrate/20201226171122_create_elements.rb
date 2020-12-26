class CreateElements < ActiveRecord::Migration[6.0]
  def change
    create_table :elements do |t|
      t.string :combo
      t.boolean :final
      t.string :value

      t.timestamps
    end

    add_index :elements, :combo
  end
end
