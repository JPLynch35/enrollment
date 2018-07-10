class CoursesController < ApplicationController
  def show
    @course = Course.includes(:students).find(params[:id])
  end
end
