class CustomerMailer < ApplicationMailer
  def ticket_confirmation(ticker_id)
    @ticket = Ticket.find(ticker_id)
    mail to: @ticket.customer_email, subject: "New ticket \"#{@ticket.subject}\""
  end

  def new_reply(message_id)
    @message = Message.find(message_id)
    mail to: @message.ticket.customer_email, subject: "New reply in ticket \"#{@message.ticket.reference}\""
  end
end
