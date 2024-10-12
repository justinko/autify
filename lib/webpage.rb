class Webpage
  def initialize(url)
    @url = clean_url(url)
  end

  def links_count
    Nokogiri::HTML(body).css("a").count
  end

  def images_count
    Nokogiri::HTML(body).css("img").count
  end

  def body
    response.body.to_s
  end

  private

  def response
    # TODO: use the HTTPX `retries` plugin
    @response ||= HTTPX.plugin(:follow_redirects).get(@url)
  end

  def clean_url(url)
    url.prepend("https://") unless url.starts_with?("http")
    URI.parse(url).to_s
  end
end
