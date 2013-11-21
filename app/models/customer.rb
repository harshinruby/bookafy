class Customer < ActiveRecord::Base
  belongs_to :client

  has_many :appointments
  
  belongs_to :booker, :class_name => 'Appointment', :foreign_key => 'booker_id'
  
  accepts_nested_attributes_for :appointments


 def self.import(file, user_id)
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    customer = find_by_id(row["id"]) || new
    customer.attributes = row.to_hash.slice("title", "first_name", "last_name", "address", "city", "state", "zip_code", "dob", "mobile", "email").merge(client_id: user_id)
    customer.save!
  end
end

def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
  when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
  when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
  when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
  else raise "Unknown file type: #{file.original_filename}"
  end
end

def self.search(search)
  if search
    #find(:all, :conditions => ['first_name LIKE ?', "%#{search}%"]) 
    #find(:all, :conditions => ['email LIKE ?', "%#{search}%"])
    #find(:all, :conditions => ['last_name LIKE ?', "%#{search}%"])
    find(:all, :conditions => ['address LIKE :search OR city LIKE :search OR dob LIKE :search OR email LIKE :search OR first_name LIKE :search OR last_name LIKE :search OR mobile LIKE :search OR state LIKE :search OR title LIKE :search OR zip_code LIKE :search ', {:search => "%#{search}%"}])
  else
    find(:all)
  end
end

def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |customer|
      csv << customer.attributes.values_at(*column_names)
    end
  end
end

end
