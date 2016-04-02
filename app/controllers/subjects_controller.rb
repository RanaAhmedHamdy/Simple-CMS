class SubjectsController < ApplicationController
  
  layout "admin"
  
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})
  end

  def create
    # instantiate a new obj
    @subject = Subject.new(subject_params)
    # save the object
    if @subject.save
      # if save succeeds, redirect to index action
      flash[:notice] = "Subject created successfully"
      redirect_to(:action => 'index')
    else
      # if save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    # find obj
    @subject = Subject.find(params[:id])
    # update the object
    if @subject.update_attributes(subject_params)
      # if update succeeds, redirect to index action
      flash[:notice] = "Subject updated successfully"
      redirect_to(:action => 'show', :id => @subject.id)
    else
      # if update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find {params[:id]}
    subject.destroy
    flash[:notice] = "Subject '#{subject.name}' destroyed successfully"
    redirect_to(:action => 'index')
  end

  private
    def subject_params
      #raises an error if :subject not present
      #allow listed attributes to be mass-assigned
      params.require(:subject).permit(:name, :position, :visible)
    end
end
