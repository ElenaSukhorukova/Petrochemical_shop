class Companies::CompanyContactsController < ApplicationController
  include ChangeFullName
  before_action :authenticate_user!
  before_action :define_company_contact!, only: %i[edit update destroy]
  before_action :define_company!, except: %i[index show destroy]

  def new
    @company_contact = @company.company_contacts.build  
  end

  def create
    @company_contact = @company.company_contacts.build(company_contact_params)

    if @company_contact.save
      change_full_name(@company_contact)
      redirect_to company_path(@company_contact.company),
        success: I18n.t('flash.new', model: i18n_model_name(@company_contact).downcase)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @company_contact.update(company_contact_params)
      change_full_name(@company_contact)
      redirect_to company_path(@company_contact.company),
        success: I18n.t('flash.update', model: i18n_model_name(@bank).downcase)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @company_contact.destroy
      redirect_to company_path(@company_contact.company),
        success: I18n.t('flash.destroy', model: i18n_model_name(@company_contact).downcase)
    end
  end

  def user_has_permission?
    unless %w[cheif client logistic\ manager sales\ manager supply\ manager].include?(current_user.role)
      redirect_to root_path,
        danger: I18n.t('flash.not_permit')
    end
  end

  private

    def define_company_contact!
      @company_contact = CompanyContact.find(params[:id])
    end
    
    def define_company!
      @company = Company.find(params[:company_id])
    end

    def company_contact_params
      params.require(:company_contact).permit(:full_name, :position, :email, :personal_phone_number, 
                                              :work_phone_number, :additional_phone_number, :description)
    end
end
