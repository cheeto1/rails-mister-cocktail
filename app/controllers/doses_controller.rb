class DosesController < ApplicationController
  # before_action, :dose_params, only: :destroy
  def index
    @cocktail = Cocktail.find(params[:cocktail_id])
    @doses = Dose.where(cocktail_id: @cocktail.id)
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_doses_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  # def destroy
  #   @dose.destroy
  #   redirect_to cocktails_path
  # end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
