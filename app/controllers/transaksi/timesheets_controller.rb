class Transaksi::TimesheetsController < ApplicationController
  def create
    begin
      ActiveRecord::Base.transaction do
        Project.transaction do
          proyek = Project.new
          proyek.nama_proyek = params[:nama_proyek]
          proyek.position_id = params[:posisi]
          proyek.disipline_id = params[:disiplin]
          if proyek.save
            render json:{
              status: 200
            }
            flash[:notice] = "Data berhasil disimpan"
          else
            render json:{
              status: 500,
              msg: proyek.errors
            }
            txError(proyek.errors.to_json)
          end
        end
      end
    rescue StandardError => e
      txError(e)
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