class Subdomain
  def self.matches?(request)
    case request.subdomain
      when 'www', '', nil, 'ftp'
        false
      else
        true
      end
  end  
end  