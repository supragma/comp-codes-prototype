module ProfileHelper
  def show_website(website)
    if website.include?("http")
      return website
    else
      return "https://" + website
    end
  end

  def first_name(ref)
    User.find_by_id(ref.user_id).first_name
  end
end
