  require 'rails_helper'

  RSpec.describe MigrainesController, type: :controller do
    let(:user) { create(:user) }
    let(:my_migraine) { create(:migraine, user: user)}

    before do
      sign_in :user, user
    end

    describe "DELETE #destroy" do
      it "deletes the migraine" do
        delete :destroy, {user_id: user.id, id: my_migraine.id}
        count = Migraine.where(id: my_migraine.id).size
        expect(count).to eq(0)
      end
      it "redirects to index" do
        delete :destroy, {user_id: user.id, id: my_migraine.id}
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
      it "instaniates @migraine" do
        get :new, user_id: user.id
        expect(assigns(:migraine)).not_to be_nil
      end
    end
  end
