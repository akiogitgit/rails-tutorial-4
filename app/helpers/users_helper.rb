module UsersHelper
  # ユーザーと画像を紐づける？
  # userのemailをハッシュ化して、一意のidとして画像を取得
  # def gravatar_for(user, option = { size:80 })
  def gravatar_for(user, size: 80)
    # size = option[:size]
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end

# user.update(name:"example",email:"",password:"example",password_confirmation:"example")