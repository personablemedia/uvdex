class Vehicle < ActiveRecord::Base

	has_many :vehicle_photos, dependent: :destroy
	before_save :set_is_used, :set_published

	scope :published, ->{ where(published: true) }

	def set_is_used
		self.is_used = (new_used =~ /u/i) ? true : false
		true
	end

	def set_published
		self.published = vehicle_photos.any?
		true
	end

end
