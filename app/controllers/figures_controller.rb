class FiguresController < ApplicationController
  # add controller methods
    get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end
  
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"/figures/new"
  end
  
  post '/figures' do
    figure = Figure.create(params[:figure])
    figure.landmarks << Landmark.create(params[:landmark])
    figure.titles << Title.create(params[:title])
    redirect "/figures"
  end
  
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end
  
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end
  
  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]
    @figure.landmarks << Landmark.create(params[:landmark])
    @figure.titles << Title.create(params[:title])
    @figure.save
    redirect "/figures/#{params[:id]}"
  end
end
