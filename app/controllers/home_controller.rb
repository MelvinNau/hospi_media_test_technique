class HomeController < ApplicationController
    include StarwarsHelper

    def index
        peoples = get_starwars_people()
        @data = []
        @all_films = []
        peoples['results'].each do |people|
            if  people['mass'] > "75"
                films = []
                people['films'].each do |film_url|
                    info_film = get_starwars_informations_by_url(film_url)
                    films.append(info_film['title'])
                    @all_films.append({
                        title: info_film['title'],
                        episode_id: info_film['episode_id'],
                        opening: info_film['opening_crawl'],
                        release: info_film['release_date']
                    })
                end
                information = {
                    name: people['name'],
                    mass: people['mass'],
                    planet: get_starwars_informations_by_url(people['homeworld'])['name'],
                    films: films,
                }
                @data.append(information)
            end
        end
        @all_films =  @all_films.uniq.sort_by { |film| film[:episode_id] }
    end
end
