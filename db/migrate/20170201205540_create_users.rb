class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :name
      t.string :image
      t.string :token
      t.string :username
      t.timestamps
    end
  end
end
