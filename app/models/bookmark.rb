class Bookmark < ApplicationRecord
  include AlgoliaSearch
  before_create :update_thumbnail

  algoliasearch do
    attribute :title, :url, :created_at, :description, :favicon, :image
  end

  def update_thumbnail
  	link = LinkThumbnailer.generate(self.url)
  	self.title = link.title
  	self.description = link.description
  	self.favicon = link.favicon
  	self.image = link.images.first.src.to_s
  end
end
