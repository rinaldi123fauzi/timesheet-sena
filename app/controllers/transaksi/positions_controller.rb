class Transaksi::PositionsController < ApplicationController
  def create
    begin
      ActiveRecord::Base.transaction do
        Position.transaction do
          position = Position.new
          position.nama_posisi = params[:nama_posisi]
          position.disipline_id = params[:disiplin]
          if position.save
            render json:{
              status: 200
            }
            flash[:notice] = "Data berhasil disimpan"
          else
            render json:{
              status: 500,
              msg: position.errors
            }
            txError(position.errors.to_json)
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
        posisi = Position.find_by_id(params[:id_posisi])
        posisi.nama_posisi = params[:nama_posisi]
        posisi.disipline_id = params[:disiplin]
        if posisi.save
          render json: { 
            status: 200
          }
          flash[:notice] = "Data berhasil disimpan"
        else
          render json: { 
            status: 500,
            msg: posisi.errors
          }
          txError(posisi.errors.to_json)
        end
      end
    rescue StandardError => e
      txError(e)
    end
  end 

  def delete
    @data = Position.find(params[:id]).destroy
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
    @data = Position.find(params[:id])
    @disiplines = Disipline.all
    render json:{
      status: 200,
      data: @data,
      disiplines: @disiplines
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