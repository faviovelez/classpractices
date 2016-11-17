class PagsController < ApplicationController
  def index
  end

  def form
    @hospital = Hospital.new
  end

  def form_post
    if params[:hospital][:name].present? && params[:hospital][:address].present? && params[:hospital][:age].present? && params[:hospital][:social_security_n].present?
      @hospital = Hospital.create(name: params[:hospital][:name], fed_id: params[:hospital][:fed_id], address: params[:hospital][:address], age: params[:hospital][:age], phone: params[:hospital][:phone], social_security_n: params[:hospital][:social_security_n])
      redirect_to pags_form_path, alert: 'Los datos han sido guardados con éxito, gracias por registrarse'
    else
      redirect_to pags_form_path, alert: 'Hizo falta un dato, por favor ingrese Nombre, dirección, edad y Número de IMSS'
    end
  end

end
