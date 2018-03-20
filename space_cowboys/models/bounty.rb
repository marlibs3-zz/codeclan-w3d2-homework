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



end
#   def save
#     # save all the info about this object in a DB
#     db = PG.connect( { dbname: 'pizza_shop', host: 'localhost'} )
#
#     pretty_sql = "
#     INSERT INTO pizza_orders
#       (name, color, pizza_type, quantity)
#       VALUES
#         ($1,$2,$3,$4)
#       ;
#     "
#     values = [@name, @color, @pizza_type, @quantity]
#
#     db.prepare("save_it", pretty_sql)
#     db.exec_prepared("save_it", values)
#
#     db.close()
#   end
#
#   def PizzaOrder.all
#       db = PG.connect( { dbname: "pizza_shop", host: "localhost" })
#
#       sql = "SELECT * FROM pizza_orders ORDER BY name;"
#       db.prepare("get all", sql)
#       orders = db.exec_prepared("get all")
#       # binding.pry
#
#       db.close()
#
#       pizza_order_objects = orders.map { |order_hash| PizzaOrder.new(order_hash) }
#
#       return pizza_order_objects
#   end
#
#
#   def PizzaOrder.delete_all
#       db = PG.connect( { dbname: "pizza_shop", host: "localhost" })
#
#       sql = "DELETE FROM pizza_orders;"
#
#       db.prepare("del all", sql)
#       orders = db.exec_prepared("del all")
#
#       db.close()
#   end
#
#   def update()
#     db = PG.connect( { dbname: "pizza_shop", host: "localhost" })
#
#     sql = "
#       UPDATE pizza_orders
#       SET (name, color, pizza_type, quantity)
#       = ($1,$2,$3,$4)
#       WHERE id = $5
#       ;
#     "
#     values = [@name, @color, @pizza_type, @quantity, @id]
#
#     db.prepare("update", sql)
#     db.exec_prepared("update", values)
#
#     db.close()
#   end
#
#
#
#   def delete()
#     db = PG.connect( { dbname: "pizza_shop", host: "localhost" })
#
#     sql = " DELETE FROM pizza_orders
#             WHERE id = $1
#       ;
#     "
#     values = [@id]
#
#     db.prepare("delete", sql)
#     db.exec_prepared("delete", values)
#
#     db.close()
#   end
#
#
# end
