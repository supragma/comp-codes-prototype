module ProfileHelper
  def show_website(website)
    if website.include?("http")
      return website
    else
      return "https://" + website
    end
  end
end
