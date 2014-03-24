class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_length_of :content, :maximum => 200

  belongs_to :user
  has_many :user_posts

  def editable_by?(current_user)
    user_posts.where(:user => current_user).first.try(:editable?)
  end

  def readable_by?(current_user)
    user_posts.where(:user => current_user).first.try(:readable?)
  end

end
