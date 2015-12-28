class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :cpf, null: false, default: ''
      t.string :phone, null: false, default: ''
      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''
      t.boolean :active, default: false
      t.string :email, null: false, default: ''
      t.string :password_digest, null: false, default: ''

      t.timestamps null: false
    end
    add_index :clients, :email, unique: true
    add_index :clients, :cpf, unique: true
  end
end
