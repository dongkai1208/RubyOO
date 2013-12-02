class Receipt

  attr_reader :id

  def initialize id
    @id = id
  end

  def == receipt
    @id == receipt.id
  end
end
