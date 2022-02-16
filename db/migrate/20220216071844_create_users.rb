class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      # rails g model User name:string email:stringで生成された
      t.string :name
      t.string :email

      t.timestamps # created_at, updated_at を作成する
    end
  end
end
