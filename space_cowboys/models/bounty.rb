require('pg')
require('pry')

class Bounty
  attr_reader :name, :species, :bounty_value, :homeworld, :favourite_weapon

  def initialize( options )
    @name = options['name']
    @species = options['species']
    @bounty_value = options['bounty_value'].to_i
    @homeworld = options ['homeworld']
    @favourite_weapon = options ['favourite_weapon']
  end

  def save
    db = PG.connect( {dbname: 'bounty_hunter', host: 'localhost'})

    sql = "
    INSERT INTO bounties
    (
      name, species, bounty_value, homeworld, favourite_weapon
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    );
    RETURNING id"
    values = [@name, @species, @bounty_value, @homeworld, @favourite_weapon]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]["id"]
    db.close()
  end

  def update() # UPDATE
   db = PG.connect({dbname: 'bounty_hunter', host: 'localhost'})
   sql = "
   UPDATE bounties SET (
     name,
     bounty_value,
     danger_level,
     last_known_location
   ) =
   (
     $1, $2, $3, $4
   )
   WHERE id = $5"
   values = [@name, @bounty_value, @danger_level, @last_known_location, @id]
   db.prepare("update", sql)
   db.exec_prepared("update", values)
   db.close()
 end

 def delete()
   db = PG.connect({dbname: 'bounty_hunter', host: 'localhost'})
   sql = "DELETE FROM bounties
     WHERE id = $1"
   values = [@id]
   db.prepare("delete", sql)
   db.exec_prepared("delete", values)
   db.close()
 end

 def Bounty.all()
   db = PG.connect({dbname: 'bounty_hunter', host: 'localhost'})
   sql = "SELECT * FROM bounties"
   db.prepare("all", sql)
   results = db.exec_prepared("all")
   db.close()
   bounties = results.map {|bounty_hash| Bounty.new(bounty_hash)}
   return bounties
 end

 def Bounty.find(id)
   db = PG.connect({dbname: 'bounty_hunter', host: 'localhost'})
   sql = "SELECT * FROM bounties
     WHERE id = $1"
   values = [id]
   db.prepare("find", sql)
   results_array = db.exec_prepared("find", values)
   bounty_hash = results_array[0]
   bounty = Bounty.new(bounty_hash)
   return bounty
 end


 def Bounty.delete_all()
   db = PG.connect({dbname: 'bounty_hunter', host: 'localhost'})
   sql = "DELETE FROM bounties"
   db.prepare("delete_all", sql)
   db.exec_prepared("delete_all")
   db.close()
 end

end
