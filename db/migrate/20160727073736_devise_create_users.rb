class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :avatar,             null: false, default: ""
      t.string :name,               null: false, default: ""
      t.string :email,              null: true, default: ""
      t.string :encrypted_password, null: false, default: ""

      t.timestamps null: false
    end

    add_index :users, :name,                 unique: true
  end
end
