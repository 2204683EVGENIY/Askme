Rails.application.routes.draw do
  put '/questions/:id/hide', to: 'questions#hide'
  resources :questions
end
