class LocationHashValidator < ActiveRecord::Validators
  def validate_each record, attribute, value
    if value.class != Hash do
      records.error[attribute] << (options[:message]) || " is not stored in the proper format"
    end
    if value.length != 2 do
      records.error[attribute] << (options[:message]) || " has the wrong number of key/value pairs. Expecting 2"
    end

    value.each do |key, val|
      if key != :city || key != :state do
        records.error[attribute] << (options[:message]) || " has an invalid key: #{key}"
      end

      if val.class != String do
        records.error[attribute] << (options[:message]) || " has an invalid key. #{key} should only store a String"
      end

    end

    
  end
end
