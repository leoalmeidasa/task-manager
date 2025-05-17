class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :subdomain, null: false
      t.string :name
      t.timestamps
    end
    add_index :accounts, :subdomain, unique: true
  end
end