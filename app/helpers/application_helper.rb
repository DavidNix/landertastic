module ApplicationHelper

  def site_title
    AdminSettings.first.try(:site_name) || "Change Me In Settings"
  end
end
