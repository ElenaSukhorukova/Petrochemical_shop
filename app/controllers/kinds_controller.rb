class KindsController < ApplicationController
  before_action :authenticate_user!

  def index
    @kinds = Kind.all.order(name_kind: :asc)
  end
end
