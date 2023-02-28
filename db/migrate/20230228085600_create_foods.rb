class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :food_name
      t.integer :kcal
      t.float :water
      t.float :protein
      t.float :lipid
      t.float :fibre
      t.float :carbohydrate
      t.float :Na
      t.float :Ca
      t.float :Mg
      t.float :Fe
      t.float :vitaminC
      t.float :salt

      t.timestamps
    end
  end
end
