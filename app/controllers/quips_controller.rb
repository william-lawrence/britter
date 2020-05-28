class QuipsController < ApplicationController
  before_action :set_quip, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /quips
  # GET /quips.json
  def index
    @quips = Quip.all.order("created_at DESC")
    @quip = Quip.new
  end

  # GET /quips/1
  # GET /quips/1.json
  def show
    
  end

  # GET /quips/new
  def new
    @quip = current_user.quips.build
  end

  # GET /quips/1/edit
  def edit
  end

  # POST /quips
  # POST /quips.json
  def create
    @quip = current_user.quips.build(quip_params)

    respond_to do |format|
      if @quip.save
        format.html { redirect_to root_path, notice: 'Quip was successfully created.' }
        format.json { render :show, status: :created, location: @quip }
      else
        format.html { render :new }
        format.json { render json: @quip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quips/1
  # PATCH/PUT /quips/1.json
  def update
    respond_to do |format|
      if @quip.update(quip_params)
        format.html { redirect_to @quip, notice: 'Quip was successfully updated.' }
        format.json { render :show, status: :ok, location: @quip }
      else
        format.html { render :index }
        format.json { render json: @quip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quips/1
  # DELETE /quips/1.json
  def destroy
    if current_user.id == @quip.user_id
      @quip.destroy
      respond_to do |format|
        format.html { redirect_to quips_url, notice: 'Quip was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to quips_url, notice: 'You cannot destroy another users quip.' }
        format.json { head :no_content }
      end
    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quip
      @quip = current_user.quips.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quip_params
      params.require(:quip).permit(:body)
    end
end
