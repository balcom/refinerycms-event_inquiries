Refinery::Application.routes.draw do
  get '/contact', :to => 'event_inquiries#new', :as => 'new_event_enquiry'
  resources :contact,
            :only => :create,
            :as => :event_inquiries,
            :controller => 'event_inquiries' do
    collection do
      get :thank_you
    end
  end

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :event_inquiries, :only => [:index, :show, :destroy] do
      collection do
        get :spam
      end
      member do
        get :toggle_spam
      end
    end
    resources :event_enquiry_settings, :only => [:edit, :update]
  end
end
