class GiftsController < ApplicationController
  before_action(:force_user_sign_in)

  def index
    matching_gifts = Gift.all

    @list_of_gifts = matching_gifts.where({ :user_id => @current_user.id }) #.order({ :username => :desc })

    render({ :template => "gifts/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_gifts = Gift.where({ :id => the_id })

    @the_gift = matching_gifts.at(0)

    render({ :template => "gifts/show.html.erb" })
  end

  def create
    the_gift = Gift.new
    the_gift.occasion_id = params.fetch("query_occasion_id")
    the_gift.user_id = params.fetch("query_user_id")
    the_gift.note = params.fetch("query_note")
    the_gift.loved_one_id = params.fetch("query_loved_one_id")

    if the_gift.valid?
      the_gift.save
      redirect_to("/gifts", { :notice => "Gift created successfully." })
    else
      redirect_to("/gifts", { :alert => the_gift.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_gift = Gift.where({ :id => the_id }).at(0)

    the_gift.occasion_id = params.fetch("query_occasion_id")
    the_gift.user_id = params.fetch("query_user_id")
    the_gift.note = params.fetch("query_note")
    the_gift.loved_one_id = params.fetch("query_loved_one_id")

    if the_gift.valid?
      the_gift.save
      redirect_to("/gifts/#{the_gift.id}", { :notice => "Gift updated successfully."} )
    else
      redirect_to("/gifts/#{the_gift.id}", { :alert => the_gift.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_gift = Gift.where({ :id => the_id }).at(0)

    the_gift.destroy

    redirect_to("/gifts", { :notice => "Gift deleted successfully."} )
  end
end
