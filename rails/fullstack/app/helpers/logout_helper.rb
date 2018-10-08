
module LogoutHelper
  def logout_url
    domain = 'al-un-dev.eu.auth0.com'
    client_id = 'ObQqZ8cA6qe17h936NJW4B6nfFWjYRhU'
    request_params = {
      returnTo: 'http://localhost:3000',
      client_id: client_id
    }
    # domain = Rails.application.secrets.auth0_domain
    # client_id = Rails.application.secrets.auth0_client_id
    # request_params = {
    #   returnTo: root_url,
    #   client_id: client_id
    # }

    URI::HTTPS.build(host: domain, path: '/v2/logout', query: to_query(request_params))
  end

  private

  def to_query(hash)
    hash.map { |k, v| "#{k}=#{URI.escape(v)}" unless v.nil? }.reject(&:nil?).join('&')
  end
end