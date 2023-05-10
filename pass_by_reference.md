```ruby
cola_str = 'cola'
cola_str.delete!(cola_str).concat('cider')
item_instance = Item.new(cola_str)
get_str = item_instance.name
get_str.delete!(get_str).concat('cider')
```
