require "test_helper"

describe Vote do
  describe 'validations' do
    before do
      # Arrange
      @user = User.new(username: 'test user', date_joined: Date.today)
      @work = Work.new(category: "book", title: "my test book")
      @vote = Vote.new(user: @user, work: @work)
    end

    it 'is valid when all fields are present' do
      # Act
      result = @vote.valid?

      # Assert
      expect(result).must_equal true
    end

    it 'is invalid without a user' do
      # Arrange
      @vote.user = nil
    
      # Act
      result = @vote.valid?
    
      # Assert
      expect(result).must_equal false
      expect(@vote.errors.messages).must_include :user

    end

    it 'is invalid without a work' do
      # Arrange
      @vote.work = nil
    
      # Act
      result = @vote.valid?
    
      # Assert
      expect(result).must_equal false
      expect(@vote.errors.messages).must_include :work

    end

    it "is invalid if user is not unique in the scope of work" do
      # Arrange
      @vote.save
      @new_vote = Vote.new(user: @user, work: @work)

      # Act
      result = @new_vote.valid?
    
      # Assert
      expect(result).must_equal false
      expect(@new_vote.errors.messages).must_include :user_id
    end

  end

  describe 'relations' do
    it "has a user" do
      vote = votes(:vote1)
      expect(vote.user).must_equal users(:katie)
    end

    it "can set the user" do
      work = works(:old)
      vote = Vote.new(work: work)
      vote.user = users(:chelsea)
      expect(vote.user_id).must_equal users(:chelsea).id
    end

    it "has a work" do
      vote = votes(:vote2)
      expect(vote.work).must_equal works(:old)
    end

    it "can set the work" do
      user = users(:katie)
      vote = Vote.new(user: user)
      vote.work = works(:harry1)
      expect(vote.work_id).must_equal works(:harry1).id
    end

  end


end
