class FlightsController < ApplicationController
  def index
  	@search_results = Flight.where('from_airport_id = ? AND to_airport_id = ? AND date = ?', params['from_airport'], params['to_airport'], params['date'])
  	@from_options = Flight.all.map{ |f| [f.from_airport.code, f.from_airport.id]}.uniq
  	@to_options = Flight.all.map{ |f| [f.to_airport.code, f.to_airport.id]}.uniq
  	@date_options = Flight.order(date: :asc).map{ |f| [f.date, f.date]}.uniq
  end

end
