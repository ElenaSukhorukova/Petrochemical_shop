class SupplyManagers::ContainersController < ApplicationController
  before_action :authenticate_user!
  before_action :define_container!, except: %i[index new create]

  def index
    @containers = Container.all.where.not(name_container: 'kilogram')
  end

  def show
  end

  def new
    @container = Container.new
  end

  def create
    @container = Container.new(container_params)

    if @container.save
      redirect_to container_path(@container),
      success: I18n.t('flash.new', model: i18n_model_name(@container).downcase)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit  
  end

  def update
    if @container.update(container_params)
      redirect_to container_path(@container),
        success: I18n.t('flash.update', model: i18n_model_name(@container).downcase)
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @container.destroy
      redirect_to containers_path,
        success: I18n.t('flash.destroy', model: i18n_model_name(@container).downcase)
    end
  end

  private
    def define_container!
      @container = Container.find(params[:id])
    end

    def container_params
      params.require(:container).permit(:name_container, :length, :height, :width, :weight, :description)
    end
end
