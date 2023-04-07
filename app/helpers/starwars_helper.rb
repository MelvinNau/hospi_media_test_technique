module StarwarsHelper
    require 'net/http'

    def get_starwars_people()
        uri = URI('https://swapi.dev/api/people')
        people = Net::HTTP.get(uri)
        return JSON.parse(people)
    end

    def get_starwars_informations_by_url(url)
        information = Net::HTTP.get(URI(url))
        return JSON.parse(information)
    end
end
