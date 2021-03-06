class Databox < ActiveRecord::Base
  acts_as_commentable
  mount_uploader :data, DataUploader
	before_save :check_file_content
	def check_file_content
		content_list = ["text/csv"]
		content_list.include?(self.content_type)
	end
end
