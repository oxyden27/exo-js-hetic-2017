class LayoutsController < ApplicationController
  
  def index
    @annonces = Annonce.all
    @annonces = Annonce.paginate(:page => params[:page], :per_page => 3)
  end
end
