Rails.application.routes.draw do


  resources :inventories
  resources :items
  resources :approvals
  resources :loans
  resources :employees
  resources :adjustment_jobs
  resources :additional_jobs
  resources :areas
  resources :master_jobs
  resources :material_types
  resources :units
  resources :sub_work_categories
  resources :work_categories
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'home#index'
  get 'master/index', to: "master#index"
  resources :change_passwords, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end
  resources :roles
  resources :users
  resources :data_companies
  resources :categories
  resources :contacts
  resources :work_units

  resources :helper_json do
    post :getJudulPekerjaan, on: :collection
    post :getNamaPekerjaan, on: :collection
    post :updateSatker, on: :collection
    post :simpanSatker, on: :collection
    get :getDetailSatker, on: :collection
    get :getAllSatker, on: :collection
    post :simpanKaryawan, on: :collection
    post :updateKaryawan, on: :collection
    get :getDetailKaryawan, on: :collection
    post :hapusKaryawan, on: :collection
    get :approve, on: :collection
    get :reject, on: :collection
    get :done, on: :collection
    get :getDetailPeminjaman, on: :collection
    post :searchDataDashboard, on: :collection
    get :getDetailItem, on: :collection
    post :simpanItem, on: :collection
    post :updateItem, on: :collection
    get :getDetailInventory, on: :collection
    post :simpanInventory, on: :collection
    post :updateInventory, on: :collection
    get :getAllItem, on: :collection
    get :hapusSatker, on: :collection
    get :checkInventory, on: :collection
    get :deleteFile, on: :collection
    post :activationUser, on: :collection
    member do
      get "/sub_work_category", to: "helper_json#getSubWorkCategory"
    end
  end

  namespace :transaksi do
    scope :divisions do
      get 'detail' => 'divisions#detail'
      post 'create' => 'divisions#create'
      put 'update' => 'divisions#update'
      delete 'delete' => 'divisions#delete'
    end

    scope :departments do
      get 'detail' => 'departments#detail'
      get 'divisions' => 'departments#divisions'
      post 'create' => 'departments#create'
      put 'update' => 'departments#update'
      delete 'delete' => 'departments#delete'
    end

    scope :disiplines do
      get 'detail' => 'disiplines#detail'
      get 'divisions' => 'disiplines#divisions'
      get 'departments' => 'disiplines#departments'
      post 'create' => 'disiplines#create'
      put 'update' => 'disiplines#update'
      delete 'delete' => 'disiplines#delete'
    end

    scope :positions do
      get 'detail' => 'positions#detail'
      get 'disiplines' => 'positions#disiplines'
      post 'create' => 'positions#create'
      put 'update' => 'positions#update'
      delete 'delete' => 'positions#delete'
    end
  end
  
  # resources :categories do
  #   resources :contacts, only: [:index], module: :categories
  # end
  # resources :type_workers

end
