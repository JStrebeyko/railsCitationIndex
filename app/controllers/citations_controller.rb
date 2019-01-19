class CitationsController < ApplicationController
  def index
    @citations = Citation.all
  end
  def show
    @citation = Citation.find(params[:id])
  end
  def new
    @citation = Citation.new
  end

  def edit
    @citation = Citation.find(params[:id])
  end

  def create
    @citation = Citation.new(params.require(:citation).permit(:title, :text))

    if @citation.save
      redirect_to @citation
    else
      render 'new'
    end
  end

  def update
    @citation = Citation.find(params[:id])

    if @citation.update(citation_params)
      redirect_to @citation
    else
      render 'edit'
    end
  end

  def destroy
    @citation = Citation.find(params[:id])
    @citation.destroy

    redirect_to citations_path
  end

# def create
#   render plain: params[:citation].inspect
# end

  private
  def citation_params
    params.require(:citation).permit(:title, :text)
  end
end
