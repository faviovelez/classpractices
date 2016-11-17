class PagsController < ApplicationController
  def index
  end

  def form
    @imss = Imss.new
  end

  def form_post
    if params[:imss][:nombre].present? && params[:imss][:direccion].present? && params[:imss][:edad].present? && params[:imss][:no_imss].present?
      @imss = Imss.create(nombre: params[:imss][:nombre], curp: params[:imss][:curp], direccion: params[:imss][:direccion], edad: params[:imss][:edad], telefono: params[:imss][:telefono], no_imss: params[:imss][:no_imss])
      redirect_to pags_form_path, alert: 'Los datos han sido guardados con éxito, gracias por registrarse'
    else
      redirect_to pags_form_path, alert: 'Hizo falta un dato, por favor ingrese Nombre, dirección, edad y Número de IMSS'
    end
  end

end
