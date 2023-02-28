class FoodsController < ApplicationController
  def index
    @rand_food = Food.where( 'id >= ?', rand(Food.first.id..Food.last.id) ).first

    @near_calories = []
    if params[:calorie_search].blank?
      @near_calories = []
    else
      @near_calorie_id_list = Food.pluck(:id, :kcal).min_by(5) { |x, y| (params[:calorie_search].to_i - y.to_i).abs }
      @near_calories = @near_calorie_id_list.map!{|x, y| Food.find(x)}
    end
  end

  def read
    # Excelファイルの指定
    excel = Roo::Excelx.new('app/assets/Excel/food_list.xlsx')
    # Excelファイル内のシートを指定
    sheet = excel.sheet('Sheet1')
    # シートを1列ごとにハッシュの形にして取得
    # <指定したいkey>: '<Excelの1列目の名前>'
    # っていう感じになってます
    rows = sheet.parse(
      food_name: 'food_name',
      kcal: 'kcal',
      water: 'water',
      protein: 'protein',
      lipid:'lipid',
      fibre:'fibre',
      carbohydrate:'carbohydrate',
      Na:'Na',
      Ca:'Ca',
      Mg:'Mg',
      Fe:'Fe',
      vitaminC:'vitaminC',
      salt:'salt'
    )
    # 取得したハッシュを順にデータベースへ書き込む
    rows.each do |row|
      Food.create(row)
    end
  end
end

