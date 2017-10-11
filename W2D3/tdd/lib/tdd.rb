class Array
  def my_uniq
    results = []
    self.each do |el|
      results << el unless results.include?(el)
    end
    results
  end

  def two_sum
    pairs = []
    self.each_with_index do |el,idx1|
      (idx1+1..length-1).each do |idx2|
        pairs << [idx1,idx2] if self[idx1] + self[idx2] == 0
      end
    end
    pairs
  end

  def my_transpose
    transposed = []
    self[0].length.times do
      transposed << []
    end
    self.each_with_index do |row, rowidx|
      row.each_with_index do |col, colidx|
        transposed[colidx] << col
      end
    end
    transposed
  end

end
