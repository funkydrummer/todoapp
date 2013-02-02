class SongsController < InheritedResources::Base
  require 'mechanize'

  def index
    @song = Song.new
    @links = Song.where(:kind => 'link')
    @todos = Song.where(:kind => 'todo')
    @joints = Song.where(:kind => 'joint')
    index!
  end
  
  def create
    params[:song][:kind] = params[:song][:kind].downcase
    
    if params[:song][:kind] == 'link'
      params[:song][:page_title] = get_title
    end
    
    create! { root_url }
  end

  def update
    params[:song][:kind] = params[:song][:kind].downcase
    update! { root_url }
  end

  private
  def get_title
    agent = Mechanize.new 
    agent.get(params[:song][:content])
    agent.page.title
  end
end
