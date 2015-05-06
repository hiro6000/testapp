#明示的に文字コードを指定
#coding: utf-8



class SampleController < ApplicationController
  #使用するレイアウトテンプレートを指定
  layout "mylayout"
  
  #home画面となるindexアクション
  def index
    # #インスタンス変数をコントローラーで作成し、レイアウトテンプレートに引き渡す
    # @title = "ここは夢の国です"

    #クエリー文字列から値を取り出す処理
    #クエリー文字列　＝　アドレスに各種の情報を付け加えることでサーバーに値を送信できるようにするもの。以下のように表記
    #http://ドメイン/ページのアドレス?キー=値&キー＝値&.....
    if params['msg'] == nil then #msgパラメータの値があるかチェック
      @msg = "パラメータはありません"
    else
      @msg = "パラメータ:" + params['msg']
    end

    #Timeクラスのnowメソッドを使用してTimeクラスのインスタンスを生成
    time = Time.now
         #timeクラスのstrftimeメソッド（引数として渡したフォーマット用のテキストを使って日時をフォーマットしたテキストを返す)の結果をインスタンス変数に保存。           
    @str = time.strftime("現在の時刻は %Y年 %m月 %d日 %H時 %M分 だよ！！")
    #クライアントのフォームから入力されたPOST送信を受け取るメソッド
    #reqest = クライアントがアクセスしてきたリクエストの情報をまとめたインスタンス
    #post?(get?) = POST(GET)によるアクセスならtrue,　そうでなければfalseを返す
    #フォームで入力された情報はすべてparamsというハッシュ型の変数にまとめられている
    if request.post? then
      @msg = "あなたのコメント:" + params['text1']
    else
      @msg = "コメントを入力してね"
    end
    
    #ローカル変数をコントローラーで作成し、レイアウトテンプレートに引き渡す
    title = "ここは夢の国です"
    # 単純な値でなく、いくつもの情報をまとめた「オブジェクト」として値を渡す(各データはハッシュとしてまとめてある)
    datas = [
      {:name => "Taro", :tel => "03-5555-4444", :mail => "taro@com"},
      {:name => "mika", :tel => "070-4444-3333", :mail => "mika@gmail.com"},
      {:name => "kenji", :tel => "080-5555-9999", :mail => "kenji@jp"}
    ]
    #Sampleモデルから全レコードの情報を取り出し、@dataに代入
    @datas = Sample.all
    #ローカル変数を引数として渡し、レンダリング
    render :layout => "mylayout", :locals => {:title => title, :datas => datas}
  end


    #リダイレクト時に必要なパラメータを渡す処理
  def helo
      #リダイレクトメソッドに引数として移動先のアクション名、パラメータを渡す
      # redirect_to :action => "index", :params => {'msg' => 'redirect now!'}
      #こっちが正しい記述。参考書のやつは間違っていた
      redirect_to :action => "index", 'msg' => "redirect now!"
      
  end
end




#ApplicationControllerというクラスを継承したSampleControllerというクラスを定義してある。
#その中にアクション（クラスの中のメソッド)が定義されている
#RailsではApplicationControllerクラスw詠唱して、そこにメソッドを作ればコントローラーとして機能するようになっている。
# class SampleController < ApplicationController
#   #indexメソッド
#
#   def index
#     # #コントローラ-からビューを使わずに独自にテキストを表示させてみる
#     msg = '<html><body><h1>HiroのHPへようこそ！</h1><p>ここが入り口だよ！</p><a href="/sample/entrance">idobata入り口</a></body></html>'
#     # #画面表示を行う
#     # #renderは :textに設定されているテキストをレンダリング（その中に記述されているスクリプトなどを実行して最終的に表示される内容を作り出すこと)し、 クライアント（このページを呼び出しているWEBブラウザ)に送り返す働きをする。
#     #ここでは:textというキーに指定の値を設定して渡している。renderの引数としてハッシュのキー(:text)に変数msgを設定して渡している。
#     render :text => msg
#   end
#
#   #indexアクションからリンク経由で移動した先のアクション
#   def entrance
#     #msg = "<html><body><h1>ようこそ夢の国へ！</h1><p>これはまだ建設中です</p></body></html>"
#     #引数としてmsgを:textというキーでハッシュに代入し、レンダリングして表示
#     #render :text => msg
#
#     #リダイレクト（ブラウザにページ移動のための命令を送り、指定のアドレスにジャンプさせる)処理
#     #redirect_to :action => "index"
#     #entranceアクションにアクセスしてきたらgoogleのHPにリダイレクトさせる
#
#     #redirect_to "http://google.com"
#     #idobataにリダイレクトさせる場合
#     redirect_to "https://idobata.io/#/organization/yochiyochirb/room/meetups"
#    end
#
#
# end














