class SupplyManagers::KindsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_has_permission?
  before_action :define_kind!, except: %i[index new create]

  def index
    @kinds = Kind.all
  end

  def new
    @kind = Kind.new
  end

  def create
    @kind = Kind.new(kind_params)

    if @kind.save
      redirect_to supply_managers_kinds_path,
      success: I18n.t('flash.new', model: i18n_model_name(@kind).downcase)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit  
  end

  def update
    if @kind.update(kind_params)
      redirect_to supply_managers_kinds_path,
        success: I18n.t('flash.update', model: i18n_model_name(@kind).downcase)
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @kind.destroy
      redirect_to supply_managers_kinds_path,
        success: I18n.t('flash.destroy', model: i18n_model_name(@kind).downcase)
    end
  end

  private

    def user_has_permission?
      unless current_user.role == 'supply manager'
        redirect_to root_path,
          warning: I18n.t('flash.not_permit')
      end
    end

    def define_kind!
      @kind = Kind.find(params[:id])
    end

    def kind_params
      params.require(:kind).permit(:name_kind)
    end
end
