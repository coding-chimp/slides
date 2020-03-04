class PresentationController < ApplicationController
  def index
    presentations = Presentation.all

    render "index.slang"
  end

  def show
    presentation = Presentation.find!(params[:id])

    render "show.slang", layout: "presentation.slang"
  end

  def new
    presentation = Presentation.new

    render "new.slang"
  end

  def edit
    presentation = Presentation.find!(params[:id])

    render "edit.slang"
  end

  def create
    presentation = Presentation.new(presentation_params.validate!)

    if presentation.save
      redirect_to action: :index, flash: {"success" => "Presentation has been created."}
    else
      flash[:danger] = "Could not create Presentation!"
      render "new.slang"
    end
  end

  def update
    presentation = Presentation.find!(params[:id])
    presentation.set_attributes(presentation_params.validate!)

    if presentation.save
      redirect_to "/", flash: {"success" => "Presentation has been updated."}
    else
      flash[:danger] = "Could not update Presentation!"
      render "edit.slang"
    end
  end

  def destroy
    presentation = Presentation.find!(params[:id])
    presentation.destroy

    redirect_to "/", flash: {"success" => "Presentation has been deleted."}
  end

  private def presentation_params
    params.validation do
      required(:title, allow_blank: true)
      required(:body, allow_blank: true)
    end
  end
end
