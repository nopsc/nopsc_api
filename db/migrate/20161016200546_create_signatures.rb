class CreateSignatures < ActiveRecord::Migration[5.0]
  def change
    create_table :signatures do |t|
      t.string :zip
      t.string :name
      t.boolean :mail_opt_in
      t.string :email

      t.timestamps
    end
  end
end
