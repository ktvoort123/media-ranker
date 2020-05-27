require "test_helper"

describe User do
  describe 'validations' do
    before do
      # Arrange
      @user = User.new(username: 'test user', date_joined: Date.today)
    end

    it 'is valid when all fields are present' do
      # Act
      result = @user.valid?

      # Assert
      expect(result).must_equal true
    end

    it 'is invalid without a username' do
      # Arrange
      @user.username = nil
    
      # Act
      result = @user.valid?
    
      # Assert
      expect(result).must_equal false
      expect(@user.errors.messages).must_include :username

    end

    it 'is invalid without a date joined' do
      # Arrange
      @user.date_joined = nil
    
      # Act
      result = @user.valid?
    
      # Assert
      expect(result).must_equal false
      expect(@user.errors.messages).must_include :date_joined

    end

    it "is invalid if username is not unique" do
      # Arrange
      @user.save
      @new_user = User.new(username: @user.username, date_joined: Date.today)

      # Act
      result = @new_user.valid?
    
      # Assert
      expect(result).must_equal false
      expect(@new_user.errors.messages).must_include :username
    end

  end

  # describe 'relations' do
  #   it "has a user" do
  #     vote = votes(:vote1)
  #     expect(vote.user).must_equal users(:katie)
  #   end

  #   it "can set the user" do
  #     work = works(:old)
  #     vote = Vote.new(work: work)
  #     vote.user = users(:chelsea)
  #     expect(vote.user_id).must_equal users(:chelsea).id
  #   end

  #   it "has a work" do
  #     vote = votes(:vote2)
  #     expect(vote.work).must_equal works(:old)
  #   end

  #   it "can set the work" do
  #     user = users(:katie)
  #     vote = Vote.new(user: user)
  #     vote.work = works(:harry1)
  #     expect(vote.work_id).must_equal works(:harry1).id
  #   end

  # end
end




