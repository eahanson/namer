class Mom
  def list(creator: 'Homer', title: 'My donut', notes: "It's chocolate", save: true)
    List.new(creator: creator, title: title, notes: notes).tap do |list|
      list.save! if save
    end
  end

  def suggestion(list: mom.list, contents: 'Some great suggestion', creator: 'Bob', save: true)
    Suggestion.new(list: list, contents: contents, creator: creator).tap do |suggestion|
      suggestion.save! if save
    end
  end
end

def mom
  @mom ||= Mom.new
end
