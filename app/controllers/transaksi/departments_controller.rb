class Transaksi::DepartmentsController < ApplicationController
  def create
    begin
      ActiveRecord::Base.transaction do
        Department.transaction do
          department = Department.new
          department.nama_department = params[:nama_departemen]
          department.division_id = params[:divisi]
          if department.save
            render json:{
              status: 200
            }
            flash[:notice] = "Data berhasil disimpan"
          else
            render json:{
              status: 500,
              msg: department.errors
            }
            txError(department.errors.to_json)
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
        department = Department.find_by_id(params[:id_departemen])
        department.nama_department = params[:nama_departemen]
        department.division_id = params[:divisi]
        if department.save
          render json: { 
            status: 200
          }
          flash[:notice] = "Data berhasil disimpan"
        else
          render json: { 
            status: 500,
            msg: department.errors
          }
          txError(department.errors.to_json)
        end
      end
    rescue StandardError => e
      txError(e)
    end
  end 

  def delete
    @data = Department.find(params[:id]).destroy
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
    @data = Department.find(params[:id])
    @divisions = Division.all
    render json:{
      status: 200,
      data: @data,
      divisions: @divisions
    }, status: 200
  end

  def divisions
    @data = Division.order(:nama_divisi => :asc)
    render json:{
      status: 200,
      data: @data
    }, status: 200
  end
end