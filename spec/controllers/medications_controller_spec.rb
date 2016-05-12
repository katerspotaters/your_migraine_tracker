require 'rails_helper'

RSpec.describe MedicationsController, type: :controller do
  let(:user) { create(:user) }
  let(:my_medication) { create(:medication, user: user)}
  before do
    sign_in :user, user
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {user_id: user.id, id: my_medication.id}
      expect(response).to have_http_status(:success)
    end
    it "renders the show template" do
      get :show, {user_id: user.id, id: my_medication.id}
      expect(response).to render_template :show
    end
    it "assigns medication to @medication" do
      get :show, {user_id: user.id, id: my_medication.id}
      expect(assigns(:medication)).to eq(my_medication)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {user_id: user.id, id: my_medication.id}
      expect(response).to have_http_status(:success)
    end
    it "renders the edit view" do
      get :edit, {user_id: user.id, id: my_medication.id}
      expect(response).to render_template :edit
    end

    it "assigns medication to be updated to @medication" do
      get :edit, {user_id: user.id, id: my_medication.id}
      medication_instance = assigns(:medication)
      expect(medication_instance.id).to eq(my_medication.id)
      expect(medication_instance.name).to eq(my_medication.name)
    end
  end

  describe "PUT #update" do
    new_name = Faker::Lorem.sentence
    before do
      put :update, user_id: user.id, id: my_medication.id, medication: {name: new_name}
    end
    it "updates medication with expected attributes" do
      updated_medication = assigns(:medication)
      expect(updated_medication.id).to eq(my_medication.id)
      expect(updated_medication.name).to eq(new_name)
    end
    it "redirects to the updated medication" do
      expect(response).to redirect_to user_path
    end
  end

  describe "DELETE #destroy" do
    it "deletes the medication" do
      delete :destroy, {user_id: user.id, id: my_medication.id}
      count = Medication.where(id: my_medication.id).size
      expect(count).to eq(0)
    end
    it "redirects to index" do
      delete :destroy, {user_id: user.id, id: my_medication.id}
      expect(response).to redirect_to user_path
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, user_id: user.id
      expect(response).to have_http_status(:success)
    end
    it "renders the new view" do
      get :new, user_id: user.id
      expect(response).to render_template :new
    end
    it "instaniates @medication" do
      get :new, user_id: user.id
      expect(assigns(:medication)).not_to be_nil
    end
  end

  describe "POST #create" do
    it "increase the number of Medication by 1" do
      expect{post :create, user_id: user.id, medication: {name: Faker::Lorem.sentence}}.to change(Medication, :count).by(1)
    end
    it "assigns the new medication to @medication" do
      post :create, user_id: user.id, medication: {name: Faker::Lorem.sentence}
      expect(assigns(:medication)).to eq(Medication.last)
    end
    it "redirects to the new medication" do
      post :create, user_id: user.id, medication:{name: Faker::Lorem.sentence}
      expect(response).to redirect_to user_path(user.id)
    end
  end
end
