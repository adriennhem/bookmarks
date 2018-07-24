class SearchController < ApplicationController
  def index
  	@q = params['q']
    return if @q.blank?
    @hits = Bookmark.algolia_search(@q)
  end
end
