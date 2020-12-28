# use for domain
class SubdomainConstraint
  def self.matches?(request)
    subdomains = %w[www admin]
    request.subdomain.present? && !subdomains.include?(request.subdomain)
  end
end
