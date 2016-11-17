Rails.application.routes.draw do
  root 'pags#index'

  get 'pags/index'

  get 'pags/form'

  post 'pags/form_post'

end
