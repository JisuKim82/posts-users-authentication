class UserPost < ActiveRecord::Base
  PERMISSIONS = {
    admin: 0,
    edit: 10,
    read: 20
  }
  belongs_to :user
  belongs_to :post

  def editable?
    true if self.permission <= PERMISSIONS[:edit]
  end

  def readable?
    true if self.permission <= PERMISSIONS[:read]
  end
end
