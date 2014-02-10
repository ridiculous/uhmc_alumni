class User < ActiveRecord::Base
  belongs_to :alumni

  attr_accessible :username, :password, :password_confirmation, :first_name, :last_name, :email, :role, :alumni_id, :pw_not_being_updated
  
  attr_accessor :password, :pw_not_being_updated
  before_save :encrypt_password, :check_role

  validates_confirmation_of :password, :unless => :pw_not_being_updated
  validates_length_of :password, :minimum => 5, :unless => :pw_not_being_updated
  validates :username, :presence => true, :uniqueness => true
  validates :first_name,:last_name,:email, :presence => true
  validates :password, :presence => true, :unless => :pw_not_being_updated
  validates :email, :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i , :message => " must be the format of jdoe@hawaii.edu" }

  #default scope for user queries
  default_scope order("users.username ASC")

  #User role constants
  ROLES = %w[admin alumni superuser]

  def self.authenticate(username, password)
    u = where("username = ?",username).first
    u && u.password_hash == BCrypt::Engine.hash_secret(password, u.salt) ? u : nil
  end

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  #( if alumni ) grab alumni info for user record
  def check_role
    if alumni_id && alum = Alumni.find(alumni_id)
      self.first_name = alum.first_name
      self.last_name = alum.last_name
      self.email = alum.email
    end
    #Unless user role is part of set give it a default
    r = ROLES.dup
    unless r.include?(self.role)
      self.role = "alumni"
    end
  end
  
  def self.get_search_results(users_search, category, current_users_id)
    criteria = '%' + users_search.strip + '%'
    if category.eql?("username")
      where("username like ? and id != ?", criteria, current_users_id)
    elsif category.eql?("role")
      where("role like ? and id != ?", criteria, current_users_id)
    else
      where("email LIKE ? and id != ?", criteria, current_users_id)
    end
  end
 
end
