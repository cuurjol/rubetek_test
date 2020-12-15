Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user, ->(u) { u.role == 'employee' || u.role == 'dweller' } do
      root 'water_meter_readings#index'
    end

    authenticated :user, ->(u) { u.role == 'admin' } do
      root 'admin#index'
    end

    unauthenticated do
      root 'devise/sessions#new'
    end
  end

  resources :water_meter_readings, except: :show do
    collection do
      get 'last_month_report', constraints: { format: :xlsx }
    end
  end

  resources :users, except: %i[index create] do
    collection do
      get 'debtors_report', constraints: { format: :xlsx }
    end
  end

  scope :admin_panel do
    get 'index', to: 'admin#index'
    post 'create_user', to: 'users#create'
  end
end
