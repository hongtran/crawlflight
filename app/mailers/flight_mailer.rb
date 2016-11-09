class FlightMailer < ApplicationMailer
  helper MailerHelper

  def share_cheap_flight(params)
    @plane_category = PlaneCategory.find(params[:plane_category_id])
    @ori_airport = Airport.find(params[:ori_airport_id])
    @des_airport = Airport.find(params[:des_airport_id])
    @sender_name = params[:sender_name]
    @receiver_email = params[:receiver_email]
    @date_depart = params[:date_depart]
    @code_flight = params[:code_flight]
    @time_depart = params[:time_depart]
    @time_arrive = params[:time_arrive]
    @price_web = params[:price_web]
    @price_adult = params[:price_adult]

    mail(to: get_recipients_email(@receiver_email), subject: 'Your friend shares cheap flight ticket with you')
  end

  def alert_notification(alert, ticket_cheaps)
  	@alert = alert
    @tickets = ticket_cheaps
    mail(to: get_recipients_email(@alert.email), subject: 'Alert BOT found something excited for you')
  end

  def alert_confirmation(alert)
    @alert = alert
    mail(to: get_recipients_email(@alert.email), subject: 'Alert confirmation from iFlight')
  end
end
