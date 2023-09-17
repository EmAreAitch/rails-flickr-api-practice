class StaticPagesController < ApplicationController
  def index
    if params[:search].present?
      @flickr = FlickRaw::Flickr.new
      @photos = flickr.people.getPhotos(get_params)
      @photos.map! { |photo| FlickRaw.url(photo) }
    end
  end

  private

  def get_params
    params.require(:search).permit(:user_id, :per_page).to_h
  end
end
