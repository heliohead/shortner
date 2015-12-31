require 'sinatra'

get '/' do erb :index; end

__END__

@@ layout
<html>
  <head>
    <meta charset="utf-8">
    <title>Shortner</title>
  </head>
  <body>
    <%= yield %>
  </body>
</html>

@@ index
<h1>Shortner!</h1>
<form action="/" method="post">
  <label for="Insert_you_url">Insert you url</label>
  <input type="text" name="url">
  <p><input type="submit" value="Continue →"></p>
</form>

@@ error
<p><%= @error %></p>

@@ shortened
Your shortened url is:
<a href='<%= "#{env['HTTP_REFERER']}#{@shortened}" %>' target="_blank"><%= "#{env['HTTP_REFERER']}#{@shortened}" %></a>
