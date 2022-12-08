class BanksController < ApplicationController
  before_action :authenticate_user!
  before_action :define_bank!, only: %i[edit update destroy]
  before_action :user_has_permission?, except: %i[index show]

  def index
    @bank_residents = Bank.where(resident: true).order(bank_name: :asc)
    @bank_not_residents = Bank.where(resident: false).order(bank_name: :asc)
  end

  def show
    @bank = Bank.find(params[:id])
  end

  def new
    @bank = Bank.new  
  end

  def create
    @bank = Bank.new(bank_params)

    if @bank.save
      redirect_to banks_path,
        success: I18n.t('flash.new', model: i18n_model_name(@bank).downcase)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @bank.update(bank_params)
      redirect_to banks_path,
        success: I18n.t('flash.update', model: i18n_model_name(@bank).downcase)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @bank.destroy
      redirect_to banks_path,
        success: I18n.t('flash.destroy', model: i18n_model_name(@bank).downcase)
    end
  end

  def user_has_permission?
    unless %w[cheif client logistic\ manager sales\ manager supply\ manager].include?(current_user.role)
      redirect_to root_path,
        danger: I18n.t('flash.not_permit')
    end
  end

  private
    def define_bank!
      @bank = Bank.find(params[:id])
    end

    def bank_params
      params.require(:bank).permit(:bank_name, :bik, :correspondent_account_number, :swift, :iban, :resident)
    end
end
