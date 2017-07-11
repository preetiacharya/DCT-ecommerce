class AddressesController < ApplicationController

  before_action :authenticate_user!

  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
  end
end
