class Session < ActiveRecord::SessionStore::Session
  belongs_to :user
  before_save :ensure_user_is_set

  def self.find_by_session_id(session_id)
    find(:first, :conditions => ["session_id = ?", session_id])
  end

  private
  def ensure_user_is_set
    warden_data = self.data["warden.user.user.key"]
    if warden_data
      user_id = warden_data[1][0]
      self.user = User.find(user_id)
    end
  end
end
