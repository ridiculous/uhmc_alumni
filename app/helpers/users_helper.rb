module UsersHelper

  def find_correct_partial(role)
    if role == "admin"
      id = "admin-user"
      other_id = "alumni-user"
      other_role = "alumni"
    else
      id = "alumni-user"
      other_id = "admin-user"
      other_role = "admin"
    end
    styled = "display:block"
    other_style = "display:none"
    content_tag(:div, :id => id, :style => styled) do
      render :partial => role
    end +
      content_tag(:div, :id => other_id, :style => other_style) do
      render :partial => other_role
    end
    #The "+" sign concatenates both content_tags so the helper returns the required two divs
  end

end
