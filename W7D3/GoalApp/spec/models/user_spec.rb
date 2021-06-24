require 'rails_helper'

RSpec.describe User, type: :model do 
  
  it { should validate_presence_of(:username)}
  it { should validate_uniqueness_of(:username)}
  it { should validate_presence_of(:session_token)}
  it { should validate_presence_of(:password_digest)}
  it { should validate_presence_of(:password)}
  it { should validate_length_of(:password).is_at_least(6)}
  it { should have_many(:goals)}

  describe 'find_by_credentials' do 
    context 'with valid username and password' do
      it 'Should return the user' do 
        mike = User.create(username: 'madson1999', password: 'sufferingiskey')
        user = User.find_by_credentials('madson1999','sufferingiskey')
        expect(mike.username).to eq(user.username)
        expect(mike.password_digest).to eq(user.password_digest)
      end
    end
    context 'with invalid username and password' do
      it 'should return nil' do 
        mike = User.create(username: 'madson1999', password: 'sufferingiskey')
        user = User.find_by_credentials('madson1999','sugar')
        expect(user).to be_nil 
      end
    end
    
  end
  

  
  
  
  
  
  
  
  
end