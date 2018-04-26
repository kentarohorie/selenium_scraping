DB_NAME = '###'

ActiveRecord::Base.establish_connection(
  'adapter' => 'sqlite3',
  'database' => "./db/#{DB_NAME}"
)

