class AddressesController < ApplicationController
  def new
    @student = Student.find(params(:student_id))
  end
end