module ApplicationHelper
  def building
    options = {"Select Your Building"=>""}
    cities = Building.order(:name)
    cities.each {|st| options = options.merge({st.name => st.id})}
    options
  end
end
