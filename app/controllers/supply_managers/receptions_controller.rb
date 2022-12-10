class SupplyManagers::ReceptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :define_reception!, except: %i[index new create]
  before_action :define_variables!, except: %i[index show destroy]

  def index
    @receptions = Reception.all
  end

  def show
    @line_items = @reception.line_items
    @line_item = LineItem.new
    @products = Product.all
    @containers = Container.all
    @line_item_container = @reception.line_item_containers.build
    @containers = Container.all
  end

  def new
    @reception = Reception.new
  end

  def create
    @reception = Reception.new(reception_params)

    if @reception.save
      redirect_to reception_path(@reception)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @reception.update(reception_params)
      redirect_to reception_path(@reception),
        success: I18n.t('flash.update', model: i18n_model_name(@reception).downcase)
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def define_reception!
    @reception = Reception.find(params[:id])
  end

  def define_variables!
    @our_companies = OurCompany.all.order(legal_name_company: :asc)
    @suppliers = Supplier.all.order(legal_name_company: :asc)

    if @suppliers.empty?
      redirect_to new_supplier_path,
        warning: I18n.t('flash.queue_creation', model: i18n_model_name(Supplier.new).downcase)
    elsif  @our_companies.empty?
      redirect_to root_path,
      warning: I18n.t('flash.queue_creation', model: i18n_model_name(OurCompany.new).downcase) 
    end
  end

  def reception_params
    params.require(:reception).permit(:confirmation, :our_company_id, :supplier_id)
  end

end