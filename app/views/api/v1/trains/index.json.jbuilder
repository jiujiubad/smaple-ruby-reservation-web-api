json.meta do
	json.current_page @trains.current_page
  json.total_pages @trains.total_pages  
  json.per_page @trains.per_page
  json.total_entries @trains.total_entries
  json.next_url (@trains.current_page == @trains.total_pages)? nil : api_v1_trains_url( :page => @trains.next_page )
  json.previous_url (@trains.current_page == 1)? nil : api_v1_trains_url( :page => @trains.previous_page )
end

json.data do
  json.array! @trains, :partial => "item", :as => :train
end