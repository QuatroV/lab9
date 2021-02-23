class IndexController < ApplicationController
  def input
  end

  def output
    @a = params[:num].to_f
    if @a <= 0
      @error = 'Ошибка!'
    else
      @x = []
      @x[0] = @a
      i = 1
      while (@x[i-1]**2-@a)/@a > 0.001
        @x[i] = 0.5*(@x[i-1]+@a/@x[i-1])
        i += 1
      end
      @x
    end
    respond_to do |format|
      format.html
      format.json do
        render json:
          {num: @x, error: @error, }
      end
    end
  end
end
