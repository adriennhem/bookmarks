class Bookmark < ApplicationRecord
  include AlgoliaSearch
  before_create :update_title

  algoliasearch do
    attribute :title, :url
  end

  def update_title
  	self.title = LinkThumbnailer.generate(self.url).title
  end
end
