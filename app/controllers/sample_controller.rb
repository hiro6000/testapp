#明示的に文字コードを指定
#coding: utf-8
class SampleController < ApplicationController
  #使用するレイアウトテンプレートを指定
  layout "mylayout" 
  #home画面となるindexアクション
    def index
    #クライアントのフォームから入力されたPOST送信を受け取るメソッド
    #reqest = クライアントがアクセスしてきたリクエストの情報をまとめたインスタンス
    #post?(get?) = POST(GET)によるアクセスならtrue,　そうでなければfalseを返す
    #フォームで入力された情報はすべてparamsというハッシュ型の変数にまとめられている
    if request.post? then
      obj = Sample.new(
      :name => params['name'],
      :age => params['age'].to_i,
      :mail => params['mail'],
      :tel => params['tel']
      )
      obj.save
    end
    
    #ローカル変数をコントローラーで作成し、レイアウトテンプレートに引き渡す
    @title = "ここは夢の国です"
    #Sampleモデルから全レコードの情報を取り出し、@datasに代入
    @datas = Sample.all
    #ローカル変数を引数として渡し、レンダリング
    render :layout => "mylayout", :locals => {:title => @title, :datas => @datas}
  end
  #レコードの中身を表示するshowアクション
  def show
    @title = "ID" + params[:id] + "の中身を見せるよ"
    #findメソッドを利用して指定したid番号のレコードを検索して取り出す。
    #取り出されたオブジェクトはモデルクラスのインスタンスとして取得される。
    @result = Sample.find(params[:id])
  end
  #レコードの中身を更新するupdateアクション
  def update
    #モデルクラスのfindメソッドよりクエリ文字列として受けとったidからレコードの中身を検索。
    @result = Sample.find(params[:id])
    if request.post? then
      @result.name = params['name']
      @result.age = params['age'].to_i
      @result.mail = params['mail']
      @result.tel = params['tel']
      @result.save
      redirect_to :action => "index"
    else
      @title = "更新画面"
    end
  end
  
  #レコードの中身を検索するfindアクション
  def find
    @title = "レコードを検索"
    @datas = [] #検索前は初期化
    if request.post? then
      #ダイナミックファインダーメソッドを使って送信された文字列を含むレコードを検索
      # @datas = Sample.find_all_by_name(params[:fstr])
      arr = params[:fstr].split(',') #split = 引数として渡された文字で分割する
      @datas = Sample.find_all_by_name(arr)
    end
  end
  #レコードの中身を消すdeleteアクション
  def delete
    obj = Sample.find(params[:id])
    #レコードの中身を削除するモデルクラスのdestroyメソッド
    obj.destroy
    redirect_to :action => "index"
  end
end




#Timeクラスのnowメソッドを使用してTimeクラスのインスタンスを生成
# time = Time.now
#      #timeクラスのstrftimeメソッド（引数として渡したフォーマット用のテキストを使って日時をフォーマットしたテキストを返す)の結果をインスタンス変数に保存。
# @str = time.strftime("現在の時刻は %Y年 %m月 %d日 %H時 %M分 だよ！！")

#リダイレクト時に必要なパラメータを渡す処理
# def helo
#     #リダイレクトメソッドに引数として移動先のアクション名、パラメータを渡す
#     # redirect_to :action => "index", :params => {'msg' => 'redirect now!'}
#     #こっちが正しい記述。参考書のやつは間違っていた
#     redirect_to :action => "index", 'msg' => "redirect now!"
# end
#レコードを削除するメソッド