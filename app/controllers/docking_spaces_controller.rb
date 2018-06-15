class DockingSpacesController < ApplicationController
  def index
    @docking_spaces = DockingSpace.all

    render("docking_spaces/index.html.erb")
  end

  def show
    @docking_space = DockingSpace.find(params[:id])

    render("docking_spaces/show.html.erb")
  end

  def new
    @docking_space = DockingSpace.new

    render("docking_spaces/new.html.erb")
  end

  def create
    @docking_space = DockingSpace.new

    @docking_space.vessell_id = params[:vessell_id]

    save_status = @docking_space.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/docking_spaces/new", "/create_docking_space"
        redirect_to("/docking_spaces")
      else
        redirect_back(:fallback_location => "/", :notice => "Docking space created successfully.")
      end
    else
      render("docking_spaces/new.html.erb")
    end
  end

  def edit
    @docking_space = DockingSpace.find(params[:id])

    render("docking_spaces/edit.html.erb")
  end

  def update
    @docking_space = DockingSpace.find(params[:id])

    @docking_space.vessell_id = params[:vessell_id]

    save_status = @docking_space.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/docking_spaces/#{@docking_space.id}/edit", "/update_docking_space"
        redirect_to("/docking_spaces/#{@docking_space.id}", :notice => "Docking space updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Docking space updated successfully.")
      end
    else
      render("docking_spaces/edit.html.erb")
    end
  end

  def destroy
    @docking_space = DockingSpace.find(params[:id])

    @docking_space.destroy

    if URI(request.referer).path == "/docking_spaces/#{@docking_space.id}"
      redirect_to("/", :notice => "Docking space deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Docking space deleted.")
    end
  end
end
