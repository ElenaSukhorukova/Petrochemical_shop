class OurCompanies::CompanyContactsController < ApplicationController
  include Contactable
  before_action :set_contactable, only: %i[new create]

  private  

  def set_contactable
    @contactable = OurCompany.find(params[:our_company_id])
  end

  def contactable_path(model)
    our_company_path(model)
  end
  
  helper_method :contactable_path
end
