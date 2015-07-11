r = Apache::Request.new()

cache_sec = case r.filename
when /\.(gif|jpeg|png)/
    60*60*24*7
when /\.(css|js)/
    60*10
when /\.(?:html|htm)/
    0
end

if r.filename.match %r[\.(?:gif|jpeg|png)$]
    cache_sec = 60*60*24*7
    r.headers_out['Cache-Control'] = "max-age=#{cache_sec}"
end

if r.filename.match %r[\.(?:css|js)$]
    cache_sec = 60*10
    r.headers_out['Cache-Control'] = "max-age=#{cache_sec}"
end

if r.filename.match %r[\.(?:html|htm)$]
    r.headers_out['Cache-Control'] = "max-age=#{cache_sec}"
    r.headers_out['Expires'] = 'Mon, 26 Jul 1997 05:00:00 GMT'
end

Apache.return(Apache::DECLINED)
