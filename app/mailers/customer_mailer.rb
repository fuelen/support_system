class CustomerMailer < ApplicationMailer
  def ticket_confirmation(ticker_id)
    @ticket = Ticket.find(ticker_id)
    mail to: @ticket.customer_email, subject: "New ticket \"#{@ticket.subject}\""
  end
end
