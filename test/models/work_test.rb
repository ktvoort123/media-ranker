require "test_helper"

describe Work do
  describe 'validations' do
    before do
      # Arrange
      @work = Work.new(category: 'movie', title: 'my test movie')
    end

    it 'is valid when all fields are present' do
      # Act
      result = @work.valid?

      # Assert
      expect(result).must_equal true
    end

    it 'is invalid without a title' do
      # Arrange
      @work.title = nil
    
      # Act
      result = @work.valid?
    
      # Assert
      expect(result).must_equal false
      expect(@work.errors.messages).must_include :title

    end

    it 'is invalid without a category' do
      # Arrange
      @work.category = nil
    
      # Act
      result = @work.valid?
    
      # Assert
      expect(result).must_equal false
      expect(@work.errors.messages).must_include :category

    end

    it "is valid if title is unique in the scope of category" do
      # Arrange
      @work.save
      @new_work = Work.new(title: @work.title, category: 'book')

      # Act
      result = @new_work.valid?
    
      # Assert
      expect(result).must_equal true
    end

    it "is invalid if title is not unique in the scope of category" do
      # Arrange
      @work.save
      @new_work = Work.new(title: @work.title, category: @work.category)

      # Act
      result = @new_work.valid?
    
      # Assert
      expect(result).must_equal false
      expect(@new_work.errors.messages).must_include :title
    end

  end
  
  describe 'custom methods' do
    it "num_votes returns correct number of votes" do
      work = Work.new(title: 'test work1', category: 'album')
      list_users = [:katie,:louie,:chelsea]
      list_users.each do |user|
        Vote.create(work: work, user: users(user))
      end

      expect(work.num_votes).must_equal list_users.length
    end

    it "work_with_most_votes returns correct number of votes" do
      expect(Work.work_with_most_votes).must_equal works(:old)
    end

    it "top_ten returns list even with less than ten items" do
      expect(Work.top_ten("movie")).must_equal [works(:harry1),works(:titanic)]
    end

  end

  describe 'relations' do
    it "can have many votes" do
      work = works(:old)
      expect(work.votes.count).must_equal 2

    end

  end
end
