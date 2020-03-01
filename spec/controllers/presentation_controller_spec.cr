require "./spec_helper"

def presentation_hash
  {"title" => "Fake", "body" => "Fake"}
end

def presentation_params
  params = [] of String
  params << "title=#{presentation_hash["title"]}"
  params << "body=#{presentation_hash["body"]}"
  params.join("&")
end

def create_presentation
  model = Presentation.new(presentation_hash)
  model.save
  model
end

class PresentationControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe PresentationControllerTest do
  subject = PresentationControllerTest.new

  it "renders presentation index template" do
    Presentation.clear
    response = subject.get "/presentations"

    response.status_code.should eq(200)
    response.body.should contain("presentations")
  end

  it "renders presentation show template" do
    Presentation.clear
    model = create_presentation
    location = "/presentations/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Presentation")
  end

  it "renders presentation new template" do
    Presentation.clear
    location = "/presentations/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Presentation")
  end

  it "renders presentation edit template" do
    Presentation.clear
    model = create_presentation
    location = "/presentations/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Presentation")
  end

  it "creates a presentation" do
    Presentation.clear
    response = subject.post "/presentations", body: presentation_params

    response.headers["Location"].should eq "/presentations"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a presentation" do
    Presentation.clear
    model = create_presentation
    response = subject.patch "/presentations/#{model.id}", body: presentation_params

    response.headers["Location"].should eq "/presentations"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a presentation" do
    Presentation.clear
    model = create_presentation
    response = subject.delete "/presentations/#{model.id}"

    response.headers["Location"].should eq "/presentations"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
