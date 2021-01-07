class Museum
  attr_reader :name,
              :exhibits

  def initialize (name)
    @name = name
    @exhibits = []
  end

  def add_exhibit (exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits (patron)
    output = []
    patron.interests.each do |interest|
      @exhibits.each do |exhibit|
        if interest == exhibit.name
          output << exhibit
        end
      end
    end
    return output
  end
end
