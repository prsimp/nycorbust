class ContactForm < ActionMailer::Base
  default to: "contact@nycorbust.com"

  def inquiry(contact_details)
    @name = contact_details[:name]
    @email = contact_details[:email]
    @subject = contact_details[:subject]
    @subject = "[#{contact_details[:item]}] " + @subject unless contact_details[:item].empty?
    @message = contact_details[:message]

    mail( from: @email, reply_to: @email, subject: @subject)
  end
end
