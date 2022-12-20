module StoresHelper
  def menu_id_to_name(id)
    Menu.find(id).name
  end

  def order_sort(desk)
    desk.orders.order({ created_at: :asc })
  end
end
