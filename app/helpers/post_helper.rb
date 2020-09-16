module PostHelper
  def get_contractor_profile_id(user)
    profile = Profile.find_by_user_id(user.id) 
    profile.id
  end
end
