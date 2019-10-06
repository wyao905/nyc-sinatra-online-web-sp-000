class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end
  
  get '/landmarks/new' do
    @titles = Title.all
    @figures = Figure.all
    erb :"/landmarks/new"
  end
  
  post '/landmarks' do
    Landmark.create(params[:landmark])
    redirect "/landmarks"
  end
  
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    binding.pry
    erb :"/landmarks/edit"
  end
  
  patch '/landmarks/:id' do
    
  end
  
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/show"
  end
end