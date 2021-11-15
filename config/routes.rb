Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items,only: [:index,:new,:create,:show,:edit,:update]
end

ローカルリポジトリ(PC)
master                                                              master ver2
    topic brach                        topic brach ver2
    ①ブランチを切ってPublish Branch   ②コードを編集してコミット


リモートリポジトリ(GitHub)
master                                              master ver2
    topic brach