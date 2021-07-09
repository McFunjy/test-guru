# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  get :signup, to: 'users#new'
  get :signin, to: 'sessions#new'
  delete :signout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member
  end

  resources :passed_tests, only: %i[show update] do
    get :result, on: :member
  end
end
