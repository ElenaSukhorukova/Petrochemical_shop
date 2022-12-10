class Receptions::LineItemContainersController < ApplicationController
  include LineItemableContainer
  before_action :set_source, only: %i[new create]

  private  

  def set_source
    @source = Reception.find(params[:reception_id])
  end

  def source_path(model)
    reception_path(model)
  end
  helper_method :source_path
end
