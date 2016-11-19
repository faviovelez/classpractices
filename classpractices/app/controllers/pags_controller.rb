class PagsController < ApplicationController
  def index
  end

  def form
    @hospital = Hospital.new
  end

  def form_post
    @hospital = Hospital.new(name: params[:hospital][:name], fed_id: params[:hospital][:fed_id], address: params[:hospital][:address], age: convert_to_age, phone: params[:hospital][:phone], social_security_n: params[:hospital][:social_security_n])
    if params[:hospital][:name].present? && params[:hospital][:address].present? && params[:hospital][:age].present? && params[:hospital][:social_security_n].present?
      @hospital.save
      render pags_form_path, alert: gen_message
    else
      render pags_form_path, alert: 'Hizo falta un dato, por favor ingrese Nombre, dirección, edad y Número de IMSS'
    end
  end

  def convert_to_age
    array_age = create_age
    ((Date.today - Date.new(array_age[0], array_age[1], array_age[2])) / 365).to_i
  end

  def create_age
    params[:hospital][:age].split('-').map{ |x| x.to_i }
  end

  def gen_message
    message = 'Los datos han sido guardados con éxito, gracias por registrarse. Hay '
    Hospital.all.group_by{|u| u.age }.each do |key, values|
      message << "#{values.count} persona(s) con #{key} años. "
    end
    message
  end

end
