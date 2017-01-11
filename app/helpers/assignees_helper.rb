module AssigneesHelper

  # Returns a dynamic path based on the provided parameters
  def sti_assignee_path(type = "assignee", assignee = nil, action = nil)
    send "#{format_sti(action, type, assignee)}_path", assignee
  end

  def format_sti(action, type, assignee)
    action || assignee ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_" : ""
  end

end
