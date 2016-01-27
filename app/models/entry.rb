class Entry < ActiveRecord::Base
  belongs_to :admin

	extend FriendlyId
	friendly_id :title, use: [:slugged, :finders]

	validates :slug, presence: true,  uniqueness: true


	scope :published, -> { where('published_at <= ?', Time.zone.now) }

	def to_param
  	 slug
	end



end
