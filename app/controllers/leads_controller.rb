class LeadsController < ApplicationController

  def create
    lead = Lead.new(lead_params)
    if lead.save
      head :ok
    else
      head status: :unprocessable_entity
    end
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
