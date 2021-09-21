require 'pg'

def set_up_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("TRUNCATE spaces;")  
end