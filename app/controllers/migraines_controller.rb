class MigrainesController < ApplicationController

  def new
    @user = User.find(current_user.id)
    @migraine = Migraine.new
  end

  def create
    @user = User.find(current_user.id)
    @migraine = @user.migraines.build(migraine_params)
    @migraine.user = current_user

    if @migraine.save
      flash[:notice] = "Migraine was saved."
      redirect_to user_path(current_user.id)
    else
      flash.now[:alert] = "There was an error saving the migraine. Please try again."
      render :new
    end
  end

  def destroy
    @migraine = Migraine.find(params[:id])

    if @migraine.destroy
      flash[:notice] = "Migraine that happened at #{@migraine.occurrence_time} was deleted successfully."
       redirect_to user_path
    else
      flash.now[:alert] = "There was an error deleting the migraine."
       redirect_to user_path
    end
  end

  private

  def migraine_params
    params.require(:migraine).permit(:user_id, :intensity, :occurrence_time)
  end

end
