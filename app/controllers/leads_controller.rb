class LeadsController < ApplicationController

  def create
    Lead.create(lead_params)
    head :ok
  end

  private

  def lead_params
    params.require(:lead).permit(:email)
  end
end
