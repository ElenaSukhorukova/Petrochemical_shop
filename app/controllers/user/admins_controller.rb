class User::AdminsController < ApplicationController
  include ChangeFullName
  before_action :authenticate_user!
  before_action :define_user!
  before_action :define_admin!, only: %i[edit update destroy]
  before_action :define_departments!, only: %i[new create]
  after_action :change_full_name, only: %i[create update]

  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new  
  end

  def create
    @admin = @user.admin_build(admin_params)

    if @admin.save
      redirect_to admin_path(@admin),
        success: I18n.t('flash.new', model: i18n_model_name(@admin).downcase)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @admin.update(admin_params)
      redirect_to admin_path(@admin),
        success: I18n.t('flash.update', model: i18n_model_name(@admin).downcase)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @admin.destroy
      redirect_to new_admin_path,
        success: I18n.t('flash.destroy', model: i18n_model_name(@admin).downcase)
    end
  end

  private
    def define_admin!
      @admin = Admin.find(params[:id])
    end

    def define_user!
      @user = current_user
    end

    def define_departments!
      @departments = Department.all
      unless @departments.any?
        redirect_to new_admin_department_path,
          warning: I18n.t('flash.queue_creation', model: i18n_model_name(Department.new).downcase)
      end
    end

    def admin_params
      params.require(:admin).permit(:full_name, :date_birthday, :personal_phone_number,
                                    :work_phone_number, :additional_number, :about, 
                                    :gender, :email, :department_id)
    end
end
