class Admin::SlidesController < Admin::ResourceController
  paginate_models
  
  def create
    @slide = Slide.create(params[:slide])
    respond_to do |format|
        if @slide.save
          format.html  { redirect_to(admin_slide_url(@slide), :notice => 'Slide was successfully created.') }
        else
          format.html  { render :action => "new" }
        end
      end
  end  
  
end
