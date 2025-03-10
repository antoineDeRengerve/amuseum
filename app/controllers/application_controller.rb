class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_visitor, :ensure_visitor

  private

  def current_visitor
    @current_visitor ||= Visitor.find_by(id: cookies.signed[:visitor_id])
  end

  def ensure_visitor
    @current_visitor ||= begin
      visitor = if cookies.signed[:visitor_id].present?
        Visitor.find_by(id: cookies.signed[:visitor_id])
      else
        Visitor.create!
      end
      # Recreate the cookie to extend the expiration time whenever there is activity
      cookies.signed[:visitor_id] = {
        value: visitor.id,
        expires: 1.week.from_now,
        httponly: true,
        secure: Rails.env.production?,
        same_site: :strict
      }
      visitor
    end
  end
end
