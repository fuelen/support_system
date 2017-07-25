Rails.application.routes.draw do
  scope module: :customer do
    root to: 'tickets#new'
    resources :tickets, only: %i[create show], param: :reference
  end
end
