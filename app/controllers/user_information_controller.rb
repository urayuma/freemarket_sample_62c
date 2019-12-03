class UserInformationController < ApplicationController
  def update
    user_information = UserInformation.find_by(user: current_user)
    user_information.update(info_params)
    redirect_to controller: :mypages, action: :identification
  end

  private

  def info_params
    params.require(:user_information).permit(:postcode, :prefectures, :city, :street_num, :building)
  end
end
