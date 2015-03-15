class RetrosController < Volt::ModelController
  def show
    self.model = page
    store._retros.find({parameter_name: params._name }).then do |results|
      self.model = results[0]
    end
  end

  def add_item
    model._items << { text: page._new_item }
    page._new_item = ''
  end
end
