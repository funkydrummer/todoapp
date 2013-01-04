class SongsController < InheritedResources::Base

  def index
    @song = Song.new
    @links = Song.where(:kind => 'link')
    @todos = Song.where(:kind => 'todo')
    @joints = Song.where(:kind => 'joint')
    index!
  end
  
  def create
    params[:song][:kind] = params[:song][:kind].downcase
    create! { root_url }
  end

  def update
    raise params.inspect
    params[:song][:kind] = params[:song][:kind].downcase
    update! { root_url }
  end

end
