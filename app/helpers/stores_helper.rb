module StoresHelper
  def menu_id_to_name(id)
    Menu.find(id).name
  end
end
