require "radiant-slideshow-extension"

class SlideshowExtension < Radiant::Extension
  version     RadiantSlideshowExtension::VERSION
  description RadiantSlideshowExtension::DESCRIPTION
  url         RadiantSlideshowExtension::URL

  def missing_image_dir 
    "/images/slideshow"
  end

  def activate
    
    tab 'Content' do
      add_item "Slides", "/admin/slides", :after => "Pages"
    end
    
    # Custom Slideshow Tags
    Page.send :include, Slideshow::SlideTags
    
  end
end
