class LovedOnesController < ApplicationController
  before_action(:force_user_sign_in)

  def index
    matching_loved_ones = LovedOne.all

    @list_of_loved_ones = matching_loved_ones.order({ :created_at => :desc })

    render({ :template => "loved_ones/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_loved_ones = LovedOne.where({ :id => the_id })

    @the_loved_one = matching_loved_ones.at(0)

    render({ :template => "loved_ones/show.html.erb" })
  end

  def create
    the_loved_one = LovedOne.new
    the_loved_one.user_id = params.fetch("query_user_id")
    the_loved_one.name = params.fetch("query_name")
    the_loved_one.relationship = params.fetch("query_relationship")
    the_loved_one.occasions_count = params.fetch("query_occasions_count")
    the_loved_one.gifts_count = params.fetch("query_gifts_count")

    if the_loved_one.valid?
      the_loved_one.save
      redirect_to("/loved_ones", { :notice => "Loved one created successfully." })
    else
      redirect_to("/loved_ones", { :alert => the_loved_one.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_loved_one = LovedOne.where({ :id => the_id }).at(0)

    the_loved_one.user_id = params.fetch("query_user_id")
    the_loved_one.name = params.fetch("query_name")
    the_loved_one.relationship = params.fetch("query_relationship")
    the_loved_one.occasions_count = params.fetch("query_occasions_count")
    the_loved_one.gifts_count = params.fetch("query_gifts_count")

    if the_loved_one.valid?
      the_loved_one.save
      redirect_to("/loved_ones/#{the_loved_one.id}", { :notice => "Loved one updated successfully."} )
    else
      redirect_to("/loved_ones/#{the_loved_one.id}", { :alert => the_loved_one.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_loved_one = LovedOne.where({ :id => the_id }).at(0)

    the_loved_one.destroy

    redirect_to("/loved_ones", { :notice => "Loved one deleted successfully."} )
  end
end
