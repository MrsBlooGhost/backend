require 'sinatra'
require 'sinatra/reloader'
require 'yaml'

helpers do
  def count_interests
    @content.reduce(0) do |sum, (name, info)|
      sum + info[:interests].size
    end
  end

  def list # returns array of string names
    @content.keys.map { |name| name }
  end
  
  def email(user)
    @content[user.to_sym][:email]
  end
  
  def interests(user)
    @content[user.to_sym][:interests]
  end
end

before do
  @content = YAML.load_file("data/users.yaml") # loads yaml content
  @users = list
  @number_of_users = @content.keys.size
  count_interests
end

not_found do
  redirect "/"
end

get "/" do
  redirect "/users"
end

get "/users" do
  @title = "Users"
  erb :home
end

get "/users/:name" do
  @user = params[:name] # string rep of user's name
  
  @title = @user.capitalize
  @email = email(@user)
  @interests = interests(@user)

  erb :user
end
