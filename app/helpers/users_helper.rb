module UsersHelper
  def form_url_path(record)
    record.new_record? ? create_user_path : user_path(record)
  end

  def form_title(record)
    t(record.new_record? ? 'users.new.title' : 'users.edit.title')
  end
end
