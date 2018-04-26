ActiveRecord::Migration.class_eval do
  unless ActiveRecord::Base.connection.table_exists? 'links'
    create_table :links do |t|
      t.string :link
      t.string :category_name
    end
  end
end
