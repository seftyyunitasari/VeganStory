class FavouritesController < ApplicationController
    skip_before_action :login_required, only: [:create, :destroy]

	def create
		favourite = current_user.favourites.create(product_id: params[:product_id])
        redirect_to products_path, notice: "Product has been added to favourites list"
	end

	def destroy
		favourite = current_user.favourites.find_by(id: params[:id]).destroy
		redirect_to favourites_path, notice: "Product has been removed to favourites list"
	end

	def index
		@favourites = current_user.favourites
	end
end
