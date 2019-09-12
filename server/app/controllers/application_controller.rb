class ApplicationController < ActionController::API
  private

  def error_response errs, status_sym
    render json: {errs: errs}, status: status_sym
    return
  end
end
