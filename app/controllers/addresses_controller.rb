class AddressesController < ApplicationController
  def new
    @student = Student.find(params[:student_id])
    @address = Address.new
  end

  def create
    @student = Student.find(params[:student_id])
    @address = @student.addresses.create(address_params)
    if @address.save
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  private
  def address_params
    params.require(:address).permit(:description, :street, :city, :state, :zipcode)
  end
end
