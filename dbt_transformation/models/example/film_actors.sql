SELECT * FROM {{ source('postgres', 'film_actors') }}
