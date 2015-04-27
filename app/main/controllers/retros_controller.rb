module Main
  class RetrosController < Volt::ModelController
    def show
      self.model = page
      page._new_item._category = page._new_item._category.or('happy')
      store._retros.where({parameter_name: params._name }).then do |results|
        self.model = results[0]
      end
    end

    def add_item
      _items << page._new_item.to_h
      page._new_item = Volt::Model.new category: 'happy'
    end

    def remove_item(item)
      _items.delete(item)
    end

    def toggle_item_complete(item)
      item._completed = !item._completed.or(false)
    end
  end
end
