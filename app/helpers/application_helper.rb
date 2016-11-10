module ApplicationHelper

  def header_login
    if current_user.present?
      link_to('Logout', logout_path)
    else
      link_to('Login', login_path)
    end
  end

end
