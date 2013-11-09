class ItemsController < InheritedResources::Base
  require 'mechanize'

  def index
    @item = Item.new
    @categories = Category.includes(:items)
    index!
  end

  def create
    # need be reimplemented
    
    if params[:item][:kind] == 'link'
      params[:item][:page_title] = get_title
    end

    create! { root_url }
  end

  def update
    update! { root_url }
  end

  def sort
    puts "DasdasdasdasdasD__________________________________________________________"
    params[:item].each_with_index do |id, index|
      Item.update_all({position: index+1}, {id: id})
    end

    render nothing: true
  end

  def color
    @item = Item.find(params[:id])  
    @item.update_column(:color_class, params[:set])

    @categories = Category.includes(:items)

    respond_to do |format|
      format.js
    end
  end

  def non_deletable
    @item = Item.find(params[:id])

    boolean = params[:set] == "true" ? true : false
    @item.update_column(:is_deletable, boolean)

    @categories = Category.includes(:items)

    respond_to do |format|
      format.js
    end
  end

  def hide
    @item = Item.find(params[:id])
    boolean = params[:set] == "true" ? true : false
    @item.update_column(:is_hidden, boolean)

    @categories = Category.includes(:items)

    respond_to do |format|
      format.js
    end
  end

  private

  def permitted_params
    params.permit(:item => [:content, :kind, :page_title, :category_id])
  end

  def collecion
    @items ||= end_of_association_chain.order('position')
  end

  def get_title
    agent = Mechanize.new 
    agent.get(params[:item][:content])
    agent.page.title
  end
end
