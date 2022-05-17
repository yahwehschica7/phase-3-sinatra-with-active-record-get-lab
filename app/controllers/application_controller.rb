class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get "/bakeries" do
   Bakery.all.to_json
  end

  get "/bakeries/:id" do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)   
  end

  get "/baked_goods/by_price" do
   baked_goods = BakedGood.by_price  
   baked_goods.to_json 
  end
  
  get "/baked_goods/most_expensive" do 
    most_expensive = BakedGood.by_price.first
    most_expensive.to_json
  end
end
