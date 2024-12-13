class Transaksi::ProjectsController < ApplicationController
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

  def positions
    @data = Position.order(:nama_posisi => :asc)
    render json:{
      status: 200,
      data: @data
    }, status: 200
  end

  def disiplines
    @data = Disipline.order(:nama_disiplin => :asc)
    render json:{
      status: 200,
      data: @data
    }, status: 200
  end
end