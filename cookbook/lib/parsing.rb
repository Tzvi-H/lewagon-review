require "nokogiri"
file = "strawberry.html"
doc = Nokogiri::HTML(File.open(file), nil, "utf-8")

elements = doc.search('.card__detailsContainer')

elements.first(5).each do |element|
  name = element.search('.card__title').text.strip
  puts name

  description = element.search('.card__summary').text.strip
  puts description
end
