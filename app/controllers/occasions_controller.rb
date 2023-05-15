class OccasionsController < ApplicationController
  before_action(:force_user_sign_in)

  def index
    matching_occasions = Occasion.all

    @list_of_occasions = matching_occasions.where({ :user_id => @current_user.id }) #.order({ :username => :desc })

    render({ :template => "occasions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_occasions = Occasion.where({ :id => the_id })

    @the_occasion = matching_occasions.at(0)

    render({ :template => "occasions/show.html.erb" })
  end

  def create
    the_occasion = Occasion.new
    the_occasion.user_id = params.fetch("query_user_id")
    the_occasion.loved_one_id = params.fetch("query_loved_one_id")
    the_occasion.name = params.fetch("query_name")
    the_occasion.date = params.fetch("query_date")
    the_occasion.gifts_count = params.fetch("query_gifts_count")

    if the_occasion.valid?
      the_occasion.save
      redirect_to("/occasions", { :notice => "Occasion created successfully." })
    else
      redirect_to("/occasions", { :alert => the_occasion.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_occasion = Occasion.where({ :id => the_id }).at(0)

    the_occasion.user_id = params.fetch("query_user_id")
    the_occasion.loved_one_id = params.fetch("query_loved_one_id")
    the_occasion.name = params.fetch("query_name")
    the_occasion.date = params.fetch("query_date")
    the_occasion.gifts_count = params.fetch("query_gifts_count")

    if the_occasion.valid?
      the_occasion.save
      redirect_to("/occasions/#{the_occasion.id}", { :notice => "Occasion updated successfully." })
    else
      redirect_to("/occasions/#{the_occasion.id}", { :alert => the_occasion.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_occasion = Occasion.where({ :id => the_id }).at(0)

    the_occasion.destroy

    redirect_to("/occasions", { :notice => "Occasion deleted successfully." })
  end
end
