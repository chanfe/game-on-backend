class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

      t.string :name
      t.string :username
      t.string :password_digest
      t.boolean :first_ending
      t.boolean :second_ending
      t.boolean :secret_place
      t.boolean :secret_login
      t.boolean :max_score_v1
      t.boolean :max_score_v2

      t.timestamps
    end
  end
end
