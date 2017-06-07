class TOH

  attr_accessor :tower

  def initialize
    @tower = [[3,2,1],[],[]]
  end

  def move(from_pile, to_pile)
    if @tower[from_pile].empty?
      raise "Empty pile"
    elsif @tower[to_pile].empty?
      @tower[to_pile].push(@tower[from_pile].pop)
    elsif @tower[to_pile][-1] < @tower[from_pile][-1]
      raise "Disc is too big"
    else
      @tower[to_pile].push(@tower[from_pile].pop)
    end

  end

  def won?
    @tower[1] == [3,2,1] || @tower[2] == [3,2,1]
  end


end
