require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let (:new_user_attributes) do
    {
      email: "blochead@bloc.io",
      password: "blochead",
      password_confirmation: "blochead"
    }
  end
end
