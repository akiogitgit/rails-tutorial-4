class ApplicationController < ActionController::Base
  def hello
    render html: "home!!!" # これでviews必要ない！
  end
end
