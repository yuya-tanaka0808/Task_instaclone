class ContactMailer < ApplicationMailer
  def contact_mail(picture)
    @picture = picture
    mail to: "yuya.tanaka0808.w@gmail.com", subject: "投稿確認メール"
  end
end
