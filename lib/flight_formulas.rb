module FlightFormulas
  include ActionView::Helpers::NumberHelper

  def agent_without_proxy
    agent = Mechanize.new

    agent
  end
  def agent_with_proxy
    agent = Mechanize.new
    agent.user_agent_alias = proxy
    #agent.set_proxy(proxy, ENV["PROXY_PORT"], ENV["PROXY_USERNAME"], ENV["PROXY_PASSWORD"])
    #agent.set_proxy("203.130.237.123", 3128)
    agent
  end

  def proxy
    REDIS.zrange("proxies", 0, -1).first
  end

  def update_proxy_count(proxy)
    REDIS.zincrby("proxies", 1, proxy)
  end

  def round_trip?(round_type)
    round_type == "RT"
  end

  def format_day(date_str)
    date_str.to_date.strftime("%d")
  end

  def format_month(date_str)
    date_str.to_date.strftime("%m")
  end

  def format_year(date_str)
    date_str.to_date.strftime("%Y")
  end

  def format_year_month(date_str)
    date_str.to_date.strftime("%Y-%m")
  end

  def format_date(date_str)
    date_str.to_date.strftime("%d/%m/%Y")
  end

  def first_name(full_name)
    full_name.match(" ").post_match
  end

  def last_name(full_name)
    full_name.match(" ").pre_match
  end
end
