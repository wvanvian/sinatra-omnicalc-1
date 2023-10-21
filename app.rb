require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:layout)
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  @num = params.fetch("number").to_f
  @square = @num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do

  @num = params.fetch("user_number").to_f
  @root = Math.sqrt(@num)

  erb(:square_root_results)

end
