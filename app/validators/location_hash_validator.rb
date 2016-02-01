class LocationHashValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value

    puts value

    if !value
      record.errors[attribute] << " does not exist"
    end

    if !value.class == Hash
      record.errors[attribute] << " is not stored in the proper format"
    end

    unless value.length == 2 && value.class == Hash
      record.errors[attribute] << " has the wrong number of key/value pairs. Expecting 2"
    end

    value.each do |key, val|
      unless key == "city"|| key == "state"
        record.errors[attribute] << " has an invalid key: #{key}"
      end

      unless val.class == String
        record.errors[attribute] << " has an invalid key. #{key} should only store a String"
      end

    end


  end
end
