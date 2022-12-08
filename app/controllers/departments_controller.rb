class DepartmentsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @departments = Department.all
  end

  def show
    @department = Department.find(params[:id])
    @products = Product.all
  end

  private

    def department_params
      params.require(:department).permit(:name_department, :description)
    end
end
