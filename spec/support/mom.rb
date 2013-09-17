class Mom
  def list
    List.new creator: 'Homer', title: 'My donut', notes: "It's chocolate"
  end

  def list!
    list.tap(&:save!)
  end

  def suggestion(list=mom.list)
    Suggestion.new list: list, contents: 'Some great suggestion', notes: "Isn't it great?", creator: 'Bob'
  end

  def suggestion!(list=mom.list!)
    suggestion(list).tap(&:save!)
  end
end

def mom
  @mom ||= Mom.new
end
