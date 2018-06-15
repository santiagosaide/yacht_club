Rails.application.routes.draw do
  # Routes for the Owner resource:
  # CREATE
  get "/owners/new", :controller => "owners", :action => "new"
  post "/create_owner", :controller => "owners", :action => "create"

  # READ
  get "/owners", :controller => "owners", :action => "index"
  get "/owners/:id", :controller => "owners", :action => "show"

  # UPDATE
  get "/owners/:id/edit", :controller => "owners", :action => "edit"
  post "/update_owner/:id", :controller => "owners", :action => "update"

  # DELETE
  get "/delete_owner/:id", :controller => "owners", :action => "destroy"
  #------------------------------

  # Routes for the Docking_space resource:
  # CREATE
  get "/docking_spaces/new", :controller => "docking_spaces", :action => "new"
  post "/create_docking_space", :controller => "docking_spaces", :action => "create"

  # READ
  get "/docking_spaces", :controller => "docking_spaces", :action => "index"
  get "/docking_spaces/:id", :controller => "docking_spaces", :action => "show"

  # UPDATE
  get "/docking_spaces/:id/edit", :controller => "docking_spaces", :action => "edit"
  post "/update_docking_space/:id", :controller => "docking_spaces", :action => "update"

  # DELETE
  get "/delete_docking_space/:id", :controller => "docking_spaces", :action => "destroy"
  #------------------------------

  # Routes for the Vessel resource:
  # CREATE
  get "/vessels/new", :controller => "vessels", :action => "new"
  post "/create_vessel", :controller => "vessels", :action => "create"

  # READ
  get "/vessels", :controller => "vessels", :action => "index"
  get "/vessels/:id", :controller => "vessels", :action => "show"

  # UPDATE
  get "/vessels/:id/edit", :controller => "vessels", :action => "edit"
  post "/update_vessel/:id", :controller => "vessels", :action => "update"

  # DELETE
  get "/delete_vessel/:id", :controller => "vessels", :action => "destroy"
  #------------------------------

  devise_for :members
  # Routes for the Member resource:
  # READ
  get "/members", :controller => "members", :action => "index"
  get "/members/:id", :controller => "members", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
