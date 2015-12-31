require 'sinatra'

get '/' do erb :index; end

__END__

@@ index
<h1>Shortner!</h1>
<form action="/" method="post">
  <label for="Insert_you_url">Insert you url</label>
  <input type="text" name="url">
  <p><input type="submit" value="Continue →"></p>
</form>
