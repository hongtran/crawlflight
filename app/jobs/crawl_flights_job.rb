require "flight_formulas"

class CrawlFlightsJob < ApplicationJob
  include FlightFormulas

  queue_as :default

  def perform()
    TotalFlight.delete_all
    adult = 1
    child = 0
    infant = 0
    round_type = "OW"
    uuid = SecureRandom.uuid
    2.times do |i|
      Route.all.each do |route|
        #if route.ori_airport_id = params[:ori_airport_id]
          des_airport = Airport.find(route.des_airport_id)
          ori_airport = Airport.find(route.ori_airport_id)
          date_depart = DateTime.now.to_date + (5 + i).days
          date_return = DateTime.now.to_date + (5 + i).days
          #REDIS.del "proxies"
          params = {
            uuid: uuid,
            ori_code: ori_airport.code,
            des_code: des_airport.code,
            date_depart: date_depart.to_s,
            date_return: date_return.to_s,
            adult: adult,
            child: child,
            infant: infant,
            round_type: round_type
          }
          crawlFlights(params)
        #end
      end
    end
    
  end
  
  def crawlFlights(params)
    begin
      flight_vja = SearchFlight::VietjetAir::Search.new(params).call
      #flights_jet = SearchFlight::Jetstar::Search.new(params).call
      flights_vna = SearchFlight::VietnamAirlines::Search.new(params).call
      data = {
        depart_flights: flights_vna[:depart_flights] + flight_vja[:depart_flights],
        return_flights: round_trip?(params[:round_type]) ? flights_vna[:return_flights] + flight_vja[:return_flights] : nil,
        itinerary: {
          category: params[:round_type],
          ori_airport: Airport.find_by(code: params[:ori_code]),
          des_airport: Airport.find_by(code: params[:des_code]),
          date_depart: params[:date_depart],
          date_return: params[:date_return],
          adult_num: params[:adult],
          child_num: params[:child],
          infant_num: params[:infant]
        }
      }
    rescue Exception => e
      p e.message

      data = {
        error: 404
      }
    end
    insertDataFlights(data[:depart_flights], params)
  end
  private
  def getRoute(params)
    ori_airport = Airport.find_by_code(params[:ori_code])
    des_airport = Airport.find_by_code(params[:des_code])
    route = Route.find_by(ori_airport: ori_airport, des_airport: des_airport)
  end

  def create_search_history(params)
    route = getRoute(params)
    if route
      SearchHistory.create(route: route)
    end
  end
  def insertDataFlights(flights, params)
    route_id = getRoute(params).id
    flights.each do |flight|
      flight['route_id'] = route_id
      flight['date_depart'] = params[:date_depart]
      newFlight = TotalFlight.new flight
      newFlight.save!
    end
  end
end