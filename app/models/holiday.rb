# == Schema Information
#
# Table name: holidays
#
#  id            :bigint           not null, primary key
#  tanggal_libur :date
#  nama_libur    :string
#  status        :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Holiday < ApplicationRecord
  def import
    year = Time.current.strftime('%Y')
    for a in 1..12 do
      url = "https://api-harilibur.vercel.app/api?month=#{a}&year=#{year}"
      @postReceive = RestClient::Request.execute(:url => "#{url}", 
          :method => "GET", 
          :verify_ssl => false,
          headers: { 
            content_type: :json, 
            accept: :json
          },
          timeout: 2
      )
      # https://stackoverflow.com/questions/52016886/setting-timeout-for-response-for-api-connection
      @ReceiveResponse = JSON.parse(@postReceive)
      @ReceiveResponse.each do |data|
        tanggalLibur = data['holiday_date']
        namaLibur = data['holiday_name']
        statusLibur = data['is_national_holiday']
        if statusLibur == true
          check = Holiday.where('tanggal_libur = ?', tanggalLibur)
          if check.count < 1
            createHoliday = Holiday.new
            createHoliday.tanggal_libur = tanggalLibur
            createHoliday.nama_libur = namaLibur
            createHoliday.status = statusLibur
            createHoliday.save
          end
        end
      end
    end
  end
end
