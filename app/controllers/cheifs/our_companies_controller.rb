class Cheifs::OurCompaniesController < ApplicationController
  include ChangeFullName
  before_action :authenticate_user!
  before_action :define_our_company!, except: %i[index new create]
  before_action :define_variables!, except: %i[index show destroy]

  def index
    @our_companies = OurCompany.all.order(legal_name_company: :asc)
  end

  def show
    @company_contacts = @our_company.company_contacts
  end

  def new
    @our_company = OurCompany.new
    @our_company.account_numbers.build
    @our_company.build_legal_address
    @our_company.build_post_address
  end

  def create
    @our_company = OurCompany.new(our_company_params)

    if @our_company.save
      change_full_name(@our_company)
      redirect_to our_company_path(@our_company),
      success: I18n.t('flash.new', model: i18n_model_name(@our_company).downcase)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit  
  end

  def update
    if @our_company.update(our_company_params)
      change_full_name(@our_company)
      redirect_to our_company_path(@our_company),
        success: I18n.t('flash.update', model: i18n_model_name(@our_company).downcase)
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @our_company.destroy
      redirect_to our_companies_path,
        success: I18n.t('flash.destroy', model: i18n_model_name(@our_company).downcase)
    end
  end

  private

  def define_our_company!
      @our_company = OurCompany.find(params[:id])
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

    def our_company_params
      params.require(:our_company).permit(:legal_name_company, :inn, :kpp, :ogrn, :okpo, :okved, 
                                      :full_name_director, :phone_number, :email, :description, :resident, 
                                      account_numbers_attributes: [:id, :account_number, :alias, :bank_id],
                                      legal_address_attributes: [:post_number, :town, :street, :number_building,
                                        :description, :country_id, :region_id ], 
                                      post_address_attributes: [:post_number, :town, :street, :number_building,
                                        :description, :country_id, :region_id ])
    end
end
