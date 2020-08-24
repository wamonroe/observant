Rails.application.routes.draw do
  resources :page_monitors do
    post 'preview', on: :new
  end

  root to: 'page_monitors#index'
end
