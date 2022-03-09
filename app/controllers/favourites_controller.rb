class FavouritesController < ApplicationController
    skip_before_action :login_required, only: [:create, :destroy]

	def create
		favourite = current_user.favourites.create(product_id: params[:product_id])
        redirect_to favourites_path
	end

	def destroy
		favourite = current_user.favourites.find_by(id: params[:id]).destroy
		redirect_to favourites_path
	end

	def index
		@favourites = current_user.favourites
	end
end
