Dummy::Application.routes.draw do
  resources :foobars, :only => [:index]
end
