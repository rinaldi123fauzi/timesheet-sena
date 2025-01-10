class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    update_attrs = [:password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

  def convertHari(value)
    case value
    when 1
      @hari = 'Senin'
    when 2
      @hari = 'Selasa'
    when 3
      @hari = 'Rabu'
    when 4
      @hari = 'Kamis'
    when 5
      @hari = "Jum'at"
    when 6
      @hari = 'Sabtu'
    else
      @hari = 'Minggu'
    end
    return @hari
  end

  def convertBulan(value)
    case value
    when 1
      @bulan = 'Januari'
    when 2
      @bulan = 'Februari'
    when 3
      @bulan = 'Maret'
    when 4
      @bulan = 'April'
    when 5
      @bulan = 'Mei'
    when 6
      @bulan = 'Juni'
    when 7
      @bulan = 'Juli'
    when 8
      @bulan = 'Agustus'
    when 9
      @bulan = 'September'
    when 10
      @bulan = 'Oktober'
    when 11
      @bulan = 'November'
    else
      @bulan = 'Desember'
    end
    return @bulan
  end
end
