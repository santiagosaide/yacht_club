class VesselsController < ApplicationController
  def index
    @q = Vessel.ransack(params[:q])
    @vessels = @q.result(:distinct => true).includes(:owners, :docking_space, :members).page(params[:page]).per(10)

    render("vessels/index.html.erb")
  end

  def show
    @owner = Owner.new
    @vessel = Vessel.find(params[:id])

    render("vessels/show.html.erb")
  end

  def new
    @vessel = Vessel.new

    render("vessels/new.html.erb")
  end

  def create
    @vessel = Vessel.new

    @vessel.name = params[:name]
    @vessel.lenght = params[:lenght]
    @vessel.brand = params[:brand]
    @vessel.construction_date = params[:construction_date]
    @vessel.model = params[:model]
    @vessel.city = params[:city]
    @vessel.country_of_origin = params[:country_of_origin]
    @vessel.propulsion = params[:propulsion]

    save_status = @vessel.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/vessels/new", "/create_vessel"
        redirect_to("/vessels")
      else
        redirect_back(:fallback_location => "/", :notice => "Vessel created successfully.")
      end
    else
      render("vessels/new.html.erb")
    end
  end

  def edit
    @vessel = Vessel.find(params[:id])

    render("vessels/edit.html.erb")
  end

  def update
    @vessel = Vessel.find(params[:id])

    @vessel.name = params[:name]
    @vessel.lenght = params[:lenght]
    @vessel.brand = params[:brand]
    @vessel.construction_date = params[:construction_date]
    @vessel.model = params[:model]
    @vessel.city = params[:city]
    @vessel.country_of_origin = params[:country_of_origin]
    @vessel.propulsion = params[:propulsion]

    save_status = @vessel.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/vessels/#{@vessel.id}/edit", "/update_vessel"
        redirect_to("/vessels/#{@vessel.id}", :notice => "Vessel updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Vessel updated successfully.")
      end
    else
      render("vessels/edit.html.erb")
    end
  end

  def destroy
    @vessel = Vessel.find(params[:id])

    @vessel.destroy

    if URI(request.referer).path == "/vessels/#{@vessel.id}"
      redirect_to("/", :notice => "Vessel deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Vessel deleted.")
    end
  end
end
