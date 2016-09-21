module ApplicationHelper

  def gravatar_for(user, options = { size: 80}) # 80 default if no opt passed in
    # create the md5 hash
    hash = Digest::MD5.hexdigest(user.email.downcase)
    
    size = options[:size]
    # compile URL which can be used in <img src="RIGHT_HERE"...
    image_src = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    
    #generate image tag
    image_tag(image_src, alt: user.username, class: "img-circle")
  end

end