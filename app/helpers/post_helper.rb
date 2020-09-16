module PostHelper
  def get_contractor_profile_id(user)
    puts "HELPER"
    puts user.id
    puts "END"
    profile = Profile.find_by_user_id(user.id) 
    profile.id
  end
end
