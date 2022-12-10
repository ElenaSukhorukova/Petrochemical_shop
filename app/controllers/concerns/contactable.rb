module Contactable
  include ChangeFullName
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
    before_action :define_company_contact!, only: %i[edit update destroy]
  end

  def new
    @contact = @contactable.company_contacts.build  
  end

  def create
    @contact = @contactable.company_contacts.build(company_contact_params)
    
    if @contact.save
      change_full_name(@contact)
      redirect_to contactable_path(@contact.contactable_id),
        success: I18n.t('flash.new', model: i18n_model_name(@contact).downcase)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @contact.update(company_contact_params)
      change_full_name(@contact)
      redirect_to contactable_path(@contact.contactable_id),
        success: I18n.t('flash.update', model: i18n_model_name(@contact).downcase)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    if @contact.destroy
      redirect_to contactable_path(@contact.contactable_id),
        success: I18n.t('flash.destroy', model: i18n_model_name(@contact).downcase)
    end
  end
  

  private

  def define_company_contact!
    @contact = CompanyContact.find(params[:id])
  end

  def company_contact_params
    params.require(:company_contact).permit(:full_name, :position, :email, :personal_phone_number, 
                                            :work_phone_number, :additional_phone_number, :description)
  end
end
