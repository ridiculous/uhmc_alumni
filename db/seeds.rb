# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

enter_username = "sudo"
enter_password = "sud0mgr"
s = BCrypt::Engine.generate_salt
pw = BCrypt::Engine.hash_secret(enter_password, s)
u = User.new(
     :username => enter_username,
     :first_name => "Super",
     :last_name => "User",
     :role => "superuser",
     :email => "uhmchelp@hawaii.edu",
     :alumni_id => "",
     :pw_not_being_updated => 0
)
u.password_hash = pw
u.salt = s
u.save