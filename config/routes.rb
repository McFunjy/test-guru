# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, controllers: { sessions: 'sessions' }, path: :gurus,
                     path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member
  end

  resources :passed_tests, only: %i[show update] do
    get :result, on: :member
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
