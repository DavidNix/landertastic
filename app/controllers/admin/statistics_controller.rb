class Admin::StatisticsController < AuthenticatedController

  def show
    @statistics = StatPresenter.new
  end

  def destroy
    [Hit, Lead].map(&:destroy_all)
    AdminSettings.first.update_attribute(:experiment_start_date, Time.now)
    flash[:notice] = "Statistics successfully reset."
    redirect_to admin_statistics_path
  end
end
