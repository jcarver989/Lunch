class TrainingExamplesController < ApplicationController
  
  def create
    @training_example = TrainingExample.new(params[:training_example])
    if @training_example.save
      flash[:success] =  "Thanks Enjoy a Rockin Lunch!"
    else
      flash[:error] = "Sorry we couldn't save your lunch decision"
    end
    
    redirect_to root_url
  end

end
