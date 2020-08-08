class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: "yuya.tanaka0808.w@gmail.com", subject: "お問い合わせの確認メール"
  end
end
