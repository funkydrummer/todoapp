class SongsController < InheritedResources::Base

  def index
    @song = Song.new
    index!
  end
  
  def create
    params[:song][:kind] = params[:song][:kind].downcase
    create! { root_url }
  end

end
