class Transaksi::TimesheetsController < ApplicationController
  def tanggal
    @arrayTime = []
    if params[:tanggal].present?
      tanggal = Time.zone.parse("#{params[:tanggal]}")
      tanggal1 = tanggal.strftime('%Y-%m-%d')
      numberWeek = Date.parse(tanggal1).cweek
      @year = tanggal.strftime('%Y')
      @this_week = tanggal.strftime("#{numberWeek}")
    else
      tanggall = Time.current.strftime('%Y-%m-%d')
      tanggal = Time.zone.parse("#{tanggall}")
      tanggal1 = tanggal.strftime('%Y-%m-%d')
      numberWeek = Date.parse(tanggal1).cweek
      @year = tanggal.strftime('%Y')
      @this_week = tanggal.strftime("#{numberWeek}")
    end
    for a in 1..7 do
      start_week = Date.commercial(@year.to_i, @this_week.to_i, a)
      month = start_week.strftime('%_m')
      year = start_week.strftime('%Y')
      @hari  = convertHari(a)
      @bulan  = convertBulan(month.to_i)
      if a > 5
        @arrayTime.push(
          "hari" => @hari,
          "tanggal_asli" => start_week.strftime('%Y-%m-%d'),
          "tanggal" => start_week.strftime('%d'),
          "bulan" => @bulan,
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
          "hari" => @hari,
          "tanggal_asli" => start_week.strftime('%Y-%m-%d'),
          "tanggal" => start_week.strftime('%d'),
          "bulan" => @bulan,
          "libur" => @status,
          "keterangan" => @status == true ? @holiday.first.nama_libur : ''
        )
      end
    end
    @resultArray = @arrayTime
    render json:{
      status: 200,
      data: @resultArray
    }, status: 200
  end

  def create
    arrayData = []
    arrayStatus = []
    params[:man_hours].each_with_index do |data, index|
      tanggal = Time.zone.parse("#{params[:tanggal][index]}")
      tanggal1 = tanggal.strftime('%Y-%m-%d')
      bulan = tanggal.strftime('%-m')
      numberWeek = Date.parse(tanggal1).cweek
      @year = tanggal.strftime('%Y')
      @this_week = tanggal.strftime("#{numberWeek}")

      arrayData.push(
        'parent_id' => params[:parent_id][index],
        'project_id' => params[:project_id][index],
        'activity_id' => params[:activity_id][index],
        'deskripsi' => params[:deskripsi][index],
        'tanggal' => params[:tanggal][index],
        'week' => @this_week,
        'bulan' => bulan,
        'tahun' => @year,
        'man_hours' => data
      )
    end

    arrayData.each do |data|
      time_current = Time.current
      convert = Time.current.strftime('%Y-%m-%d ') + data['man_hours'] + ":00.000"
      convert1 = Time.zone.parse("#{convert}")
      manHours = (time_current - convert1) / 1.hours
      timesheets = Timesheet.new
      timesheets.user_id = current_user.id
      timesheets.team_project_id = 3
      timesheets.project_id = data['project_id']
      timesheets.activity_id = data['activity_id']
      timesheets.deskripsi = data['deskripsi']
      timesheets.parent_id = data['parent_id']
      timesheets.tanggal = data['tanggal']
      timesheets.week = data['week']
      timesheets.month = data['bulan']
      timesheets.year = data['tahun']
      timesheets.man_hours = manHours
      if !timesheets.save
        arrayStatus.push(500)
      end
    end
    
    jsonStatus = JSON.parse(arrayStatus.to_s)
    if jsonStatus[0] == 500
      render json:{
        status: 500,
        data: arrayData,
        msg: "Mohon form diisi seluruhnya"
      }, status: 500
    else
      # if current_user
      #   createActivity(current_user.email,"Update Data Education")
      # end
      render json:{
        status: 200,
        msg: "Data berhasil disimpan"
      }, status: 200
    end
  end

  def update
    begin
      ActiveRecord::Base.transaction do
        proyek = Project.find_by_id(params[:id_proyek])
        proyek.nama_proyek = params[:nama_proyek]
        proyek.position_id = params[:posisi]
        proyek.disipline_id = params[:disiplin]
        if proyek.save
          render json: { 
            status: 200
          }
          flash[:notice] = "Data berhasil disimpan"
        else
          render json: { 
            status: 500,
            msg: proyek.errors
          }
          txError(proyek.errors.to_json)
        end
      end
    rescue StandardError => e
      txError(e)
    end
  end 

  def delete
    @data = Project.find(params[:id]).destroy
    if (@data)
      render json: {
          success: true,
          status: 200
      }
      flash[:notice] = "Data berhasil dihapus"
    else
      txError(@data.errors.to_json)
    end
  end

  def detail
    @data = Project.find(params[:id])
    @positions = Position.all
    @disiplines = Disipline.all
    render json:{
      status: 200,
      data: @data,
      positions: @positions,
      disiplines: @disiplines
    }, status: 200
  end

  def projects
    @data = Project.order(:nama_proyek => :asc)
    render json:{
      status: 200,
      data: @data
    }, status: 200
  end

  def activitiesTeamProject
    getDisiplin = Project.find(params[:id])
    @data = Activity.where('disipline_id = ?', getDisiplin.disipline_id).order(:nama_aktifitas => :asc) 
    @teamProject = TeamProject.find_by_project_id(params[:id])
    render json:{
      status: 200,
      data: @data,
      team_projects: @teamProject
    }, status: 200
  end
end