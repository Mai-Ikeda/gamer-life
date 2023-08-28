Rails.application.routes.draw do
  devise_for :admin, controllers:{
    sessions:"admin/sessions"
  }

  devise_for :customers,controllers:{
    registrations:"public/registrations",
    sessions:'public/sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do
    root 'homes#top'

    get 'homes/about' => 'homes#about', as: 'about'
    #get 'customers/mypage' => 'customers#show', as: 'mypage'
    #get 'customers/information/edit' => 'customers#edit', as: 'edit_information'
    #patch 'customers/information' => 'customers#update', as: 'update_information'
    get 'customers/withdraw' => 'customers#withdraw', as: 'confirm_withdraw'
    patch 'customers/out' => 'customers#out', as: 'out_customer'
    get '/search', to: 'searches#search'
    get 'shearch/result' => 'searches#result'
    

    resources :customers, only:[:index,:show,:edit,:update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    
    resources :impressions do
      resources :comments, only:[:create,:edit,:update,:destroy]
      collection do
        get "confirm"
      end
    end


  end

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'

    resources :impressions, only:[:index,:show,:destroy] do
      resources :comments, only:[:create,:edit,:update,:destroy]
    end
    
    resources :customers, only:[:index,:show,:edit,:update,:destroy]
    resources :genres, only:[:new,:create,:index,:edit,:update,:destroy]

  end


end
