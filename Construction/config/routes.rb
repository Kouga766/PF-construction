Rails.application.routes.draw do

# devise
    devise_for :admins, controllers: {
      registrations: 'admin/registrations',
      sessions:      'admin/sessions',
    }

    devise_for :customers, controllers: {
      registrations: 'public/registrations',
      sessions:      'public/sessions',
    }
# /devise

root to: 'public/homes#top'

  # adminのrouting
  namespace :admin do

    # adminログイン後遷移先
    root to: "items#index"
    # /adminログイン後遷移先

    # ItemsController関連
    resources :items, onry: [:index, :new, :create, :show, :edit, :update, :destroy]
    # /ItemsController関連

    # GenresController関連
    resources :genres, except: [:new, :show, :destroy]
    # /GenresController関連

     # CustomersController関連
    resources :customers, except: [:new, :create, :destroy]
    # /CustomersController関連
  end
  #/adminのrouting


   # publicのrouting
  namespace :public do

    # HomesController関連
    root to: "homes#top"
    get  "/about" => "homes#about"
    # /HomesController関連

    # ItemsController関連
    resources :items do
      resources :reviews
    end
    get 'public/items/animation' => "items#animation"
    get 'public/items/real' => "items#real"
    # /ItemsController関連

    # questionsController関連
    resources :questions do
      resources :answers
    end
    get 'public/questions/technology' => "questions#technology"
    get 'public/questions/other' => "questions#other"
    # /questionsController関連


    # calendarscontroller関連
    resources :calendars
    # calendarscontroller関連

    # CustomersController関連
    resource :customers, only: [:show, :edit, :update]
    get   "customers/cancel"   => "customers#cancel",   as: "customer_cancel"
    patch "customers/cancel"   => "customers#withdraw", as: "customer_withdraw"
    # /CustomersController関連

  end
end
