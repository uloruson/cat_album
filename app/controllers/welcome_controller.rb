class WelcomeController < ApplicationController

  def index

    # pixabay_image_get
    @images = Image.all

  end
end
