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
  @first = params[:first]
    if @first
    @second = params[:second]
    @result = @first ** @second.to_f
  end
  erb :power
end


get '/sqrt' do
  @first = params[:first]
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
  @principal = params[:principal]
  if @principal
  @interest_rate = params[:interest_rate].to_f
  @payments = params[:payments].to_f
    @monthly_payment = (@principal * (@interest_rate*(1 + @interest_rate)**@payments) / ((1 + @interest_rate)**@payments - 1))
    end
  erb :mortgage
end

