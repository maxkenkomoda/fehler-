module UsersHelper
  def gravatar_url(user, options = { size: 80})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  end
  
  
  def cal_birthday
    @birthday = @user.birthday.strftime("%Y%m%d").to_i
    @now = Date.today.strftime("%Y%m%d").to_i
    
    @age = ( @now - @birthday ) /10000
    
    p @age
  end
  
  def gender_system
    @gender = @user.gender
    
    if @gender == 1
      p '男性'
    else
      p '女性'
    end
  end
end



