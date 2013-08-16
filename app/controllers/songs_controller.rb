class SongsController < InheritedResources::Base
  require 'mechanize'

  def index
    @song = Song.new
    index!
  end
  
  def create
    # need be reimplemented
    if params[:song][:kind] == 'link'
      params[:song][:page_title] = get_title
    end
    
    create! { root_url }
  end

  def update
    update! { root_url }
  end

  private
  def get_title
    agent = Mechanize.new 
    agent.get(params[:song][:content])
    agent.page.title
  end
end
