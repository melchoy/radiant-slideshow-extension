module Slideshow::SlideTags
  include Radiant::Taggable

  desc %{ }
  tag 'slides' do |tag|
    tag.locals.slides = Slide.find(:all)
    tag.expand
  end

  desc %{ }
  tag 'slides:each' do |tag|
    result = []
    tag.locals.slides.each_with_index do |item, i|
      tag.locals.slide = item
      tag.locals.first_slide = i == 0
      tag.locals.last_slide = i == tag.locals.slides.length - 1
      result << tag.expand
    end
    result
  end
  
  desc %{ }
  tag 'slide' do |tag|
    tag.expand
  end
  
  desc %{ }
  tag 'slide:image_link' do |tag|
    slide = tag.locals.slide
    "<a href='#{slide.url}'><img src='#{slide.slide_image.url(:normal)}' alt='#{slide.name}' /></a>"
  end
  
  desc %{ }
  tag 'slide:url' do |tag|
    tag.locals.slide.url
  end
  
  desc %{ }
  tag 'slide:image' do |tag|
    image_size = tag.attr["size"] ? tag.attr["size"].to_sym : :normal  
    tag.locals.slide.slide_image.url(image_size)
  end
  
end