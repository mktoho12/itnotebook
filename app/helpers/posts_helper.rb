module PostsHelper
  def post_bg_image(post)
    return '' unless post.image.attached?
    url = post_image_url(post, '100x100')
    "background-image: url(#{url})"
  end

  def post_image_url(post, size = nil)
    image = post.image
    image = image.variant(resize: size) if size
    rails_representation_url image
  end
end
