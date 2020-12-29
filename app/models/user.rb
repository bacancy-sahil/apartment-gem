class User < ApplicationRecord
  after_create :create_tenant
  after_destroy :delete_tenant
  has_many :workouts

  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, request_keys: [:subdomain]
 # Apartment::Tenant.switch!(session[:subdomain])
  validates :email, uniqueness: true

  def create_tenant
    Apartment::Tenant.create(subdomain)
  end

  def delete_tenant
    Apartment::Tenant.drop(subdomain)
  end

  # def self.switch(subdomain)
  #   Apartment::Tenant.switch(subdomain)
  # end

end
