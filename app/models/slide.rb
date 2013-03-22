class Slide < ActiveRecord::Base

  # TODO: If this is going to be reused in other projects... add s3 support

  has_attached_file :slide_image, 
                    :default_style => :normal,
                    :default_url => SlideshowExtension.missing_image_dir + "/:style.gif",
                    :styles => { :normal => "640x426#",
                                 :thumb => "100x100#",
                                 :tiny => "50x50#" },
                    :url => Radiant.config["paperclip.url"],
                    :path => Radiant.config["paperclip.path"]                                          
                                 
  
  def url
    url = (self.link.nil? || self.link.empty?) ? Radiant::Config['slideshow.default_link'] : self.link    
    url
  end
  
end
