class SupplyManagers::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :define_product!, except: %i[index new create]
  before_action :define_variables!, except: %i[index show destroy]

  def index
    @products = Product.all.order(name: :asc)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to supply_managers_product_path(@product),
      success: I18n.t('flash.new', model: i18n_model_name(@product).downcase)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit  
  end

  def update
    if @product.update(product_params)
      redirect_to supply_managers_product_path(@product),
        success: I18n.t('flash.update', model: i18n_model_name(@product).downcase)
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      redirect_to supply_managers_products_path,
        success: I18n.t('flash.destroy', model: i18n_model_name(@product).downcase)
    end
  end

  private
    def define_product!
      @product = Product.find(params[:id])
    end

    def define_variables!
      @kinds = Kind.all
      @departments = Department.all

      unless @kinds.any?
        redirect_to new_supply_managers_kind_path,
          warning: I18n.t('flash.queue_creation', model: i18n_model_name(Kind.new).downcase)
      end
    end

    def product_params
      params.require(:product).permit(:name, :description, :kind_id, department_ids: [])
    end
end
