class LeadsController < ApplicationController

  def create
    Lead.create(lead_params)
    head :ok
  end

  def index
    send_data(
        Lead.pluck(:email).join("\n"),
        filename: "leads-#{Time.now.to_i}.txt"
    )
  end

  private

  def lead_params
    params.require(:lead).permit(:email)
  end
end
