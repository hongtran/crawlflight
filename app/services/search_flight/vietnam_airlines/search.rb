module SearchFlight
  module VietnamAirlines
    class Search < VietnamAirlinesFormulas
      attr_accessor :params, :response

      def initialize(params)
        @params = params
      end

      def call
        begin
          agent = agent_with_proxy
          
          @response = agent.get build_path
          #byebug
          update_proxy_count(agent.proxy_addr)

          success? ? SearchFlight::VietnamAirlines::Parse.new(
            content: response,
            is_round_trip: round_trip?(params[:round_type]),
            adult: params[:adult],
            child: params[:child],
            infant: params[:infant]
          ).call : []
        rescue Exception => e
          p e.backtrace
          p e.message, "Vietnam Airlines Searching"
          nil
        end

      end


      def build_path
        path = String.new("https://wl-prod.sabresonicweb.com/SSW2010/VNVN/webqtrip.html?searchType=NORMAL")

        path << "&journeySpan=" << get_round_type
        path << "&origin=" << params[:ori_code]
        path << "&destination=" << params[:des_code]
        path << "&departureDate=" << format_date(params[:date_depart])
        path << "&returnDate=" << format_date(params[:date_return]) if round_trip?(params[:round_type])
        path << "&numAdults=" << params[:adult].to_s
        path << "&numChildren=" << params[:child].to_s
        path << "&numInfants=" << params[:infant].to_s
        path << "&alternativeLandingPage=true&promoCode=&lang=vi_VN"

        path
      end

      def success?
        response.code.to_i == 200
      end

      def get_round_type
        round_trip?(params[:round_type]) ? "RT" : "OW"
      end
    end
  end
end
