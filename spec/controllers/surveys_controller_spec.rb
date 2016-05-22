require 'rails_helper'

RSpec.describe SurveysController, type: :controller do
  let(:user) { create(:user) }
  let(:my_survey) { create(:survey)}

  before do
    sign_in :user, user
  end

  describe "DELETE #destroy" do
    it "deletes the survey" do
      delete :destroy, {user_id: user.id, migraine_id: migraine.id, id: my_survey.id}
      count = Survey.where(id: my_survey.id).size
      expect(count).to eq(0)
    end
    it "redirects to index" do
      delete :destroy, {user_id: user.id, migraine_id: migraine, id: my_survey.id}
      expect(response).to redirect_to user_path
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, user_id: user.id, migraine_id: migraine.id
      expect(response).to have_http_status(:success)
    end
    it "renders the new view" do
      get :new, user_id: user.id, migraine_id: migraine.id
      expect(response).to render_template :new
    end
    it "instaniates @survey" do
      get :new, user_id: user.id, migraine_id: migraine.id
      expect(assigns(:survey)).not_to be_nil
    end
  end
end
