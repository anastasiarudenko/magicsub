class ShiftsController < ApplicationController
  def index

  end

  def show
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
    if @shift.save
      redirect_to @shift, success: 'Статья успешно создана'
    else
      flash.now[:danger] = 'Статья не создана'
      render :new
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

  def shift_params
    params.require(:shift).permit(:time, :file)
  end
end