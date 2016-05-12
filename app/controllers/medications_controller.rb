class MedicationsController < ApplicationController
 before_action :authenticate_user!

  def show
    @medication = Medication.find(params[:id])
  end

  def new
     @user = User.find(current_user.id)
     @medication = Medication.new
   end

   def create
     @user = User.find(current_user.id)
     @medication = @user.medications.build(medication_params)
     @medication.user = current_user

     if @medication.save
       flash[:notice] = "Medication was saved."
       redirect_to user_path(current_user.id)
     else
       flash.now[:alert] = "There was an error saving the medication. Please try again."
       render :new
     end
   end

   def edit
     @medication = Medication.find(params[:id])
   end

   def update
     @medication = Medication.find(params[:id])
     @medication.assign_attributes(medication_params)

     if @medication.save
       flash[:notice] = "Medication was updated."
       redirect_to user_path
     else
       flash.now[:alert] = "There was an error saving the medication. Please try again."
       render :edit
     end
   end

   def destroy
     @medication = Medication.find(params[:id])

     if @medication.destroy
       flash[:notice] = "#{@medication.name} was deleted successfully."
        redirect_to user_path
     else
       flash.now[:alert] = "There was an error deleting the medication."
        redirect_to user_path
     end
   end


   private

   def medication_params
     params.require(:medication).permit(:user_id, :dosage_amount, :dosage_measurement, :frequency_amount, :frequency_measurement, :name)
   end

 end
