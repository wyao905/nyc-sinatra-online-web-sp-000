class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end
  
  get'/landmarks/new' do
    @titles = Title.all
    @figures = Figure.all
    erb :"/landmarks/new"
  end
  
  post '/landmarks' do
    Landmark.create(params)
  end
end