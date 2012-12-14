class SongsController < InheritedResources::Base

  def index
    @song = Song.new
    index!
  end
  
  def create
    create! { root_url }
  end

end
