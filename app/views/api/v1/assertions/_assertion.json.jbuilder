json.key_format! camelize: :lower
json.(assertion, :url, :text, :created_at)
json.status assertion.passed? ? "PASS" : "FAIL" # TODO: use I18n
json.num_links assertion.links_count
json.num_images assertion.images_count
