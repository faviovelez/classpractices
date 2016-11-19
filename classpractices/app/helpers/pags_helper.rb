module PagsHelper

  def last_age
    if params[:hospital].present?
      return params[:hospital][:age]
    end
    ''
  end
end
