class AnnoncesController < ApplicationController
  
  before_action :authenticate_user!, except: [:show, :index]
  
  before_action :set_annonce, only: [:show, :edit, :update, :destroy]
  
  before_filter :require_permission, only: [:edit, :update, :destroy]

  def require_permission
    if current_user != Annonce.find(params[:id]).user
      redirect_to root_path
    end
  end

  # GET /annonces
  # GET /annonces.json
  def index
    if params[:search]
         @annonces = Annonce.search(params[:search]).paginate(:page => params[:page], :per_page => 3)
      else
        @annonces = Annonce.all.paginate(:page => params[:page], :per_page => 3)
    end  
  end


  # GET /annonces/1
  # GET /annonces/1.json
  def show
  end

  # GET /annonces/new
  def new
    @annonce = Annonce.new
  end

  # GET /annonces/1/edit
  def edit
  end

  # POST /annonces
  # POST /annonces.json
  def create
    @annonce = Annonce.new(annonce_params)
    @annonce.user_id = current_user.id

    respond_to do |format|
      if @annonce.save
        format.html { redirect_to @annonce, notice: 'Votre annonce à été correctement crée' }
        format.json { render :show, status: :created, location: @annonce }
      else
        format.html { render :new }
        format.json { render json: @annonce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /annonces/1
  # PATCH/PUT /annonces/1.json
  def update
    respond_to do |format|
      if @annonce.update(annonce_params)
        format.html { redirect_to @annonce, notice: 'L\'annonce a été correctement édité.' }
        format.json { render :show, status: :ok, location: @annonce }
      else
        format.html { render :edit }
        format.json { render json: @annonce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annonces/1
  # DELETE /annonces/1.json
  def destroy
    @annonce.destroy
    respond_to do |format|
      format.html { redirect_to annonces_url, notice: 'Votre annonce à été supprimé avec succès.' }
      format.json { head :no_content }
    end
  end
  
  def show_my_annonces
    @annonces = Annonce.where(user_id: :user_id)
    @annonces = Annonce.paginate(:page => params[:page], :per_page => 12)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_annonce
      @annonce = Annonce.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def annonce_params
      params.require(:annonce).permit(:title, :description, :price, :category_id, :image)
    end
end
