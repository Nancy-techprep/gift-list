class ElvesController < ApplicationController

  
  def index
  

    render({ :template => "elves/index.html.erb" })
  end
end 
