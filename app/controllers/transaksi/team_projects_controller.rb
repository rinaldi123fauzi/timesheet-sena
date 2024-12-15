class Transaksi::TeamProjectsController < ApplicationController
  def create
    begin
      ActiveRecord::Base.transaction do
        TeamProject.transaction do
          tim_proyek = TeamProject.new
          tim_proyek.user_id = params[:member]
          tim_proyek.project_id = params[:proyek]
          tim_proyek.pm = params[:pm]
          if tim_proyek.save
            render json:{
              status: 200
            }
            flash[:notice] = "Data berhasil disimpan"
          else
            render json:{
              status: 500,
              msg: tim_proyek.errors
            }
            txError(tim_proyek.errors.to_json)
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
        tim_proyek = TeamProject.find_by_id(params[:id_tim_proyek])
        tim_proyek.user_id = params[:member]
        tim_proyek.project_id = params[:proyek]
        tim_proyek.pm = params[:pm]
        if tim_proyek.save
          render json: { 
            status: 200
          }
          flash[:notice] = "Data berhasil disimpan"
        else
          render json: { 
            status: 500,
            msg: tim_proyek.errors
          }
          txError(tim_proyek.errors.to_json)
        end
      end
    rescue StandardError => e
      txError(e)
    end
  end 

  def delete
    @data = TeamProject.find(params[:id]).destroy
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
    @data = TeamProject.find(params[:id])
    @users = User.all
    @projects = Project.all
    render json:{
      status: 200,
      data: @data,
      users: @users,
      projects: @projects
    }, status: 200
  end

  def users
    @data = User.order(:email => :asc)
    render json:{
      status: 200,
      data: @data
    }, status: 200
  end

  def projects
    @data = Project.order(:nama_proyek => :asc)
    render json:{
      status: 200,
      data: @data
    }, status: 200
  end
end