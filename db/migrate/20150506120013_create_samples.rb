#samplesテーブル作成処理に関するスクリプト
class CreateSamples < ActiveRecord::Migration
  #changeメソッドにて更新内容が記述される
  def change
    create_table :samples do |t|
      t.string :name
      t.integer :age
      t.string :mail
      t.string :tel
      
      #コードの作成や更新に関する日時の情報をレコードに自動記録する
      t.timestamps
    end
  end
end
