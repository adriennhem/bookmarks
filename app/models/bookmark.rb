class Bookmark < ApplicationRecord
  include AlgoliaSearch
  before_create :update_thumbnail

  belongs_to :user

  algoliasearch do
    attribute :title, :url, :created_at, :description, :favicon, :image, :viewable_by

    attributesForFaceting [
    'filterOnly(viewable_by)'
  ]
  end

  def update_thumbnail
  	link = LinkThumbnailer.generate(self.url)
  	self.title = link.title
  	self.description = link.description
  	self.favicon = link.favicon
  	self.image = link.images.first.src.to_s
  end
end
