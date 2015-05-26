require 'sinatra'
require 'sinatra/contrib/all'
require 'pry'

get '/' do
  @operator = params[:operator]
  if @operator
    @first = params[:first].to_f
    @second = params[:second].to_f
    
    @result = case @operator
    when '+' then @first + @second
    when '-' then @first - @second
    when '*' then @first * @second
    when '/' then @first / @second
    end
  end
  erb :home
end

get '/power' do
  @first = params[:first].to_f
    if @first
    @second = params[:second].to_f
    @result = @first ** @second
  end
  erb :power
end


get '/sqrt' do
  @first = params[:first].to_f
    if @first
    @result = Math.sqrt(@first).to_f
  end
  erb :sqrt
end


get '/bmi' do
  @system = params[:system]
    if @system == "imperial"
    @weight = params[:weight].to_f
    @height = params[:height].to_f
    @bmi = ((@weight*703) / (@height*@height)).to_f.ceil
    elsif @system == "metric"
    @weight = params[:weight].to_f
    @height = params[:height].to_f
    @bmi = (@weight / (@height*@height)).to_f.ceil
  end
  erb :bmi
end


get '/mortgage' do
  @principal = params[:principal].to_f
  if @principal
  @interest_rate = params[:interest_rate].to_f
  @payments = params[:payments].to_f
    @monthly_payment = (@principal * (@interest_rate*(1 + @interest_rate)**@payments) / ((1 + @interest_rate)**@payments - 1)).ceil
    end
  erb :mortgage
end




# get '/trip_calc' do
#   @principal = params[:principal]
#   if @principal
#   @interest_rate = params[:interest_rate].to_f
#   @payments = params[:payments].to_f
#     @monthly_payment = (@principal * (@interest_rate*(1 + @interest_rate)**@payments) / ((1 + @interest_rate)**@payments - 1))
#     end
#   erb :trip_calc
# end


# def mpg_utility(speed, mpg)
#   if speed > 60
#     mpg - ((speed - 60) * 2)
#   else
#     mpg
#   end
# end

# def trip_calc
#   print "distance: "
#   distance = gets.to_f
#   print "mpg: "
#   mpg = gets.to_f
#   print "fuel price per gallon: "
#   cost = gets.to_f
#   print "speed: "
#   speed = gets.to_f
#   mpg = mpg_utility(speed, mpg)
#   puts "It will take you #{distance/speed} hours at a cost of $#{(distance/mpg)*cost}"
#   gets
# end
