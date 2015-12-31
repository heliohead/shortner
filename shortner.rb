require 'sinatra'

DB = Sequel.connect('sqlite://shortner.db')
DB.create_table? :urls do
  primary_key :id
  varchar :url
end

class Url < Sequel::Model; end

get '/' do erb :index; end

post '/' do
  url = params[:url]
  if url =~ /\Ahttps?:\/\//
    @shortened = 'valid'
    erb :shortened
  else
    @error = 'This url is not valid!'
  end
end

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
