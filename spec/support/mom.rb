class Mom
  def list
    List.new creator: 'Homer', title: 'My donut', notes: "It's chocolate"
  end

  def list!
    list.tap(&:save!)
  end
end

def mom
  @mom ||= Mom.new
end
