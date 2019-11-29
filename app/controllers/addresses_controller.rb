class AddressesController < ApplicationController
  before_action :authenticate_user!

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address[:home_call_num] = nil if @address[:home_call_num].empty?
    if @address.save
      redirect_to new_creditcard_path
    else
      render :new
    end
  end

  def update
    params[:address][:home_call_num] = nil if params[:address][:home_call_num].empty?
    @address = Address.update(address_params)
    redirect_to controller: :mypages,action: :address
  end


  private

  def address_params
    params.require(:address).permit(:lastname, :firstname, :lastname_kana, :firstname_kana,
                                    :postcode, :prefectures, :city, :street_num, :building,
                                    :home_call_num).merge(user_id: current_user.id)
  end
end
