class Listing < ActiveRecord::Base 
	if Rails.env.development?
		has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, 
						 :url  => "/system/listings/images/000/000/00:id/:style/:basename.:extension",
                  		:path => ":rails_root/public/assets/listings/:id/:style/:basename.:extension"
	else
		has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg", 
							:storage => :dropbox, 
							:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
							:path => ":style/:id_:filename"
	end

	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	validates :name, :description, :duration, :location, presence: true
	# validates :price, numericality: { greater_than: 0}
	validates :image, :attachment_presence => true

	belongs_to :user
	has_many :orders
end