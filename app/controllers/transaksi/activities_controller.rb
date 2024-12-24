class Transaksi::ActivitiesController < ApplicationController
  def create
    begin
      ActiveRecord::Base.transaction do
        Activity.transaction do
          activity = Activity.new
          activity.nama_aktifitas = params[:nama_aktifitas]
          activity.disipline_id = params[:disiplin]
          if activity.save
            render json:{
              status: 200
            }
            flash[:notice] = "Data berhasil disimpan"
          else
            render json:{
              status: 500,
              msg: activity.errors
            }
            txError(activity.errors.to_json)
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
        activity = Activity.find_by_id(params[:id_aktifitas])
        activity.nama_aktifitas = params[:nama_aktifitas]
        activity.disipline_id = params[:disiplin]
        if activity.save
          render json: { 
            status: 200
          }
          flash[:notice] = "Data berhasil disimpan"
        else
          render json: { 
            status: 500,
            msg: activity.errors
          }
          txError(activity.errors.to_json)
        end
      end
    rescue StandardError => e
      txError(e)
    end
  end 

  def delete
    @data = Activity.find(params[:id]).destroy
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
    @data = Activity.find(params[:id])
    @disipline = Disipline.all
    render json:{
      status: 200,
      data: @data,
      disiplin: @disipline
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