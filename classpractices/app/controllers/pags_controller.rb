class PagsController < ApplicationController
  def index
  end

  def form
    @hospital = Hospital.new
  end

  def form_post
    if params[:hospital][:name].present? && params[:hospital][:address].present? && params[:hospital][:age].present? && params[:hospital][:social_security_n].present?
      @hospital = Hospital.create(name: params[:hospital][:name], fed_id: params[:hospital][:fed_id], address: params[:hospital][:address], age: calculate_age, phone: params[:hospital][:phone], social_security_n: params[:hospital][:social_security_n])
      redirect_to pags_form_path, alert: generate_message
    else
      redirect_to pags_form_path, alert: 'Hizo falta un dato, por favor ingrese Nombre, dirección, edad y Número de IMSS'
    end
  end

  def age_date_format
    params[:hospital][:age].split('-').map{ |x| x.to_i }
  end

  def calculate_age
    age_array = age_date_format
    ((Date.today - Date.new(age_array[0], age_array[1], age_array[2])) /365).to_i
  end

  def generate_message
    message = 'Los datos han sido guardados con éxito, gracias por registrarse. Hay '
    Hospital.all.group_by{|u| u.age }.each do |key, value|
      message << "#{value.count} persona(s) con #{key} años. "
    end
    message
  end

end
