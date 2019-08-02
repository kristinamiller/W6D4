class ArtworksController < ApplicationController
  def index
    # if params[:user_id]
    # artwork = Artwork.where("artist_id = #{params[:user_id]}")

    # artwork_shared_info = ArtworkShare.where(.....)

    #  artwork_shared_info.each do  
    #   Artwork.find(artwork_id)
    # end
    # else
    # artwork = Artwork.all 
    # end
    # render json: artwork
    if params[:user_id]
      owned = User.find(params[:user_id]).artist_artworks
      shared = User.find(params[:user_id]).shared_artworks
      render json: (owned + shared)
    else

    end

  end

  def show
    render json: Artwork.find(params[:id])
  end

  def create
    # render json: params

  
    artwork = Artwork.new(artwork_params)
    
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end

  end

  def update
    
    artwork = Artwork.find(params[:id])

    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end

  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: artwork
    # remove artwork and everything related to it
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
