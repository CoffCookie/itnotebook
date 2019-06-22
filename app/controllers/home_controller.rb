class HomeController < ApplicationController
  def top
    @posts = Post.all.order(created_at: :desc)
  end
end
=begin
rails newした時、gem install ... エラーがでる。

gemを何らかの理由によりsudo gem install ...した時に
/usr/local/var/rbenv/をroot権限に書き換えることがあるので、
sudo chown -R (ユーザ名):staff /usr/local/var/rbenv/ で権限を戻す必要がある。*/
=end
