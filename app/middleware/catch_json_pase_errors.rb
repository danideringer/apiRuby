# Check if JSON send is correct
# we must include in application.rb this line config.middleware.use CatchJsonParseErrors
# and require './app/middleware/catch_json_pase_errors'
class CatchJsonParseErrors
  def initialize(app)
    @app = app
  end

  def call(env)
    begin
      @app.call(env)
    rescue ActionDispatch::ParamsParser::ParseError => error
      if env['HTTP_ACCEPT'] =~ /application\/json/ || env['CONTENT_TYPE'] =~ /application\/json/
        error_output = "There was a problem in the JSON you submitted: #{error}"
        return [
            400, { "Content-Type" => "application/json" },
            [ { error: error_output }.to_json ]
        ]
      else
        raise error
      end
    end
  end
end