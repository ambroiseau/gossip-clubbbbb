class GossipsController < ApplicationController
def index
    @gossips = Gossip.all
    @user= User.find(params[:user_id])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @gossip=Gossip.find(params[:id])
    @user= @gossip.user(params[:username])
  end

  # GET /users/new
  def new
    @gossip = Gossip.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @gossip = Gossip.new(gossip_params)
    @gossip.user = current_user
    @gossip.save
    redirect_to "/users/#{current_user.id}/gossips"
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gossip
      @gossip = Gossip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gossip_params
      params.require(:gossip).permit(:title, :content)
    end
end
