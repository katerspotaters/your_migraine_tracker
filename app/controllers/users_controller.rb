class UsersController < ApplicationController
   before_action :authenticate_user!

   def show
    @user = User.find(current_user.id)
    @medications = @user.medications
    @migraines = @user.migraines
   end
 end
