class ShiftsController < ApplicationController

  before_action :set_shift, only: [:show]
  def index
    @shift = Shift.new
  end

  def show
  end

  def create
    @shift = Shift.new(shift_params)

    if @shift.save
      redirect_to @shift
    else
      flash.now[:danger] = 'Субтитры не загружены'
      render :index
    end
  end

  def edit
  end

  def update
    if @shift.update_attributes(post_params)
      redirect_to @shift, success: 'Статья успешно обновлена'
    else
      flash.now[:danger] = 'Статья не обновлена'
      render :edit
    end
  end

  def destroy
    @shift.destroy
    redirect_to shifts_path
  end

  def set_shift
    @shift = Shift.find(params[:id])
  end

  def shift_params
    params.require(:shift).permit(:time, :file)
  end
end