class Suppliers::CompanyContactsController < ApplicationController
  include Contactable
  before_action :set_contactable, only: %i[new create]

  private  

  def set_contactable
    @contactable = Supplier.find(params[:supplier_id])
  end

  def contactable_path(model)
    supplier_path(model)
  end
  helper_method :contactable_path
end
