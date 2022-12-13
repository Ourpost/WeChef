class Cart
  SessionKey = :cart8888
  attr_reader :items

  def initialize(items = [])
    @items = items
  end

  def add_item(menu_id)
    # NOTE
    found_item = @items.find{|item| item.menu_id == menu_id}
    if found_item
      found_item.increment
    else
      @items << CartItem.new(menu_id)
    end
  end

  def empty?
    @items.empty?
  end

  def total_price
    # NOTE
    @items.reduce(0){|acc, item| acc + item.price}
  end

  def serialize
    # NOTE
    all_items = @items.map {|item| {"menu_id" => item.menu_id, "quantity" => item.quantity}}

    {"items" => all_items}
  end

  def self.from_hash(hash)
    if hash.nil?
      new []
    else
      new hash["items"].map{|item_hash| CartItem.new(item_hash["menu_id"], item_hash["quantity"])}
    end
  end
end
