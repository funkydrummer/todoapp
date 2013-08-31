class SongsController < InheritedResources::Base
  require 'mechanize'

  def index
    @song = Song.new
    @categories = Category.includes(:songs)
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

  def sort
    params[:song].each_with_index do |id, index|
      Song.update_all({position: index+1}, {id: id})
    end

    render nothing: true
  end

  def color
    @song = Song.find(params[:id])  
    @song.update_column(:color_class, params[:set])

    @categories = Category.includes(:songs)

    respond_to do |format|
      format.js
    end
  end

  def non_deletable
    @song = Song.find(params[:id])

    boolean = params[:set] == "true" ? true : false
    @song.update_column(:is_deletable, boolean)

    @categories = Category.includes(:songs)

    respond_to do |format|
      format.js
    end
  end

  def hide
    @song = Song.find(params[:id])
    boolean = params[:set] == "true" ? true : false
    @song.update_column(:is_hidden, boolean)

    @categories = Category.includes(:songs)

    respond_to do |format|
      format.js
    end
  end

  private

  def collecion
    @songs ||= end_of_association_chain.order('position')
  end

  def get_title
    agent = Mechanize.new 
    agent.get(params[:song][:content])
    agent.page.title
  end
end
