class AppointmentsController < ApplicationController

  get '/appointments' do
    if logged_in?
      if current_user.class == Owner
        erb :'appointments/owners/appointments'
      else
        erb :'appointments/sitters/appointments'
      end
    else
      redirect '/login'
    end
  end

  get '/appointments/new' do
    if logged_in?
      if current_user.class == Owner
        erb :'appointments/owners/new'
      else
        redirect "/appointments"
      end
    else
      redirect '/login'
    end
  end

  get '/appointments/:id' do
    if logged_in?
      @appt = Appointment.find_by(id: params[:id])
      if @appt && current_user.appointments.include?(@appt) && current_user.class == Owner
        erb :'appointments/owners/show'
      elsif @appt && current_user.appointments.include?(@appt) && current_user.class == Sitter
        erb :'appointments/sitters/show'
      else
        redirect '/appointments'
      end
    else
      redirect '/login'
    end
  end

  get '/appointments/:id/edit' do
    if logged_in?
      @appt = Appointment.find_by(id: params[:id])
      if @appt && current_user.appointments.include?(@appt) && current_user.class == Owner
        erb :'appointments/owners/edit'
      elsif @appt && current_user.appointments.include?(@appt) && current_user.class == Sitter
        erb :'appointments/sitters/edit'
      else
        redirect "/appointments/#{params[:id]}"
      end
    else
      redirect '/login'
    end
  end

  get '/appointments/:id/delete' do
    if logged_in?
      @appt = Appointment.find_by(id: params[:id])
      if @appt && current_user.appointments.include?(@appt) && current_user.class == Owner
        erb :'appointments/owners/delete'
      elsif @appt && current_user.appointments.include?(@appt) && current_user.class == Sitter
        erb :'appointments/sitters/delete'
      else
        redirect "/appointments/#{params[:id]}"
      end
    else
      redirect '/login'
    end
  end

  post '/appointments' do
    if logged_in?
      appt = Appointment.new(params[:appt])
      if appt
        appt.save
      else
        redirect '/appointments/new'
      end
      redirect '/appointments'
    else
      redirect '/login'
    end
  end

  patch '/appointments/:id' do
    if logged_in?
      appt = Appointment.find_by(id: params[:id])
      if appt && current_user.appointments.include?(appt)
        appt.update(params[:appt])
        redirect "/appointments/#{appt.id}"
      else
        redirect "/pets/#{params[:id]}/edit"
      end
    else
      redirect '/login'
    end
  end

  delete '/appointments/:id/delete' do
    if logged_in?
      appt = Appointment.find_by(id: params[:id])
      if appt && current_user.appointments.include?(appt)
        appt.delete
        redirect '/appointments'
      else
        redirect "/appointments/#{params[:id]}"
      end
    else
      redirect '/login'
    end
  end

end
