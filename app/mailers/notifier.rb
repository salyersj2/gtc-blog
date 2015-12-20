class Notifier < ApplicationMailer
  default :from => "from@example.com"
 
  def email_friend(article, sender_name, receiver_email)
    @article = article
	@sender_name = sender_name
	
	attachments["rails.png"] = File.read("public/images/rails.png", mode: "rb")
	mail :to => receiver_email, :subject => "Interesting Article"
  end
  
  def comment_added(comment)
    @article = comment.article
	mail :to => @article.user.email, 
    :subject => "New comment for '#{@article.title}'"
  end  
end