class TimesheetsController < ApplicationController
  def index
    @arrayTime = []
    numberWeek = 19
    @year = Time.current.strftime('%Y')
    @this_week = Time.current.strftime("#{numberWeek}")
    for a in 1..7 do
      start_week = Date.commercial(@year.to_i, @this_week.to_i, a)
      month = start_week.strftime('%_m')
      year = start_week.strftime('%Y')
      if a > 5
        @arrayTime.push(
          "tanggal" => start_week.strftime('%Y-%m-%d'),
          "weekend" => true
        )
      else
        @holiday = Holiday.where('tanggal_libur = ? and status = ?', start_week.strftime('%Y-%m-%d'), true).order(:tanggal_libur => :asc)
        if @holiday.exists?
          @status = true
        else
          @status = false
        end
        @arrayTime.push(
          "tanggal" => start_week.strftime('%Y-%m-%d'),
          "libur" => @status,
          "keterangan" => @status == true ? @holiday.first.nama_libur : ''
        )
      end
    end
    @resultArray = @arrayTime
  end
end