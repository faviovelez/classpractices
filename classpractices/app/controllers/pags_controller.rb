class PagsController < ApplicationController
  def index
  end

  def form
    @hospital = Hospital.new
  end

  def form_post
    if params[:hospital][:name].present? && params[:hospital][:address].present? && params[:hospital][:age].present? && params[:hospital][:social_security_n].present?
      a = params[:hospital][:age].split('-').map{ |x| x.to_i }
      @hospital = Hospital.create(name: params[:hospital][:name], fed_id: params[:hospital][:fed_id], address: params[:hospital][:address], age: ((Date.today - Date.new(a[0], a[1], a[2])) /365).to_i, phone: params[:hospital][:phone], social_security_n: params[:hospital][:social_security_n])
      count_ages
      redirect_to pags_form_path, alert: "Los datos han sido guardados con éxito, gracias por registrarse. #{@message}"
    else
      redirect_to pags_form_path, alert: 'Hizo falta un dato, por favor ingrese Nombre, dirección, edad y Número de IMSS'
    end
  end

  def count_ages
    b = Hospital.all.group_by{|u| u.age }
    @message = 'Hay '
    (b.length).times do |n|
      @message << "#{b.values[n].count} persona(s) con #{b.keys[n]} años. "
    end
  end

end
