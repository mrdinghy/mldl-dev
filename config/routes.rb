Rails.application.routes.draw do

  resources :infopopups
  resources :metrics
  resources :quarters
  resources :projects
  resources :agendas
  resources :userroles
  resources :actiontypes
  resources :mediators
  resources :mediations
  resources :participations
  resources :managers
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

  post 'addnote', to: 'issues#addnote', as: 'addnote'
  post 'addperson', to: 'structures#addperson', as: 'addperson'
  get 'adjustroles', to: 'users#adjustroles', as: 'adjustroles'
  get 'actionreport', to: 'visitors#actionreport', as: 'actionreport'
  get 'qtrreport', to: 'projects#qtrreport', as: 'qtrreport'
  get 'searchissues', to: 'issues#searchissues', as: 'searchissues'
  get 'issueresults', to: 'issues#searchresults', as: 'issueresults'
  get 'fixissue', to: 'appissues#fixissues', as: 'fixissues'

  get 'searchbyqtr', to: 'issues#searchbyqtr', as: 'searchbyqtr'
  get 'searchbyqtrresults', to: 'issues#searchbyqtrresults', as: 'searchbyqtrresults'
  get 'searchmeetings', to: 'meetings#searchmeetings', as: 'searchmeetings'
  get 'meetingresults', to: 'meetings#meetingresults', as: 'meetingresults'
  get 'monthlyreport', to: 'projects#monthlyreport', as: 'monthlyreport'
  get 'monthlyresults', to: 'projects#monthlyresults', as: 'monthlyresults'
  get 'countyadminreport', to: 'projects#countyadminreport', as: 'countyadminreport'
  get 'countyadminresults', to: 'projects#countyadminresults', as: 'countyadminresults'

  get 'newmldluser', to: 'users#newmldluser', as: 'newmldluser'
  post 'createuser', to: 'users#createuser', as: 'createuser'
  get 'deletemanager', to: 'structures#deletemanager', as: 'deletemanager'
  get 'deletemediator', to: 'mediations#deletemediator', as: 'deletemediator'
  get 'deletemembership', to: 'structures#deletemembership', as: 'deletemembership'
  get 'deleteparticipation', to: 'meetings#deleteparticipation', as: 'deleteparticipation'
  get 'deletedisputant', to: 'issues#deletedisputant', as: 'deletedisputant'
  get 'deletecommitteemember', to: 'issues#deletecommitteemember', as: 'deletecommitteemember'

  get 'meettemplate', to: 'meetings#blankmeeting', as: 'meettemplate'
  get 'othercategories', to: 'projects#othercategories', as: 'othercategories'
  get 'resultaudit', to: 'projects#resultaudit', as: 'resultaudit'
  post 'adddisputant', to: 'issues#adddisputant', as: 'adddisputant'
  post 'addcommitteemember', to: 'issues#addcommitteemember', as: 'addcommitteemember'
  post 'addparticipant', to: 'meetings#addparticipant', as: 'addparticipant'
  post 'addmediator', to: 'mediations#addmediator', as: 'addmediator'
  post 'addmemember', to: 'structures#addmembership', as: 'addmember'
  post 'addmanager', to: 'structures#addmanager', as: 'addmanager'
  get 'seedpeeps', to: 'people#seedpeeps', as: 'seedpeeps'
  get 'seeder', to: 'issues#seeder', as: 'seeder'
  get 'clearsteve', to: 'projects#clearsteve', as: 'clearsteve'
  get '/tests2', :to => redirect('/tests2.html')
  root 'visitors#index'
  #get "counties/:county_id/districts", to: "application#districts", as: "districts", format: :json

  resources :users

end
