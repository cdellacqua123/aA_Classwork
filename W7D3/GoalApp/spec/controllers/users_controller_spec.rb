require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    let!(:user) {build(:user)}

    describe 'GET #index' do
        it 'renders index' do
            get :index
            expect(response).to render_template(:index)
        end
    end

    describe 'GET #new' do
        it 'brings up form to sign up a user' do
            allow(subject).to receive(:logged_in?).and_return(true)
            get :new
            expect(response).to render_template(:new)
        end
    end

    describe 'POST #create' do
        before :each do
            create (:user)
            allow(subject).to receive(:current_user).and_return(User.last)
        end
        let(:valid_params) {User.create!(username: 'WalkaFlocka', password: '123456') }
        let(:invalid_params) {User.create!(username: 'WalkaFlocka', password: '1234') }
        # subject (:jasmine) { User.create!(username: 'jasmine', password: 'abcdef') }
        # let (:jack) { User.create!(username: 'jackyboy', password: 'abcdef') }
        context 'with valid params' do
            it 'creates a user' do
                post :create, params: valid_params
                expect (User.last.username).to eq('WalkaFlocka')
            end
        end
        context 'with invalid params' do
            it 'validates the presence of the user\'s username & password' do
                post :create, params: invalid_params
                expect(response).to render_template('new')
                expect(flash[:errors]).to be_present
            end
        end
    end

    describe 'GET #show' do 
        #if logged in
        #not logged in
        context 'When logged in' do 
            before do 
                create(:user)
                allow(controller).to receive(:current_user) {:user}
            end
        end
    end
    
    
    
  
end


