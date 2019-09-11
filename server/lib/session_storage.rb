module SessionStorage
  def set key, value
    connection = ActiveRecord::Base.connection
    pg_result = connection.execute("
      INSERT INTO sessions(session_id, value) VALUES ('#{key}', '#{value}')
    ")
    if pg_result.error_message == ''
      return Result.new()
    end
    Result.new([pg_result.error_message], nil)
  end

  def get key
    connection = ActiveRecord::Base.connection
    r = connection.select_one("
      SELECT session_id, value FROM sessions WHERE session_id = '#{key}'
    ")
    if r.nil?
      return Result.new()
    end
    Result.new([], r['value'])
  end

  def remove key
    connection = ActiveRecord::Base.connection
    pg_result = connection.execute("
      DELETE FROM sessions WHERE session_id = '#{key}'
    ")
    if pg_result.error_message == ''
      return Result.new()
    end
    Result.new([pg_result.error_message], nil)
  end

  module_function :set, :get, :remove
end
