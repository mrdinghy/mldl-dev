class Appissue < ActiveRecord::Base



  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |appissue|
        csv << appissue.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Appissue.create! row.to_hash
    end
  end


end
