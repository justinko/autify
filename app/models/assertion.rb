class Assertion < ApplicationRecord
  enum :status, [ :passed, :failed ]

  # TODO: validate the URL is valid
  validates :url, :text, presence: true, on: [ :setup, :create ]
  validates :status, :links_count, :images_count, presence: true, on: :create

  before_validation :assert, on: :create

  private

  def assert
    webpage = Webpage.new(url.dup) # we dup the url to preserve the original

    # TODO: store the entire response so we can use e.g. full-text search
    # TODO: do we want to check just the content of visible nodes or the entire body?
    self.status = webpage.body.downcase.include?(text.downcase) ? :passed : :failed
    self.links_count = webpage.links_count
    self.images_count = webpage.images_count
  end
end
