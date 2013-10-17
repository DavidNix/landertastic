class Admin::SettingsController < AuthenticatedController

  def index
    @settings = AdminSettings.first
  end

  def update
    if AdminSettings.first.update_attributes(admin_params)
      flash.now[:notice] = "Your settings were successfully changed!"
    else
      flash.now[:alert] = "Sorry, something went wrong saving your settings."
    end
    render :index
  end

  private

  def admin_params
    params.require(:admin_settings).permit(:site_name, :email)
  end
end
