Rails.application.routes.draw do
  root to: "application#root"

  # Routes for the Gift resource:

  # CREATE
  post("/insert_gift", { :controller => "gifts", :action => "create" })
          
  # READ
  get("/gifts", { :controller => "gifts", :action => "index" })
  
  get("/gifts/:path_id", { :controller => "gifts", :action => "show" })
  
  # UPDATE
  
  post("/modify_gift/:path_id", { :controller => "gifts", :action => "update" })
  
  # DELETE
  get("/delete_gift/:path_id", { :controller => "gifts", :action => "destroy" })

  #------------------------------

  # Routes for the Occasion resource:

  # CREATE
  post("/insert_occasion", { :controller => "occasions", :action => "create" })
          
  # READ
  get("/occasions", { :controller => "occasions", :action => "index" })
  
  get("/occasions/:path_id", { :controller => "occasions", :action => "show" })
  
  # UPDATE
  
  post("/modify_occasion/:path_id", { :controller => "occasions", :action => "update" })
  
  # DELETE
  get("/delete_occasion/:path_id", { :controller => "occasions", :action => "destroy" })

  #------------------------------

  # Routes for the Loved one resource:

  # CREATE
  post("/insert_loved_one", { :controller => "loved_ones", :action => "create" })
          
  # READ
  get("/loved_ones", { :controller => "loved_ones", :action => "index" })
  
  get("/loved_ones/:path_id", { :controller => "loved_ones", :action => "show" })
  
  # UPDATE
  
  post("/modify_loved_one/:path_id", { :controller => "loved_ones", :action => "update" })
  
  # DELETE
  get("/delete_loved_one/:path_id", { :controller => "loved_ones", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
