class JsonValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, json)
    unless valid_json?(json)
      record.errors.add(attribute, 'must be a valid JSON')
    end
  end

  private

    def valid_json?(string)
      begin
        !!JSON.parse(string)
      rescue
        false
      end
    end
end
