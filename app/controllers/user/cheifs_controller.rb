class User::CheifsController < ApplicationController
  include ChangeFullName
  before_action :authenticate_user!
  before_action :define_user!
  before_action :define_cheif!, only: %i[edit update destroy]
  before_action :define_departments!, except: %i[destroy show]

  def show
    @cheif = Cheif.find(params[:id])
  end

  def new
    @cheif = Cheif.new  
  end

  def create
    @cheif = Cheif.new(cheif_params)
    @cheif.user = @user

    if @cheif.save
      change_full_name(@cheif)
      redirect_to cheif_path(@cheif),
        success: I18n.t('flash.new', model: i18n_model_name(@cheif).downcase)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @cheif.update(cheif_params)
      change_full_name(@cheif)
      redirect_to cheif_path(@cheif),
        success: I18n.t('flash.update', model: i18n_model_name(@cheif).downcase)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @cheif.destroy
      redirect_to new_cheif_path,
        success: I18n.t('flash.destroy', model: i18n_model_name(@cheif).downcase)
    end
  end

  private

    def define_cheif!
      @cheif = Cheif.find(params[:id])
    end

    def define_user!
      @user = current_user
    end

    def define_departments!
      @departments = Department.all
      unless @departments.any?
        redirect_to root_path,
          warning: I18n.t('flash.queue_creation', model: i18n_model_name(Department.new).downcase)
      end
    end

    def cheif_params
      params.require(:cheif).permit(:full_name, :date_birthday, :personal_phone_number,
                                    :work_phone_number, :additional_number, :about, 
                                    :gender, :email, :department_id)
    end
end
