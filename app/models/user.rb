# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  username   :string(255)
#  password   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base

	username_regex = /\A[\w+\d]+\z/i
	validates :username, :presence => true,
	                 :length => {:maximum => 20},
	                 :format => {:with => username_regex},
	                 :uniqueness => {:case_sensitive => false}

	validates :password, :presence => true,
	                 :length => {:within => 6..20 }


	 
 	def User.authenticate(username,submitted_password)
 		user = find_by_username(username)
 		(user && user.password==submitted_password) ? user : nil
 		# return nil if user.nil?
 		# return user if user.password==submitted_password
 	end

	 	#private

end
