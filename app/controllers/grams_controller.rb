class GramsController < ApplicationController
  def index
    @grams = Gram.order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    @gram = Gram.new
  end

  def create
    @gram = Gram.new(model_params)

    if @gram.save
      flash[:notice] = 'Gram successfully created'
      redirect_to @gram
    else
      render :new
    end
  end

  def show
    @gram = Gram.find(params[:id])
  end

  def destroy
    @gram = Gram.find(params[:id])
    @gram.destroy

    redirect_to grams_path
  end

  private

  def model_params
    params.require(:gram).permit(:title, :description, :location_code, :image_url)
  end
  # {"title"=>"hello", "description"=>"lkjljlkj", "location_code"=>"SG"}
end











