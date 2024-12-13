class Transaksi::DisiplinesController < ApplicationController
  def create
    begin
      ActiveRecord::Base.transaction do
        Disipline.transaction do
          disiplin = Disipline.new
          disiplin.nama_disiplin = params[:nama_disiplin]
          disiplin.division_id = params[:divisi]
          disiplin.department_id = params[:departemen]
          if disiplin.save
            render json:{
              status: 200
            }
            flash[:notice] = "Data berhasil disimpan"
          else
            render json:{
              status: 500,
              msg: disiplin.errors
            }
            txError(disiplin.errors.to_json)
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
        disiplin = Disiplin.find_by_id(params[:id_disiplin])
        disiplin.nama_disiplin = params[:nama_disiplin]
        disiplin.division_id = params[:divisi]
        disiplin.department_id = params[:departemen]
        if disiplin.save
          render json: { 
            status: 200
          }
          flash[:notice] = "Data berhasil disimpan"
        else
          render json: { 
            status: 500,
            msg: disiplin.errors
          }
          txError(disiplin.errors.to_json)
        end
      end
    rescue StandardError => e
      txError(e)
    end
  end 

  def delete
    @data = Disiplin.find(params[:id]).destroy
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
    @data = Disipline.find(params[:id])
    @divisions = Division.all
    @departments = Department.all
    render json:{
      status: 200,
      data: @data,
      divisions: @divisions,
      departments: @departments
    }, status: 200
  end

  def divisions
    @data = Division.order(:nama_divisi => :asc)
    render json:{
      status: 200,
      data: @data
    }, status: 200
  end

  def departments
    @data = Department.order(:nama_department => :asc)
    render json:{
      status: 200,
      data: @data
    }, status: 200
  end
end