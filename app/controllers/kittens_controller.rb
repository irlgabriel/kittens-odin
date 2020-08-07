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
      render @kittens
    else
      redirect_to 'new', notice: 'Failed to create kitten'
    end
  end

  def update
    @kitten = Kitten.update(kitten_params)
    if @kitten.save
      render @kittens
    else
      redirect_to 'update', notice: 'Failed to update kitten'
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])

  end

  def destroy
    @kitten.destroy
    redirect_to @kittens, notice: 'Kitten successfully destroyed'
  end

end
