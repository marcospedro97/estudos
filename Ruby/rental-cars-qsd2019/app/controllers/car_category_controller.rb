class CarCategoryController < ApplicationController
  def index
    @car_categories = CarCategory.all
  end

  def show
    @car_category = CarCategory.find(params[:id])
  end

  def new
    @car_category = CarCategory.new
  end

  def create
    @car_category = CarCategory.new(car_category_params)
    if @car_category.save
      flash[:notice] = 'Categoria criada com sucesso'
      redirect_to @car_category
    else
      flash.now[:alert] = 'Você deve corrigir os seguintes erros'
      render :new
    end
  end

  def edit
    @car_category = CarCategory.find(params[:id])
  end

  def update
    @car_category = CarCategory.find(params[:id])
    @car_category = CarCategory.update(car_category_params)
    redirect_to @car_category
  end

  def destroy
    @car_category = CarCategory.find(params[:id])
    @car_category.destroy
    flash[:notice] = 'Categoria apagada com sucesso'
    redirect_to car_category_index_path
  end

  private

  def car_category_params
    params.require(:car_category).permit(:name, :daily_rate, :car_insurance, :third_party_insurance)
  end
end
