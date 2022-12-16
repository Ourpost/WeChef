class CartItem
  attr_reader :menu_id, :quantity, :desk_id

  def initialize(menu_id, quantity = 1, desk_id)
    @menu_id = menu_id
    @quantity = quantity.to_i
    @desk_id = desk_id
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
