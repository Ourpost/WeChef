class CartItem
  attr_reader :menu_id, :quantity

  def initialize(menu_id, quantity = 1)
    @menu_id = menu_id
    @quantity = quantity.to_i
  end

  def increment(n = 1)
    @quantity += n.to_i
  end

  def menu
    Menu.find_by(id: menu_id)
  end

  def price
    menu.price * quantity.to_i
  end
end
