require "watir-webdriver"
module BookFlight
  module VietnamAirlines
    class Book < VietnamAirlinesFormulas
      attr_accessor :browser, :params

      def initialize(params)
        # @browser = Watir::Browser.new
        @params = params
      end

      def call
        if round_trip?(params[:itinerary][:category])
          {
            reservation_code: "DEMOCODERT",
            holding_date: ""
          }
        else
          {
            reservation_code: "DEMOCODEOW",
            holding_date: ""
          }
        end

        # round_trip?(params[:itinerary][:category]) ? BookFlight::VietnamAirlines::RoundTrip.new(browser, params).call : BookFlight::VietnamAirlines::OneWay.new(browser, params).call
      end

      def login
        # browser.goto "http://onlineairticket.vn/"
        # session_id = browser.cookies["ASP.NET_SessionId"][:value]
        # decode_text = browser.hidden(id: "CaptchaDeText").value
        # browser.image(id: "CaptchaImage").screenshot("public/captcha.png")

        # client = TwoCaptcha.new(ENV["TWO_CAPTCHA_API_KEY"])
        # captcha = client.decode!(raw64: Base64.encode64(File.open('public/captcha.png', 'rb').read))

        # browser.text_field(name: "userName").set ENV["VIETNAM_AIRLINES_USERNAME"]
        # browser.text_field(name: "password").set ENV["VIETNAM_AIRLINES_PASSWORD"]
        # browser.text_field(name: "CaptchaInputText").set captcha.text.upcase
        # browser.button(id: "login").click
      end
    end
  end
end
