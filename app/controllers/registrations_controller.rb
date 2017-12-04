class RegistrationsController < Devise::RegistrationsController

  def create
    super do
      Registration.create(registration_id: resource.id)
    end
  end


  protected

  def after_sign_up_path_for(resource)
    edit_user_path(resource.user)
  end

end
