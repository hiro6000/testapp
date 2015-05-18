Testapp::Application.routes.draw do
   #以下にルーティング(どのアドレスにアクセスしたらどれを呼び出すかを整理したもの)の設定が記述されている。
   #ルート情報の記述方法
   #get "コントローラー名/アクション名"
   #post "コントローラー名/アクション名"
   #match "コントローラ名/アクション名"
   #アドレスの指定とは別のアクションに誘導する場合
   #match "アドレスの指定" => "コントローラー名/アクション名"
   
  #"sample/index"というアドレスにgetでアクセスする。
  #GET = HTTPのプロトコル。サーバーからデータを受け取るのに用いられる。 <=> PUT = フォーム送信などのようにサーバーにデータを送るのに用いる。
  #新しく作成したアクションへのルーティング情報を記述
  get "sample/index"
  #レコードの中身を表示するshowアクション
  get "sample/show"
  #レコードの中身を更新するupdateアクション
  get "sample/update"
  post "sample/update"
  #レコードを検索するfindアクション
  get "sample/find"
  post "sample/find"
  #POST送信でindexにアクセスする許可を追記　
  post "sample/index"
  #レコードを削除するdeleteアクション
  get "sample/delete"
  
  #add
  get "sample/toppage"
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
