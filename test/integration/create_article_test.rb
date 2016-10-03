require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest
  
def setup
  @user = User.create(username:"john", email:"john@example.com", password:"password", admin:false)
end

test "successfully create new article" do
  sign_in_as(@user, "password")
  get new_article_path
  assert_template 'articles/new'
  assert_difference 'Article.count', 1 do
  post_via_redirect articles_path, article:{title:"test article",description:"test article description"}
  end
  assert_template 'articles/show'
  assert_match 'test article', response.body
end

end