user_list = {
  'test' => 'password'
}

anp = Apache::AuthnProvider.new

if user_list[anp.user] == anp.password
  Apache.return(Apache::AuthnProvider::AUTH_GRANTED)
else
  Apache.return(Apache::AuthnProvider::AUTH_DENIED)
end
