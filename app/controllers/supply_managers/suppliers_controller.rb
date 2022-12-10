class SupplyManagers::SuppliersController < ApplicationController
  include ChangeFullName
  before_action :authenticate_user!
  before_action :define_supplier!, except: %i[index new create]
  before_action :define_variables!, except: %i[index show destroy]

  def index
    @suppliers = Supplier.all.order(legal_name_company: :asc)
  end

  def show
    @company_contacts = @supplier.company_contacts
  end

  def new
    @supplier = Supplier.new
    @supplier.account_numbers.build
    @supplier.build_legal_address
    @supplier.build_post_address
  end

  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      change_full_name(@supplier)
      redirect_to suppliers_path(@supplier),
      success: I18n.t('flash.new', model: i18n_model_name(@supplier).downcase)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit  
  end

  def update
    if @supplier.update(supplier_params)
      change_full_name(@supplier)
      redirect_to supplier_path(@supplier),
        success: I18n.t('flash.update', model: i18n_model_name(@supplier).downcase)
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @supplier.destroy
      redirect_to suppliers_path,
        success: I18n.t('flash.destroy', model: i18n_model_name(@supplier).downcase)
    end
  end

  private

  def define_supplier!
      @supplier = Supplier.find(params[:id])
    end

    def define_variables!
      @countries = Country.all.order(country_name: :asc)
      @regions = Region.all.order(region_name: :asc)
      @banks = Bank.all

      unless @banks.any?
        redirect_to new_bank_path,
          warning: I18n.t('flash.queue_creation', model: i18n_model_name(Bank.new).downcase)
      end
    end

    def supplier_params
      params.require(:supplier).permit(:legal_name_company, :inn, :kpp, :ogrn, :okpo, :okved, 
                                      :full_name_director, :phone_number, :email, :description, :resident, 
                                      account_numbers_attributes: [:id, :account_number, :alias, :bank_id],
                                      legal_address_attributes: [:post_number, :town, :street, :number_building,
                                        :description, :country_id, :region_id ], 
                                      post_address_attributes: [:post_number, :town, :street, :number_building,
                                        :description, :country_id, :region_id ])
    end
end

