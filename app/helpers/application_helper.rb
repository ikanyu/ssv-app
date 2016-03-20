module ApplicationHelper
  def bootstrap_class_for(flash_type)
    string_for(flash_type)[:class]
  end

  def flash_icon_for(flash_type)
    string_for(flash_type)[:icon]
  end

  def active_if(paths)
    if paths.any? { |path| current_page?(path) }
      'active'
    else
      ''
    end
  end

  private

  def string_for(flash_type)
    case flash_type.to_sym
    when :success, :notice
      { icon: 'check', class: 'alert-success' }
    when :error, :alert
      { icon: 'ban', class: 'alert-danger' }
    when :info
      { icon: 'info', class: 'alert-info' }
    else
      { icon: 'warning', class: 'alert-warning' }
    end
  end
end
