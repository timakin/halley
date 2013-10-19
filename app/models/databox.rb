class Databox < ActiveRecord::Base
  mount_uploader :data, DataUploader


end
