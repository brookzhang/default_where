module DefaultWhere
  module Equal

    def equal_scope(params)
      where_string = ''
      where_hash = {}

      params.each do |key, value|
        where_string << " AND #{key} = :#{key}"
        where_hash.merge! key.to_sym => value
      end

      where_string.sub!(/^ AND /, '') if where_string.start_with?(' AND ')
      condition = [where_string, where_hash]

      where(condition)
    end

  end
end

