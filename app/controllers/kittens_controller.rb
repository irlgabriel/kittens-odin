class KittensController < ApplicationController

  def new 
    @kitten = Kitten.new
  end

  def show
    @kitten = Kitten.find(:params[:id])
  end

  def index 
    @kittens = Kitten.all
  end

  def create
    @kitten = Kitten.create(kitten_params)
    if @kitten.save 
      render :index, notice: 'Kitten created successfully'
    else
      redirect_to 'new', notice: 'Failed to create kitten'
    end
  end

  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update(kitten_params)
    if @kitten.save
      render 'index'
    else
      redirect_to 'update', notice: 'Failed to update kitten'
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    redirect_to kittens_path, notice: 'Kitten successfully destroyed'
  end

  private
    
  def kitten_params
    params.require(:kitten).permit(:name, :age, :softness)
  end

end
