class Assignment
    
  def self.all
    ######
    # Este metodo hace la peticion al api homework y recibe los datos con la 
    # siguiente estructura
    # { assignment: [ 
    #  {id, title, content, explanation_en, explanation, es, tags} 
    #] }

    # Para pruebas usa la siguiente peticion
    # response = HTTParty.get("#{ENV['HW_URL']}/api/exercise_assignments", format: :plain)
    ######

    response = HTTParty.get("#{ENV['HW_URL']}/api/exercise_assignments", format: :plain)
    # response = HTTParty.get('https://bogota-bootcamp-hw-demo.herokuapp.com/api?access_token=72165d985b01826e7f690aa1d4fc3e83', format: :plain)
    @parsed = JSON.parse(response.body, symbolize_names: true)
    return @parsed[:assignment]
  end

  def self.where(conditions)
    self.all.select do |assignment|
      conditions.all? {|key, value| assignment[key] == value}
    end
  end

  def self.find(id)
    self.all.find{|assignment| assignment[:id] == id }
  end



end
