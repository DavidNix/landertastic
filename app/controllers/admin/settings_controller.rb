class Admin::SettingsController < AuthenticatedController

  def edit
    @settings = AdminSettings.first
  end

  def update
    @settings = AdminSettings.first
    if @settings.update_attributes(admin_params)
      flash[:notice] = "Your settings were successfully changed!"
      redirect_to edit_admin_settings_path
    else
      flash[:alert] = @settings.errors.messages
      #flash[:alert] = "Sorry, something went wrong saving your settings."
      render :edit
    end
  end

  private

  def admin_params
    params.require(:admin_settings).permit(:site_name, :email)
  end
end
