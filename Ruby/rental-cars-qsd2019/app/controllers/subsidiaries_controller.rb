class SubsidiariesController < ApplicationController
  def index
    @subsidiaries = Subsidiary.all
  end

  def show
    @subsidiary = Subsidiary.find(params[:id])
  end

  def new
    @subsidiary = Subsidiary.new
  end

  def create
    @subsidiary = Subsidiary.new(subsidiary_params)
    if @subsidiary.save
      flash[:notice] = 'Filial criada com sucesso'
      redirect_to @subsidiary
    else
      flash.now[:alert] = 'Você deve corrigir os seguintes erros'
      render :new
    end
  end

  def edit
    @subsidiary = Subsidiary.find(params[:id])
  end

  def update
    @subsidiary = Subsidiary.find(params[:id])
    @subsidiary.update(subsidiary_params)
    redirect_to @subsidiary
  end

  def destroy
    @subsidiary = Subsidiary.find(params[:id])
    @subsidiary.destroy
    flash[:notice] = 'Filial apagada com sucesso'
    redirect_to subsidiaries_path
  end

  private

  def subsidiary_params
    params.require(:subsidiary).permit(:name, :cnpj, :adress)
  end
end
