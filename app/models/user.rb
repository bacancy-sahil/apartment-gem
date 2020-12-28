class User < ApplicationRecord
  after_create :create_tenant
  before_destroy :delete_tenant

  has_many :workouts

  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, request_keys: [:subdomain]

  validates :email, uniqueness: true

  def create_tenant
    Apartment::Tenant.create(subdomain)
  end

  def delete_tenant
    Apartment::Tenant.drop(subdomain)
  end

end
