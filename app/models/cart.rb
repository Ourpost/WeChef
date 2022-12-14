class Cart
  SessionKey = :cart8888
  attr_reader :items

  def initialize(items = [])
    @items = items
  end

  def add_item(menu_id, quantity, desk_id, user_id)#TODO
    found_item = @items.find{|item| item.menu_id == menu_id}
    if found_item
      found_item.increment(quantity)
    else
      @items << CartItem.new(menu_id, quantity, desk_id, user_id)#TODO
    end
  end

  def empty?
    @items.empty?
  end

  def total_price
    @items.reduce(0){|acc, item| acc + item.price}
  end

  #TODO
  def serialize
    all_items = @items.map {|item| {"menu_id" => item.menu_id, "quantity" => item.quantity, "desk_id" => item.desk_id, "user_id" => item.user_id}}

    {"items" => all_items}
  end

  #TODO
  def self.from_hash(hash)
    if hash.nil?
      new []
    else
      new hash["items"].map{|item_hash| CartItem.new(item_hash["menu_id"], item_hash["quantity"], item_hash["desk_id"], item_hash["user_id"])}
    end
  end
end
