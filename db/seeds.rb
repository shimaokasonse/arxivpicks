require 'rexml/document'

doc = REXML::Document.new(open("db/seeds.xml"))
doc.elements.each('feed/entry') do |element|
  title = element.elements["title"].text.split().join(" ")
  abstract = element.elements["summary"].text.split().join(" ")
  category = element.elements["arxiv:primary_category"].attributes["term"]
  date = element.elements["published"].text
  url = element.elements["link"].attributes["href"]
  # create
  paper = Paper.where(title: title).first_or_initialize
  paper.abstract = abstract
  paper.category = category
  paper.date = date
  paper.url = url
  paper.save

  i = 0
  Publish.where(paper_id: paper.id).destroy_all
  element.elements.each("author") do |author|
    name = author.elements["name"].text
    author = Author.where(name: name).first_or_initialize
    author.save
    publish = Publish.new(author_id: author.id, paper_id: paper.id, order: i)
    publish.save
    i += 1
  end
end