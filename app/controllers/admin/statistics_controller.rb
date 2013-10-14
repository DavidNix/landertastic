class Admin::StatisticsController < AuthenticatedController

  def index
    @statistics = StatPresenter.new
  end

  def destroy
    [Hit, Lead].map(&:destroy_all)
    flash[:notice] = "Statistics successfully reset."
    redirect_to admin_statistics_path
  end
end
