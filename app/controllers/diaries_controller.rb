class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]

  # GET /diaries
  # GET /diaries.json
  def index
    @diaries = Diary.includes(:user)
  end

  # GET /diaries/1
  # GET /diaries/1.json
  def show
  end

  # GET /diaries/new
  def new
    @diary = Diary.new
  end

  # GET /diaries/1/edit
  def edit
  end

  # POST /diaries
  # POST /diaries.json
  def create
    @diary = Diary.new(diary_params)
    respond_to do |format|
      if @diary.save
        format.html { redirect_to @diary }
        format.json { render :show, status: :created, location: @diary }
      else
        format.html { render :new }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diaries/1
  # PATCH/PUT /diaries/1.json
  def update
    respond_to do |format|
      if @diary.update(diary_params)
        format.html { redirect_to @diary, notice: 'Diary was successfully updated.' }
        format.json { render :show, status: :ok, location: @diary }
      else
        format.html { render :edit }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diaries/1
  # DELETE /diaries/1.json
  def destroy
    @diary.destroy
    respond_to do |format|
      format.html { redirect_to diaries_url, notice: 'Diary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_diary
    @diary = Diary.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def diary_params
    params.require(:diary).permit(:content, :date).merge(user_id: current_user.id)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
