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
  
  describe 'custom methods' do
    it "num_votes returns correct number of votes" do
      user = User.new(username: 'test user1', date_joined: Date.today)
      list_works = [:titanic,:harry1,:old,:poodr]
      list_works.each do |work|
        Vote.create(user: user, work: works(work))
      end

      expect(user.num_votes).must_equal list_works.length

    end
  end

  describe 'relations' do
    it "can have many votes" do
      user = users(:katie)
      expect(user.votes.count).must_equal 2

    end

  end
end




