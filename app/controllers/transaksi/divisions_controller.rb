class Transaksi::DivisionsController < ApplicationController
  def create
    begin
      ActiveRecord::Base.transaction do
        Division.transaction do
          division = Division.new
          division.nama_divisi = params[:nama_divisi]
          if division.save
            render json:{
              status: 200
            }
            flash[:notice] = "Data berhasil disimpan"
          else
            render json:{
              status: 500,
              msg: division.errors
            }
            txError(division.errors.to_json)
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
        division = Division.find_by_id(params[:id_divisi])
        division.nama_divisi = params[:nama_divisi]
        if division.save
          render json: { 
            status: 200
          }
          flash[:notice] = "Data berhasil disimpan"
        else
          render json: { 
            status: 500,
            msg: division.errors
          }
          txError(division.errors.to_json)
        end
      end
    rescue StandardError => e
      txError(e)
    end
  end 

  def delete
    @data = Division.find(params[:id]).destroy
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
    @data = Division.find(params[:id])
    render json:{
      status: 200,
      data: @data
    }, status: 200
  end
end