class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |e|
    ExceptionNotifier.notify_exception(e, env: request.env)

    render json: {message: e.message}.to_json, status: 404
  end

  rescue_from StandardError do |e|
    ExceptionNotifier.notify_exception(e, env: request.env)

    render json: {message: e.message}.to_json, status: 500
  end
end
