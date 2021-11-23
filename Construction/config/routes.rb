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

    # HomesController関連
    root to: "homes#top"
    # /HomesController関連

    # ItemsController関連
    resources :items
    # /ItemsController関連

    # GenresController関連
    resources :genres, except: [:new, :show, :destroy]
    # /GenresController関連

  end
  #/adminのrouting


   # publicのrouting
  namespace :public do

    # HomesController関連
    get  "/about" => "homes#about"
    # /HomesController関連

    # ItemsController関連
    resources :items
    get 'public/items/animation' => "items#animation"
    get 'public/items/real' => "items#real"
    # /ItemsController関連

    # questionsController関連
    resources :questions
    get 'public/questions/technology' => "questions#technology"
    get 'public/questions/other' => "questions#other"
    # /questionsController関連

    # answersController関連
    resources :answers
    # answersController関連


    # calendarscontroller関連
    resources :calendars
    # calendarscontroller関連
  end
end
