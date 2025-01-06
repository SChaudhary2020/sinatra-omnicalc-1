require "sinatra"
require "sinatra/reloader"
require "active_support/all"

get("/howdy") do
  erb(:hello)
end

get("/goodbye") do
  erb(:bye)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root)
end

get("/square_root/results") do
  
  @the_num = params.fetch("number").to_f

  @the_result = Math.sqrt(@the_num)

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment)
end

get("/payment/results") do

  @apr = params.fetch("user_apr").to_f

  @year = params.fetch("user_year").to_i
  @num_months = @year * 12

  principal = params.fetch("user_pay").to_f
  @principal = principal.round(2)

  interest_rate = (@apr/100)/12
  numerator = interest_rate * (1 + interest_rate) ** @num_months
  denominator = (1 + interest_rate) ** @num_months - 1
  monthly_payment = (@principal* numerator)/denominator
  @payment = monthly_payment.round(2)



  # def payment(apr, principal, year)
  #   monthly_rate = apr / 100 / 12
  #   number_of_payments = years * 12
  #   payment = principal * (monthly_rate * (1 + monthly_rate)**number_of_payments) / ((1 + monthly_rate)**number_of_payments - 1)
  #   return payment
  #   # r = apr / 12
  #   # n = year * 12

  #   # numerator = r*principal
  #   # denominator = 1- (1 + r)**-n
  #   # payment = numerator / denominator

  #   # return payment 
  # end
   
  erb(:payment_result)
end

get("/random/new") do
  erb(:new_random)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f
  random_float = rand(@min..@max)
  @random_num = random_float.round(15)

  erb(:random_result)
end


get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
