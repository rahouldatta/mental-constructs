module ContentHelper
  def resource_name
    :thinker
  end

  def resource
    @resource ||= Thinker.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:thinker]
  end
end