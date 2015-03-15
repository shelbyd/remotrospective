class RetrosController < Volt::ModelController
  def show
    self.model = page
    page._new_item._category = page._new_item._category.or('happy')
    store._retros.find({parameter_name: params._name }).then do |results|
      self.model = results[0]
    end
  end

  def add_item
    _items << page._new_item.to_h
    page._new_item = Volt::Model.new category: 'happy'
  end
end
