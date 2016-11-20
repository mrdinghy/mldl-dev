Rails.application.routes.draw do

  resources :dataentries
  resources :metrics
  resources :quarters
  resources :projects
  resources :agendas
  resources :userroles
  resources :actiontypes
  resources :mediators
  resources :mediations
  resources :participations
  resources :assignments
  resources :roles
  resources :scopes
  resources :memberships
  resources :userroles
  resources :people
  resources :actiontypes
  resources :issueactions
  resources :actions
  resources :communities
  resources :appissues do
    collection { post :uploadcsv }
  end
  resources :structuretypes
  resources :statuses
  resources :categories
  resources :issues

  resources :organizations
  resources :meetings
  resources :counties
  resources :structures
  resources :districts



  #resources :searches

  resources :site_images
  resources :site_documents

  devise_for :users
  resources :posts
  resources  :people_structures
  resources :comments, :path_prefix => '/:commentable_type/:commentable_id'

  get 'projectdashboard', :to => 'projects#dashboard', as: 'projectdashboard'
  get 'quarterlyreport', :to => 'projects#quarterlyreport', as: 'quarterlyreport'
  get 'structurereport', :to => 'projects#structurereport', as: 'structurereport'
  get 'projectlofa', :to => 'projects#lofa', as: 'projectlofa'
  get 'projectgrandgedeh', :to => 'projects#grandgedeh', as: 'projectgrandgedeh'
  get 'projectbong', :to => 'projects#bong', as: 'projectbong'
  get 'projectnimba', :to => 'projects#nimba', as: 'projectnimba'
  get 'managersmap', :to => 'structures#managersmap', as: 'managersmap'


  post 'addtoagenda', to: 'issuesactions#create_meetingagenda', as: 'addtoagenda'

  get 'resolution', to: 'issues#resolution', as: 'resolution'

  get 'publish', to: 'visitors#publish', as: 'publish'
  get 'moveup', to: 'sections#moveup', as: 'moveup'
  get 'movedown', to: 'sections#movedown', as: 'movedown'
  get 'staffguide', to: 'visitors#staff_guide', as: 'staffguide'
  get 'granteeguide', to: 'visitors#grantee_guide', as: 'granteeguide'
  get 'adminguide', to: 'visitors#admin_guide', as: 'adminguide'
  post 'addnote', to: 'issues#addnote', as: 'addnote'
  post 'addperson', to: 'structures#addperson', as: 'addperson'
  get 'adjustroles', to: 'users#adjustroles', as: 'adjustroles'
  get 'actionreport', to: 'visitors#actionreport', as: 'actionreport'
  get 'qtrreport', to: 'projects#qtrreport', as: 'qtrreport'
  get 'searchissues', to: 'issues#searchissues', as: 'searchissues'
  get 'issueresults', to: 'issues#searchresults', as: 'issueresults'

  get 'searchbyqtr', to: 'issues#searchbyqtr', as: 'searchbyqtr'
  get 'searchbyqtrresults', to: 'issues#searchbyqtrresults', as: 'searchbyqtrresults'
  get 'searchmeetings', to: 'meetings#searchmeetings', as: 'searchmeetings'
  get 'meetingresults', to: 'meetings#meetingresults', as: 'meetingresults'

  get 'newmldluser', to: 'users#newmldluser', as: 'newmldluser'
  get 'createuser', to: 'users#createuser', as: 'createuser'


  get 'resultaudit', to: 'projects#resultaudit', as: 'resultaudit'
  post 'adddisputant', to: 'issues#adddisputant', as: 'adddisputant'
  post 'addparticipant', to: 'meetings#addparticipant', as: 'addparticipant'
  post 'addmediator', to: 'mediations#addmediator', as: 'addmediator'
  post 'addmemember', to: 'structures#addmembership', as: 'addmember'
  post 'addmanager', to: 'structures#addmanager', as: 'addmanager'
  get 'seedpeeps', to: 'people#seedpeeps', as: 'seedpeeps'
  get 'seeder', to: 'issues#seeder', as: 'seeder'
  get '/tests2', :to => redirect('/tests2.html')
  root 'visitors#index'
  #get "counties/:county_id/districts", to: "application#districts", as: "districts", format: :json

  resources :users

end
