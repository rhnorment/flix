module UsersHelper

  def submit_name(user)
    user.new_record? ? 'Create User' : 'Update Account'
  end

  def profile_image_for(user, options={})
    size = options[:size] || 80
    url = "https://secure.gravatar.com/avatar/#{user.gravatar_id}?s=#{size}"
    image_tag url, alt: user.name
  end

end
