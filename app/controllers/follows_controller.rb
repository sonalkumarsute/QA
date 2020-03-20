class FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_follow, only: [:show, :edit, :update, :destroy]

  # GET /follows
  # GET /follows.json
  def index
    @follows = Follow.all
  end

  # GET /follows/1
  # GET /follows/1.json
  def show
  end


  def sfollow
    @follow = Follow.where(following_id: params[:following_id], following_type: params[:following_type], user_id: current_user.id)
    @question = Question.find(params[:question_id])
    if @follow.present?
      respond_to do |format|
        format.html { redirect_to @question }
        flash[:warning] = "Already following"      
      end  
    else  
      @follow = Follow.create(following_id: params[:following_id], following_type: params[:following_type], user_id: current_user.id)
      if @follow
        respond_to do |format|
          format.html { redirect_to @question }
          flash[:success] = "You started following #{@follow.following_type}"  
        end   
      end      
    end     
  end  

  # GET /follows/new
  def new
    @follow = Follow.new
  end

  # GET /follows/1/edit
  def edit
  end

  # POST /follows
  # POST /follows.json
  def create
    @follow = Follow.new(follow_params)

    respond_to do |format|
      if @follow.save
        format.html { redirect_to @follow, notice: 'Follow was successfully created.' }
        format.json { render :show, status: :created, location: @follow }
      else
        format.html { render :new }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /follows/1
  # PATCH/PUT /follows/1.json
  def update
    respond_to do |format|
      if @follow.update(follow_params)
        format.html { redirect_to @follow, notice: 'Follow was successfully updated.' }
        format.json { render :show, status: :ok, location: @follow }
      else
        format.html { render :edit }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follows/1
  # DELETE /follows/1.json
  def destroy
    @follow.destroy
    respond_to do |format|
      format.html { redirect_to follows_url, notice: 'Follow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
      @follow = Follow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def follow_params
      params.require(:follow).permit(:following_id, :following_type, :user_id)
    end
end
