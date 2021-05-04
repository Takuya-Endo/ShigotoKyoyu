class UserFailure < Devise::FailureApp

protected

  def redirect_url
    '/homes/about'
  end

end