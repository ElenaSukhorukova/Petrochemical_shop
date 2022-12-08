class User::SupplyManagersController < ApplicationController
  include ChangeFullName
  before_action :authenticate_user!
  before_action :define_user!
  before_action :define_supply_manager!, only: %i[edit update destroy]
  before_action :define_departments!, except: %i[show destroy]
  after_action :change_full_name, only: %i[create update]

  def show
    @supply_manager = SupplyManager.find(params[:id])
  end
  
  def new
    @supply_manager = SupplyManager.new  
  end

  def create
    @supply_manager = SupplyManager.new(supply_manager_params)
    @supply_manager.user = @user

    if @supply_manager.save
      redirect_to supply_manager_path(@supply_manager),
        success: I18n.t('flash.new', model: i18n_model_name(@supply_manager).downcase)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @supply_manager.update(supply_manager_params)
      redirect_to supply_manager_path(@supply_manager),
        success: I18n.t('flash.update', model: i18n_model_name(@supply_manager).downcase)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @supply_manager.destroy
      redirect_to new_supply_manager_path,
        success: I18n.t('flash.destroy', model: i18n_model_name(@supply_manager).downcase)
    end
  end

  private

    def define_supply_manager!
      @supply_manager = SupplyManager.find(params[:id])
    end

    def define_user!
      @user = current_user
    end

    def define_departments!
      @departments = Department.all
      unless @departments
        redirect_to departments_path,
          warning: I18n.t('flash.queue_creation', model: i18n_model_name(Depatment.new).downcase)
      end
    end

    def supply_manager_params
      params.require(:supply_manager).permit(:full_name, :date_birthday, :personal_phone_number,
                                              :work_phone_number, :additional_number, :about, 
                                              :gender, :email, :department_id)
    end
end
