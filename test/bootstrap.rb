unless Document.table_exists?
  ActiveRecord::Base.connection.create_table :documents do |t|
    t.string  :title
    t.integer :user_id
    t.integer :position
    t.boolean :is_valid
  end

  Document.create(:title => "hello", :user_id => 3, :position => 1, :is_valid => true)
  Document.create(:title => "hi", :user_id => 3, :position => 2, :is_valid => true)
  Document.create(:title => "help", :user_id => 2, :position => 3, :is_valid => false)
end