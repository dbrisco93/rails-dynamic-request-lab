class StudentsController < ApplicationController


  before_action :find_student, only: [:show]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end 

  def create
    @student = Student.create(student_params)
    redirect_to '/students'
  end

  def show
    if @student
    render :show
    else
      redirect_to '/students'
    end
  end

  private
  def student_params
    params.require(:student).permit(:first_name,:last_name)
  end

  def find_student
    @student = Student.find_by(id: params[:id])
  end
end