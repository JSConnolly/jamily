helpers do
  def parse_tags(tags)
    tags.upcase.split(", ").map{|tag_content| Tag.find_or_create_by_content( tag_content )}
  end

end
