class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find_by(id: params[:id])
 	@user.posts
  end
end


# Show should a given user's posts.
# If the show page (say user/1) isn't the
# current user, then the posts will still show.
# the option to delete or edit a post will ONLY
# show if the current_user.id === to params[:id].