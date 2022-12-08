class Admins::DepartmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :define_department!, except: %i[new create]
  before_action :user_admin?

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)

    if @department.save
      redirect_to department_path(@department),
      success: I18n.t('flash.new', model: i18n_model_name(@department).downcase)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit  
  end

  def update
    if @department.update(department_params)
      redirect_to department_path(@department),
        success: I18n.t('flash.update', model: i18n_model_name(@department).downcase)
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @department.destroy
      redirect_to departments_path,
        success: I18n.t('flash.destroy', model: i18n_model_name(@department).downcase)
    end
  end

  private

    def user_admin?
      unless current_user.role == 'admin'
        redirect_to root_path,
          danger: I18n.t('flash.not_permit')
      end
    end

    def define_department!
      @department = Department.find(params[:id])
    end

    def department_params
      params.require(:department).permit(:name_department, :description)
    end
end
