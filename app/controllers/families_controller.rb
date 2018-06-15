class FamiliesController < ApplicationController
  def index
    @q = Family.ransack(params[:q])
    @families = @q.result(:distinct => true).includes(:members).page(params[:page]).per(10)

    render("families/index.html.erb")
  end

  def show
    @member = Member.new
    @family = Family.find(params[:id])

    render("families/show.html.erb")
  end

  def new
    @family = Family.new

    render("families/new.html.erb")
  end

  def create
    @family = Family.new

    @family.last_name = params[:last_name]

    save_status = @family.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/families/new", "/create_family"
        redirect_to("/families")
      else
        redirect_back(:fallback_location => "/", :notice => "Family created successfully.")
      end
    else
      render("families/new.html.erb")
    end
  end

  def edit
    @family = Family.find(params[:id])

    render("families/edit.html.erb")
  end

  def update
    @family = Family.find(params[:id])

    @family.last_name = params[:last_name]

    save_status = @family.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/families/#{@family.id}/edit", "/update_family"
        redirect_to("/families/#{@family.id}", :notice => "Family updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Family updated successfully.")
      end
    else
      render("families/edit.html.erb")
    end
  end

  def destroy
    @family = Family.find(params[:id])

    @family.destroy

    if URI(request.referer).path == "/families/#{@family.id}"
      redirect_to("/", :notice => "Family deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Family deleted.")
    end
  end
end
