class PetsController < ApplicationController

  get '/pets' do
    if logged_in?
      if current_user.class == Owner
        erb :'pets/pets'
      else
        redirect '/dashboard'
      end
    else
      redirect '/login'
    end
  end

  get '/pets/new' do
    if logged_in?
      if current_user.class == Owner
        erb :'pets/new'
      else
        redirect '/dashboard'
      end
    else
      redirect '/login'
    end
  end

  get '/pets/:id' do
    if logged_in?
      @pet = Pet.find_by(id: params[:id])
      if @pet && current_user.class == Owner && current_user.pets.include?(@pet)
        erb :'pets/show'
      else
        redirect '/pets'
      end
    else
      redirect '/login'
    end
  end

  get '/pets/:id/edit' do
    if logged_in?
      @pet = Pet.find_by(id: params[:id])
      if current_user.class == Owner && current_user.pets.include?(@pet)
        erb :'pets/edit'
      else
        redirect '/pets'
      end
    else
      redirect '/login'
    end
  end

  get '/pets/:id/delete' do
    if logged_in?
      @pet = Pet.find_by(id: params[:id])
      if current_user.class == Owner && current_user.pets.include?(@pet)
        erb :'pets/delete'
      else
        redirect '/pets'
      end
    else
      redirect '/login'
    end
  end

  post '/pets' do
    if logged_in?
      pet = Pet.create(params[:pet])
      if pet && current_user.class == Owner
        pet.update(owner: current_user)
      else
        redirect '/pets/new'
      end
      redirect '/pets'
    else
      redirect '/login'
    end
  end

  patch '/pets/:id' do
    if logged_in?
      pet = Pet.find_by(id: params[:id])
      if pet && current_user.class == Owner && current_user.pets.include?(pet)
        pet.update(params[:pet])
        redirect "/pets/#{pet.id}"
      else
        redirect "/pets/#{pet.id}/edit"
      end
    else
      redirect '/login'
    end
  end

  delete '/pets/:id/delete' do
    if logged_in?
      pet = Pet.find_by(id: params[:id])
      if pet && current_user.class == Owner && current_user.pets.include?(pet)
        pet.delete
        redirect '/pets'
      else
        redirect "/pets/#{pet.id}"
      end
    else
      redirect '/login'
    end
  end

end
