r = Apache::Request.new()
s = Apache::Server.new()

if matches = r.uri.match(/^\/base\/(.*)/)
    r.filename = "#{s.document_root}/rewrite/#{matches[1]}"
    Apache.return(Apache::OK)
else
    # DECLINED で次のモジュールに処理を委譲する
    Apache.return(Apache::DECLINED)
end
