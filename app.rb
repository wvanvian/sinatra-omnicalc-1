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

get("/payment/new") do
  erb(:payment)
end


def format_number(number)
  number_list = number.to_s.split(".")
  num_groups = number_list[0].to_s.chars.to_a.reverse.each_slice(3)
  num_groups.map(&:join).join(',').reverse
end

def get_decimals(number)
  number_list = number.to_s.split(".")
  output = ""
  if number_list[1].length() == 1
    output = output + '.' + number_list[1] + '0'
  else
    output = output + '.' + number_list[1]
  end

end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  r = @apr/1200
  @year = params.fetch("user_years").to_i
  @pv = params.fetch("user_pv").to_f

  @payment = (r * @pv/(1-(1+r)**(-@year*12))).round(2)
  @pv = format_number(@pv).to_s + get_decimals(@pv)
  @apr = @apr.round(4)
  @payment = format_number(@payment).to_s + get_decimals(@payment)

  erb(:payment_results)
end

get("/random/new") do
  erb(:random_number)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f
  @rand = rand(@min..@max)

  erb(:random_number_results)
end
