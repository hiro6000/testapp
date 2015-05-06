#シード＝あらかじめテーブルに生成しておくことができる
#モデルクラスのcreateメソッドを呼び出し。引数は(カラム１:値, カラム2:値, ...)と記述
Sample.create(
  name:"hiorya",
  age:25,
  mail:"hiro@gmail.com",
  tel:"090-9999-9999")